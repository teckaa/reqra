// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future createAppLinks() async {
  // Add your function code here!
  // Create a list of country and capital in json format
  List<Map<String, dynamic>> items = [
    {
      "created_at": DateTime.now(),
      "uuid": "1",
      "app_store_name": "Web App",
      "app_store_link": "https://example.com",
      "app_store_desc":
          "Make sure to add your website link, allowing users to access your app online. It serves as the entry point to your web-based application.",
      "app_store_image":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699265847/Reqra-App/App-Store-Link/The_web_b4xezd.png",
      "app_store_status": true
    },
    {
      "created_at": DateTime.now(),
      "uuid": "2",
      "app_store_name": "Google Play Store",
      "app_store_link":
          "https://play.google.com/store/apps/details?id=com.example.app",
      "app_store_desc":
          "Include your Google Play Store link for Android users. It's vital for the extensive Android user base, ensuring your app is accessible to a wide audience.",
      "app_store_image":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699265844/Reqra-App/App-Store-Link/Play_store_xhp4w5.png",
      "app_store_status": true
    },
    {
      "created_at": DateTime.now(),
      "uuid": "3",
      "app_store_name": "Apple App Store",
      "app_store_link": "https://apps.apple.com/us/app/example-app/id123456789",
      "app_store_desc":
          "Include your Apple App Store link to reach millions of iOS users. It's essential for iPhone and iPad users to discover and download your app.",
      "app_store_image":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699265837/Reqra-App/App-Store-Link/MacOS_store_eyo0y2.png",
      "app_store_status": true
    },
    {
      "created_at": DateTime.now(),
      "uuid": "4",
      "app_store_name": "Windows Store",
      "app_store_link":
          "https://apps.microsoft.com/store/detail/example-app/id123456789",
      "app_store_desc":
          "Include your Windows Store link to target Windows users. It ensures your app is visible and downloadable for Windows-based devices.",
      "app_store_image":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699265842/Reqra-App/App-Store-Link/Microsoft_store_tpskiw.png",
      "app_store_status": false
    },
    {
      "created_at": DateTime.now(),
      "uuid": "5",
      "app_store_name": "Linux Store",
      "app_store_link": "Linux app stores vary and use specific package names.",
      "app_store_desc":
          "When available, include your Linux Store link for Linux users. It grants access to users of various Linux distributions, expanding your app's reach.",
      "app_store_image":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699265834/Reqra-App/App-Store-Link/Linus_store_gbnijv.png",
      "app_store_status": false
    },
    {
      "created_at": DateTime.now(),
      "uuid": "6",
      "app_store_name": "Mac OS App Store",
      "app_store_link":
          "Mac App Store URLs are private, accessible only through the app.",
      "app_store_desc":
          "When available, include your Mac OS App Store link to tap into the macOS user market. It's crucial for Mac users to find and install your app.",
      "app_store_image":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699265837/Reqra-App/App-Store-Link/MacOS_store_eyo0y2.png",
      "app_store_status": false
    }
  ];

  // Get the Firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a batch object
  WriteBatch batch = firestore.batch();

  // Loop through the countries list and add each document to the batch
  for (var item in items) {
    // Create a new document reference with a random ID
    DocumentReference docRef = firestore.collection("dw_app_store_links").doc();

    // Add the data to the document
    batch.set(docRef, item);
  }

  try {
    // Commit the batch operation
    await batch.commit();
    print('Batch insertion successful.');
  } catch (e) {
    // Handle errors
    print('Error: $e');
  }
}

void main() {
  createAppLinks();
}
