import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD8QlWsOcMg5-YJnjA1xM3XbpMRlp2g-KI",
            authDomain: "reqra-14132.firebaseapp.com",
            projectId: "reqra-14132",
            storageBucket: "reqra-14132.appspot.com",
            messagingSenderId: "267638534045",
            appId: "1:267638534045:web:a5ad1d5100c13b62dd0974",
            measurementId: "G-SZJV4M5MLT"));
  } else {
    await Firebase.initializeApp();
  }
}
