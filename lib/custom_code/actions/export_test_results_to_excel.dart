// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart'; // Thư viện để tạo file Excel
import 'package:path_provider/path_provider.dart';

Future<String> exportTestResultsToExcel() async {
  try {
    // Lấy dữ liệu từ Firestore collection `test`
    QuerySnapshot testSnapshot =
        await FirebaseFirestore.instance.collection('test').get();

    if (testSnapshot.docs.isEmpty) {
      return 'Không có dữ liệu trong collection test';
    }

    // Tạo workbook Excel
    var excel = Excel.createExcel();

    // Duyệt qua từng test
    for (var testDoc in testSnapshot.docs) {
      Map<String, dynamic>? testData = testDoc.data() as Map<String, dynamic>?;
      if (testData == null) continue;

      // Lấy tên bài học (lesson) để đặt tên sheet
      String sheetName = testData['lesson'] ?? testDoc.id;

      // Đảm bảo tên sheet không quá dài
      if (sheetName.length > 31) {
        sheetName = sheetName.substring(0, 31);
      }

      // Tạo sheet mới
      Sheet sheet = excel[sheetName];

      // Lấy dữ liệu từ collection `results` liên kết với `test`
      QuerySnapshot resultsSnapshot = await FirebaseFirestore.instance
          .collection('results')
          .where('test',
              isEqualTo:
                  FirebaseFirestore.instance.collection('test').doc(testDoc.id))
          .get();

      if (resultsSnapshot.docs.isEmpty) {
        continue; // Nếu không có result cho test này, bỏ qua
      }

      // Tạo tiêu đề cột từ trường của collection `results`
      List<String> headers = [
        'studentName',
        'schoolName',
        'schoolYear',
        'total',
        'correct',
        'incorrect',
      ];

      // Lấy một kết quả để xác định số lượng câu trả lời
      Map<String, dynamic>? firstResult =
          resultsSnapshot.docs.first.data() as Map<String, dynamic>?;
      List<dynamic> answers = firstResult?['answers'] ?? [];
      for (int i = 0; i < answers.length; i++) {
        headers.add('Answer ${i + 1}');
      }

      // Thêm tiêu đề vào sheet
      sheet.appendRow(headers);

      // Duyệt qua từng result và thêm dữ liệu vào sheet
      for (var resultDoc in resultsSnapshot.docs) {
        Map<String, dynamic>? resultData =
            resultDoc.data() as Map<String, dynamic>?;
        if (resultData == null) continue;

        // Dòng dữ liệu
        List<dynamic> row = [
          resultData['studentName'] ?? '',
          resultData['schoolName'] ?? '',
          resultData['schoolYear'] ?? '',
          resultData['total'] ?? 0,
          resultData['correct'] ?? 0,
          resultData['incorrect'] ?? 0,
        ];

        // Thêm câu trả lời (answers) vào dòng
        List<dynamic> resultAnswers = resultData['answers'] ?? [];
        for (int i = 0; i < answers.length; i++) {
          row.add(i < resultAnswers.length ? resultAnswers[i] : '');
        }

        // Đưa dòng vào sheet
        sheet.appendRow(row);
      }
    }

    // Lưu file vào thư mục Documents
    final directory =
        await getApplicationDocumentsDirectory(); // Lấy thư mục Documents
    final path = '${directory.path}/test_results.xlsx';
    final file = File(path);

    // Ghi dữ liệu Excel vào file
    await file.writeAsBytes(excel.encode()!);

    // Trả về đường dẫn file
    return path;
  } catch (e) {
    // Bắt lỗi và trả về thông báo lỗi
    return 'Lỗi khi xuất dữ liệu: $e';
  }
}
