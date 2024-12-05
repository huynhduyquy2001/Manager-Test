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
import 'dart:io' if (dart.library.html) 'dart:html' as html;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:excel/excel.dart'; // Thư viện để tạo file Excel

Future<String> exportTestsToExcel(String collectionName) async {
  try {
    // Lấy dữ liệu từ Firestore
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection(collectionName).get();

    if (snapshot.docs.isEmpty) {
      return 'Không có dữ liệu trong collection này';
    }

    // Tạo workbook để chứa các sheet
    var excel = Excel.createExcel();

    for (var testDoc in snapshot.docs) {
      Map<String, dynamic>? testData = testDoc.data() as Map<String, dynamic>?;

      // Lấy danh sách questions
      List<dynamic> questions = testData?['questions'] ?? [];

      if (questions.isEmpty) {
        continue; // Nếu test không có câu hỏi thì bỏ qua
      }

      // Lấy tên lesson, nếu không có thì dùng id
      String sheetName = testData?['lesson'] ?? testDoc.id;

      // Đảm bảo tên sheet hợp lệ (Excel không hỗ trợ tên quá dài hoặc có ký tự đặc biệt)
      if (sheetName.length > 31) {
        sheetName = sheetName.substring(0, 31); // Cắt ngắn tên sheet nếu cần
      }
      Sheet sheet = excel[sheetName];

      // Tạo tiêu đề cột
      List<String> headers = [
        'Index',
        'Title',
        'Answer A',
        'Answer B',
        'Answer C',
        'Answer D',
        'Answer',
        'Type'
      ];
      sheet.appendRow(headers);

      // Thêm dữ liệu từng câu hỏi
      for (int i = 0; i < questions.length; i++) {
        Map<String, dynamic> question = questions[i] as Map<String, dynamic>;

        // Kiểm tra và đảm bảo options tồn tại và là danh sách
        List<dynamic> options = question['options'] ?? [];
        if (options.isEmpty) {
          options = ['', '', '', '']; // Tạo danh sách rỗng nếu không có dữ liệu
        }

        List<dynamic> row = [
          i + 1, // Index
          question['title'] ?? '', // Title
          options.length > 0 ? options[0] : '', // Answer A
          options.length > 1 ? options[1] : '', // Answer B
          options.length > 2 ? options[2] : '', // Answer C
          options.length > 3 ? options[3] : '', // Answer D
          question['answer'] ?? '', // Answer
          question['type'] ?? '' // Type
        ];
        sheet.appendRow(row);
      }
    }

    if (kIsWeb) {
      // Nếu chạy trên web
      // final bytes = excel.encode();
      // final blob = html.Blob([bytes!]);
      // final url = html.Url.createObjectUrlFromBlob(blob);
      // final anchor = html.AnchorElement(href: url)
      //   ..setAttribute("download", "$collectionName.xlsx")
      //   ..click();
      // html.Url.revokeObjectUrl(url);

      return 'Excel file has been downloaded successfully.';
    } else {
      // Nếu chạy trên mobile/desktop
      final directory =
          await getApplicationDocumentsDirectory(); // Lấy thư mục Documents
      final path =
          '${directory.path}/$collectionName.xlsx'; // Tạo đường dẫn file
      final file = File(path);

      // Ghi dữ liệu vào file
      await file.writeAsBytes(excel.encode()!);

      // Trả về đường dẫn file
      return path;
    }
  } catch (e) {
    return 'Lỗi: $e';
  }
}
