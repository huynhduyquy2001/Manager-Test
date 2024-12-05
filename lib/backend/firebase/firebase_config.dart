import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAOVH0xPVQXqvF9qZEnbtFV3KHKPja4Oto",
            authDomain: "manage-test-b2426.firebaseapp.com",
            projectId: "manage-test-b2426",
            storageBucket: "manage-test-b2426.firebasestorage.app",
            messagingSenderId: "695443550376",
            appId: "1:695443550376:web:68fa65e658731c12fad29d",
            measurementId: "G-S3V3JCDG1V"));
  } else {
    await Firebase.initializeApp();
  }
}
