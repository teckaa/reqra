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

Future createAppCustomEmailTemplates() async {
  // Add your function code here!
  // Create a list of country and capital in json format
  List<Map<String, dynamic>> items = [
    {
      "created_at": DateTime.now(),
      "uuid": "5",
      "heading":
          "We\u0027re sad to see you go. Your account has been deactivated. If this was a mistake, contact support.",
      "subject": "Account Deactivation",
      "name": "Account Deactivation",
      "recipient": "Customers",
      "type": "Account",
      "content":
          "We\u0027re sad to see you go. Your account has been deactivated. If this was a mistake, contact support.",
      "status": true
    },
    {
      "created_at": DateTime.now(),
      "uuid": "9",
      "heading":
          "You\u0027ve just added an extra layer of security to your transactions. Your Transaction PIN has been created successfully. Secure payments, here you come!",
      "subject": "Your Transaction PIN Has Been Created",
      "name": "Creating Transaction PIN",
      "recipient": "Customers",
      "type": "Security",
      "content":
          "You\u0027ve just added an extra layer of security to your transactions. Your Transaction PIN has been created successfully. Secure payments, here you come!",
      "status": true
    },
    {
      "created_at": DateTime.now(),
      "uuid": "6",
      "heading":
          "Congratulations! You\u0027ve successfully created a Security PIN for your account. Your account is now more secure than ever before.",
      "subject": "Your Security PIN Has Been Created",
      "name": "Creating Security PIN",
      "recipient": "Customers",
      "type": "Security",
      "content":
          "Congratulations! You\u0027ve successfully created a Security PIN for your account. Your account is now more secure than ever before.",
      "status": true
    },
    {
      "created_at": DateTime.now(),
      "uuid": "10",
      "heading":
          "We appreciate your commitment to security. Your Transaction PIN has been updated. Now, enjoy safe and worry-free transactions within our app.",
      "subject": "Your Transaction PIN Has Been Updated",
      "name": "Updating Transaction PIN",
      "recipient": "Customers",
      "type": "Security",
      "content":
          "We appreciate your commitment to security. Your Transaction PIN has been updated. Now, enjoy safe and worry-free transactions within our app.",
      "status": true
    },
    {
      "created_at": DateTime.now(),
      "uuid": "12",
      "heading":
          "Your password has been changed successfully. Your account is now more secure. If you didn\u0027t make this change, please contact support immediately.",
      "subject": "Password Change Confirmation",
      "name": "Change of Password",
      "recipient": "Customers",
      "type": "Security",
      "content":
          "Your password has been changed successfully. Your account is now more secure. If you didn\u0027t make this change, please contact support immediately.",
      "status": true
    },
    {
      "created_at": DateTime.now(),
      "uuid": "11",
      "heading":
          "For your safety, it\u0027s essential to reset your Transaction PIN periodically. To change your PIN and keep your product purchases secure, click the link below.",
      "subject": "Reset Your Transaction PIN",
      "name": "Resetting of Transaction PIN",
      "recipient": "Customers",
      "type": "Security",
      "content":
          "For your safety, it\u0027s essential to reset your Transaction PIN periodically. To change your PIN and keep your product purchases secure, click the link below.",
      "status": true
    },
    {
      "created_at": DateTime.now(),
      "uuid": "8",
      "heading":
          "Your account security is our priority. Reset your Security PIN to maintain a secure login. Click on the link below to reset your PIN and continue enjoying our services.",
      "subject": "Reset Your Security PIN",
      "name": "Resetting of Security PIN",
      "recipient": "Customers",
      "type": "Security",
      "content":
          "Your account security is our priority. Reset your Security PIN to maintain a secure login. Click here to reset your PIN and continue enjoying our services.",
      "status": true
    },
    {
      "created_at": DateTime.now(),
      "uuid": "7",
      "heading":
          "Great news! Your Security PIN has been updated successfully. Thank you for taking the initiative to keep your account secure.",
      "subject": "Your Security PIN Has Been Updated",
      "name": "Updating Security PIN",
      "recipient": "Customers",
      "type": "Security",
      "content":
          "Great news! Your Security PIN has been updated successfully. Thank you for taking the initiative to keep your account secure.",
      "status": true
    },
    {
      "created_at": DateTime.now(),
      "uuid": "3",
      "heading":
          "No worries! Reset your password now and regain access to your account.",
      "subject": "Forgot Your Password?",
      "name": "Forgot Password",
      "recipient": "Customers",
      "type": "Authentication",
      "content":
          "No worries! Reset your password now and regain access to your account.",
      "status": true
    },
    {
      "created_at": DateTime.now(),
      "uuid": "1",
      "heading": "Recent activity on your account? Read on to learn more.",
      "subject": "Account Login Notification",
      "name": "Login",
      "recipient": "Customers",
      "type": "Authentication",
      "content":
          "We wanted to inform you that there has been recent activity on your account. If this was you, no further action is needed.\n\nIf you didn\u0027t log in recently or have any concerns about your account security, please reach out to our support team.\n\nBest regards,\n\nThe Support Team.",
      "status": true
    },
    {
      "created_at": DateTime.now(),
      "uuid": "4",
      "heading":
          "Just one more step! Click to verify your email and enjoy full access.",
      "subject": "Verify Your Email Address",
      "name": "Account Verification",
      "recipient": "Customers",
      "type": "Authentication",
      "content":
          "Just one more step! Click to verify your email and enjoy full access",
      "status": true
    },
    {
      "created_at": DateTime.now(),
      "uuid": "2",
      "heading":
          "Thank you for joining us! Start your journey now by completing your profile.",
      "subject": "Welcome to Teckaa.",
      "name": "Register",
      "recipient": "Customers",
      "type": "Authentication",
      "content":
          "Thank you for joining us! Start your journey now by completing your profile.",
      "status": true
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
        firestore.collection("dw_email_custom_templates").doc();

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
  createAppCustomEmailTemplates();
}
