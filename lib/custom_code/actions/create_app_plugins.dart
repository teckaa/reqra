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

Future createAppPlugins() async {
  // Add your function code here!
  // Create a list of country and capital in json format
  List<Map<String, dynamic>> items = [
    {
      "created_at": DateTime.now(),
      "uuid": "1",
      "plugin_name": "Giftcards",
      "plugin_desc": "Launch an app for buying and selling GiftCards."
    },
    {
      "created_at": DateTime.now(),
      "uuid": "2",
      "plugin_name": "Fintech",
      "plugin_desc":
          "Enable users to transfers and withdrawals fund via online banking."
    },
    {
      "created_at": DateTime.now(),
      "uuid": "3",
      "plugin_name": "Ecommerce",
      "plugin_desc":
          "Create an eCommerce web store that is optimized for conversion."
    },
    {
      "created_at": DateTime.now(),
      "uuid": "4",
      "plugin_name": "Cryptos",
      "plugin_desc":
          "Trade BTC, ETH, USDT, and more cryptocurrencies with our app."
    },
    {
      "created_at": DateTime.now(),
      "uuid": "5",
      "plugin_name": "Bill Payments",
      "plugin_desc":
          "Let users pay utility bills, top up airtime, manage cable TV and lot more"
    }
  ];

  // Get the Firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a batch object
  WriteBatch batch = firestore.batch();

  // Loop through the countries list and add each document to the batch
  for (var item in items) {
    // Create a new document reference with a random ID
    DocumentReference docRef = firestore.collection("dw_plugins").doc();

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
  createAppPlugins();
}
