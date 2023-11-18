import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          child: Center(
            child: Image.asset(
              'assets/images/Reqra_Rectangle_Logo_Blue.png',
              width: 130.0,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Register': (data) async => ParameterData(
        allParams: {
          'userReferral': getParameter<DocumentReference>(data, 'userReferral'),
        },
      ),
  'ForgetPassword': ParameterData.none(),
  'ResetPassword': ParameterData.none(),
  'Dashboard': (data) async => ParameterData(
        allParams: {
          'defaultDashboard': getParameter<String>(data, 'defaultDashboard'),
        },
      ),
  'OrderSuccessful': (data) async => ParameterData(
        allParams: {
          'orderAmount': getParameter<String>(data, 'orderAmount'),
        },
      ),
  'OrderActivities': ParameterData.none(),
  'ReadOrder': (data) async => ParameterData(
        allParams: {
          'orderRef': getParameter<DocumentReference>(data, 'orderRef'),
        },
      ),
  'Welcome': ParameterData.none(),
  'Notifications': ParameterData.none(),
  'Language': ParameterData.none(),
  'ListOfCryptoOrders': ParameterData.none(),
  'CashCard': ParameterData.none(),
  'ListOfWallets': ParameterData.none(),
  'Settings': ParameterData.none(),
  'CreateOrder': (data) async => ParameterData(
        allParams: {
          'orderType': getParameter<String>(data, 'orderType'),
        },
      ),
  'Login': ParameterData.none(),
  'Profile': ParameterData.none(),
  'ChangePassword': ParameterData.none(),
  'PersonalInformation': ParameterData.none(),
  'CreatePin': ParameterData.none(),
  'Security': ParameterData.none(),
  'Appearance': ParameterData.none(),
  'Home': ParameterData.none(),
  'AboutUs': ParameterData.none(),
  'Faqs': ParameterData.none(),
  'Legal': (data) async => ParameterData(
        allParams: {
          'postRef': getParameter<DocumentReference>(data, 'postRef'),
        },
      ),
  'ListOfUsers': ParameterData.none(),
  'CreateUser': ParameterData.none(),
  'ListOfPosts-Classic': ParameterData.none(),
  'Single': (data) async => ParameterData(
        allParams: {
          'urlref': getParameter<DocumentReference>(data, 'urlref'),
          'viewMode': getParameter<bool>(data, 'viewMode'),
        },
      ),
  'ListOfMedia': ParameterData.none(),
  'Currency': ParameterData.none(),
  'Crypto': ParameterData.none(),
  'GiftCards': ParameterData.none(),
  'Contact': ParameterData.none(),
  'Blog': (data) async => ParameterData(
        allParams: {
          'postRef': getParameter<DocumentReference>(data, 'postRef'),
        },
      ),
  'AppName': ParameterData.none(),
  'ListOfServices': ParameterData.none(),
  'CreateAirtime': ParameterData.none(),
  'EmailSent-ForgetPassword': ParameterData.none(),
  'VerifyOTP': ParameterData.none(),
  'VerifyRegister': ParameterData.none(),
  'KYC-BVN': ParameterData.none(),
  'EditAddress': ParameterData.none(),
  'ListOfBillOrders': ParameterData.none(),
  'FundWallet': ParameterData.none(),
  'AppEmail': ParameterData.none(),
  'APIIntegration': ParameterData.none(),
  'ListOfAnnonucements': ParameterData.none(),
  'Checkout': ParameterData.none(),
  'Product': (data) async => ParameterData(
        allParams: {
          'productRef': getParameter<DocumentReference>(data, 'productRef'),
        },
      ),
  'ListOfProducts': ParameterData.none(),
  'VirtualCard': ParameterData.none(),
  'ListOfCardsOrders': ParameterData.none(),
  'Plugins': ParameterData.none(),
  'ListOfTransfer': ParameterData.none(),
  'Transfer': (data) async => ParameterData(
        allParams: {
          'transferRef': getParameter<String>(data, 'transferRef'),
          'pageNameRef': getParameter<String>(data, 'pageNameRef'),
        },
      ),
  'TransferAmount': (data) async => ParameterData(
        allParams: {
          'userTransferRef':
              getParameter<DocumentReference>(data, 'userTransferRef'),
        },
      ),
  'FintechSettings': ParameterData.none(),
  'BillSettings': ParameterData.none(),
  'CryptoSettings': ParameterData.none(),
  'EcommerceSettings': ParameterData.none(),
  'GiftcardsSettings': ParameterData.none(),
  'ListOfBillOrdersForAdmin': ParameterData.none(),
  'Airtime': ParameterData.none(),
  'DataBundle': ParameterData.none(),
  'CableTV': ParameterData.none(),
  'Electricity': ParameterData.none(),
  'InternetWifi': ParameterData.none(),
  'Education': ParameterData.none(),
  'OrderSuccessfulBill': (data) async => ParameterData(
        allParams: {
          'typeOfRecipient': getParameter<String>(data, 'typeOfRecipient'),
          'productType': getParameter<String>(data, 'productType'),
          'amount': getParameter<String>(data, 'amount'),
          'customerNumber': getParameter<String>(data, 'customerNumber'),
        },
      ),
  'AppLogo': ParameterData.none(),
  'TransferSuccessful': (data) async => ParameterData(
        allParams: {
          'orderAmount': getParameter<DocumentReference>(data, 'orderAmount'),
          'successMessage': getParameter<String>(data, 'successMessage'),
        },
      ),
  'ListOfRecipients': ParameterData.none(),
  'CreateCableTV': ParameterData.none(),
  'CreateInternetWifi': ParameterData.none(),
  'CreateTransport': ParameterData.none(),
  'CreateEletricityBill': ParameterData.none(),
  'HelpCenter': ParameterData.none(),
  'Pincode': ParameterData.none(),
  'Biometric': ParameterData.none(),
  'DeleteAccount': ParameterData.none(),
  'ResetSecurityPin': ParameterData.none(),
  'ListOfEmailTemplates': ParameterData.none(),
  'Permissions': ParameterData.none(),
  'LoginSms': ParameterData.none(),
  'VerifySMSOTP': (data) async => ParameterData(
        allParams: {
          'getMobileNumber': getParameter<String>(data, 'getMobileNumber'),
        },
      ),
  'RegisterSms': (data) async => ParameterData(
        allParams: {
          'userReferral': getParameter<DocumentReference>(data, 'userReferral'),
        },
      ),
  'Links': ParameterData.none(),
  'SetupApplication': ParameterData.none(),
  'ListOfPosts': ParameterData.none(),
  'Themes': ParameterData.none(),
  'CreateDataBundle': ParameterData.none(),
  'DoorWayEditor': ParameterData.none(),
  'ChatPage': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'ListOfChats': ParameterData.none(),
  'CreateChat': (data) async => ParameterData(
        allParams: {
          'chat': await getDocumentParameter<ChatsRecord>(
              data, 'chat', ChatsRecord.fromSnapshot),
        },
      ),
  'CreateGroupChat': ParameterData.none(),
  'ManageRecipeints': ParameterData.none(),
  'SetupApplication2': ParameterData.none(),
  'ManageAds': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
