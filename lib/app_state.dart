import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_currentUser')) {
        try {
          final serializedData = prefs.getString('ff_currentUser') ?? '{}';
          _currentUser =
              CurrentUserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  CurrentUserStruct _currentUser = CurrentUserStruct();
  CurrentUserStruct get currentUser => _currentUser;
  set currentUser(CurrentUserStruct value) {
    _currentUser = value;
    prefs.setString('ff_currentUser', value.serialize());
  }

  void updateCurrentUserStruct(Function(CurrentUserStruct) updateFn) {
    updateFn(_currentUser);
    prefs.setString('ff_currentUser', _currentUser.serialize());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
