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

Future createAppBillProviders() async {
  // Add your function code here!
  // Create a list of country and capital in json format
  List<Map<String, dynamic>> items = [
    {
      "created_at": DateTime.now(),
      "provider_biller_code": "BIL102",
      "provider_default_commission": "0.03",
      "provider_status": true,
      "provider_logo":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699266837/Reqra-App/Provider/Glo_ykagbo.png",
      "provider_biller_name": "GLO VTU",
      "provider_short_name": "GLO VTU",
      "provider_name": "GLO Nigeria",
      "provider_item_code": "AT133",
      "provider_service_type": "Airtime",
      "provider_transfer_fee": 0,
      "provider_currency": "NGN",
      "provider_country": "NG"
    },
    {
      "created_at": DateTime.now(),
      "provider_biller_code": "BIL109",
      "provider_default_commission": "0.03",
      "provider_status": true,
      "provider_logo":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699266837/Reqra-App/Provider/Glo_ykagbo.png",
      "provider_biller_name": "",
      "provider_short_name": "",
      "provider_name": "GLO Nigeria",
      "provider_item_code": "",
      "provider_service_type": "Data Bundle",
      "provider_transfer_fee": 0,
      "provider_currency": "NGN",
      "provider_country": "NG"
    },
    {
      "created_at": DateTime.now(),
      "provider_biller_code": "BIL108",
      "provider_default_commission": "0.025",
      "provider_status": true,
      "provider_logo":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699266867/Reqra-App/Provider/MTN_j9osug.png",
      "provider_biller_name": "",
      "provider_short_name": "",
      "provider_name": "MTN Nigeria",
      "provider_item_code": "",
      "provider_service_type": "Data Bundle",
      "provider_transfer_fee": 0,
      "provider_currency": "NGN",
      "provider_country": "NG"
    },
    {
      "created_at": DateTime.now(),
      "provider_biller_code": "BIL099",
      "provider_default_commission": "0.025",
      "provider_status": true,
      "provider_logo":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699266867/Reqra-App/Provider/MTN_j9osug.png",
      "provider_biller_name": "AIRTIME",
      "provider_short_name": "MTN VTU",
      "provider_name": "MTN Nigeria",
      "provider_item_code": "AT099",
      "provider_service_type": "Airtime",
      "provider_transfer_fee": 0,
      "provider_currency": "NGN",
      "provider_country": "NG"
    },
    {
      "created_at": DateTime.now(),
      "provider_biller_code": "BIL126",
      "provider_default_commission": "0.3",
      "provider_status": true,
      "provider_logo":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699266884/Reqra-App/Provider/Swift_Network_s8s7an.png",
      "provider_biller_name": "SWIFT TOP UP",
      "provider_short_name": "SWIFT TOP UP",
      "provider_name": "SWIFT Top Up",
      "provider_item_code": "IS210",
      "provider_service_type": "Airtime",
      "provider_transfer_fee": 0,
      "provider_currency": "NGN",
      "provider_country": "NG"
    },
    {
      "created_at": DateTime.now(),
      "provider_biller_code": "BIL110",
      "provider_default_commission": "0.03",
      "provider_status": true,
      "provider_logo":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699266824/Reqra-App/Provider/Airtel_d4kzuo.png",
      "provider_biller_name": "",
      "provider_short_name": "",
      "provider_name": "AIRTEL Nigeria",
      "provider_item_code": "",
      "provider_service_type": "Data Bundle",
      "provider_transfer_fee": 0,
      "provider_currency": "NGN",
      "provider_country": "NG"
    },
    {
      "created_at": DateTime.now(),
      "provider_biller_code": "BIL100",
      "provider_default_commission": "0.03",
      "provider_status": true,
      "provider_logo":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699266824/Reqra-App/Provider/Airtel_d4kzuo.png",
      "provider_biller_name": "AIRTEL VTU",
      "provider_short_name": "AIRTEL VTU",
      "provider_name": "AIRTEL Nigeria",
      "provider_item_code": "AT100",
      "provider_service_type": "Airtime",
      "provider_transfer_fee": 0,
      "provider_currency": "NGN",
      "provider_country": "NG"
    },
    {
      "created_at": DateTime.now(),
      "provider_biller_code": "BIL103",
      "provider_default_commission": "0.03",
      "provider_status": true,
      "provider_logo":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699266820/Reqra-App/Provider/9Mobile_ndrvpc.png",
      "provider_biller_name": "9MOBILE VTU",
      "provider_short_name": "9MOBILE VTU",
      "provider_name": "9MOBILE Nigeria",
      "provider_item_code": "AT134",
      "provider_service_type": "Airtime",
      "provider_transfer_fee": 0,
      "provider_currency": "NGN",
      "provider_country": "NG"
    },
    {
      "created_at": DateTime.now(),
      "provider_biller_code": "BIL111",
      "provider_default_commission": "0.03",
      "provider_status": true,
      "provider_logo":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699266820/Reqra-App/Provider/9Mobile_ndrvpc.png",
      "provider_biller_name": "",
      "provider_short_name": "",
      "provider_name": "9MOBILE Nigeria",
      "provider_item_code": "",
      "provider_service_type": "Data Bundle",
      "provider_transfer_fee": 0,
      "provider_currency": "NGN",
      "provider_country": "NG"
    },
    {
      "created_at": DateTime.now(),
      "provider_biller_code": "BIL127",
      "provider_default_commission": "0.3",
      "provider_status": true,
      "provider_logo":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699266864/Reqra-App/Provider/LCC_zuy5ow.png",
      "provider_biller_name": "",
      "provider_short_name": "",
      "provider_name": "LCC",
      "provider_item_code": "",
      "provider_service_type": "Transport",
      "provider_transfer_fee": 100,
      "provider_currency": "NGN",
      "provider_country": "NG"
    },
    {
      "created_at": DateTime.now(),
      "provider_biller_code": "BIL121",
      "provider_default_commission": "0.3",
      "provider_status": true,
      "provider_logo":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699266830/Reqra-App/Provider/DsTv_xv63lz.png",
      "provider_biller_name": "",
      "provider_short_name": "",
      "provider_name": "DSTV",
      "provider_item_code": "",
      "provider_service_type": "Cable TV",
      "provider_transfer_fee": 100,
      "provider_currency": "NGN",
      "provider_country": "NG"
    },
    {
      "created_at": DateTime.now(),
      "provider_biller_code": "BIL122",
      "provider_default_commission": "0.3",
      "provider_status": true,
      "provider_logo":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699266841/Reqra-App/Provider/GoTv_ftuzly.png",
      "provider_biller_name": "",
      "provider_short_name": "",
      "provider_name": "GOTV",
      "provider_item_code": "",
      "provider_service_type": "Cable TV",
      "provider_transfer_fee": 100,
      "provider_currency": "NGN",
      "provider_country": "NG"
    },
    {
      "created_at": DateTime.now(),
      "provider_biller_code": "BIL129",
      "provider_default_commission": "0.3",
      "provider_status": true,
      "provider_logo":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699266851/Reqra-App/Provider/ipNX_ane8wb.png",
      "provider_biller_name": "",
      "provider_short_name": "",
      "provider_name": "ipNX",
      "provider_item_code": "",
      "provider_service_type": "Internet/Wifi",
      "provider_transfer_fee": 100,
      "provider_currency": "NGN",
      "provider_country": "NG"
    },
    {
      "created_at": DateTime.now(),
      "provider_biller_code": "BIL121",
      "provider_default_commission": "0.3",
      "provider_status": true,
      "provider_logo":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699266874/Reqra-App/Provider/Showmax_a1xvzm.png",
      "provider_biller_name": "",
      "provider_short_name": "",
      "provider_name": "Showmax",
      "provider_item_code": "",
      "provider_service_type": "Cable TV",
      "provider_transfer_fee": 100,
      "provider_currency": "NGN",
      "provider_country": "NG"
    },
    {
      "created_at": DateTime.now(),
      "provider_biller_code": "BIL124",
      "provider_default_commission": "0.3",
      "provider_status": true,
      "provider_logo":
          "https://res.cloudinary.com/dodx3scuh/image/upload/v1699266877/Reqra-App/Provider/Smile_cirub2.png",
      "provider_biller_name": "",
      "provider_short_name": "",
      "provider_name": "SMILE Nigeria",
      "provider_item_code": "",
      "provider_service_type": "Internet/Wifi",
      "provider_transfer_fee": 100,
      "provider_currency": "NGN",
      "provider_country": "NG"
    }
  ];

  // Get the Firestore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a batch object
  WriteBatch batch = firestore.batch();

  // Loop through the countries list and add each document to the batch
  for (var item in items) {
    // Create a new document reference with a random ID
    DocumentReference docRef =
        firestore.collection("billpayment_providers").doc();

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
  createAppBillProviders();
}
