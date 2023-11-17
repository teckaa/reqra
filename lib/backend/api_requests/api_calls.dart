import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start FluttewaveApi Group Code

class FluttewaveApiGroup {
  static ListOfBillsCall listOfBillsCall = ListOfBillsCall();
  static ValidateCustomerCall validateCustomerCall = ValidateCustomerCall();
  static ListOfBankCall listOfBankCall = ListOfBankCall();
  static AccountResolveCall accountResolveCall = AccountResolveCall();
  static CreateBillCall createBillCall = CreateBillCall();
  static ListOfServiceCall listOfServiceCall = ListOfServiceCall();
  static ListOfServiceAmountCall listOfServiceAmountCall =
      ListOfServiceAmountCall();
  static CreateVirtualAccountNumberCall createVirtualAccountNumberCall =
      CreateVirtualAccountNumberCall();
  static StandardPaymentCall standardPaymentCall = StandardPaymentCall();
  static VerifyStandardPaymentCall verifyStandardPaymentCall =
      VerifyStandardPaymentCall();
  static FetchBalanceByCurrencyCall fetchBalanceByCurrencyCall =
      FetchBalanceByCurrencyCall();
  static FetchAllBalanceCall fetchAllBalanceCall = FetchAllBalanceCall();
  static FetchBillBalanceCall fetchBillBalanceCall = FetchBillBalanceCall();
  static GetBillDetailsCall getBillDetailsCall = GetBillDetailsCall();
}

class ListOfBillsCall {
  Future<ApiCallResponse> call({
    String? type = '',
    String? billerCode = '',
    String? apiKey = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListOfBillsCall',
        'variables': {
          'type': type,
          'billerCode': billerCode,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ValidateCustomerCall {
  Future<ApiCallResponse> call({
    String? itemCode = '',
    String? billerCode = '',
    String? customerNumber = '',
    String? apiKey = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ValidateCustomerCall',
        'variables': {
          'itemCode': itemCode,
          'billerCode': billerCode,
          'customerNumber': customerNumber,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListOfBankCall {
  Future<ApiCallResponse> call({
    String? country = '',
    String? apiKey = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListOfBankCall',
        'variables': {
          'country': country,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class AccountResolveCall {
  Future<ApiCallResponse> call({
    String? accountNumber = '',
    String? accountBank = '',
    String? apiKey = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AccountResolveCall',
        'variables': {
          'accountNumber': accountNumber,
          'accountBank': accountBank,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateBillCall {
  Future<ApiCallResponse> call({
    String? country = '',
    String? customer = '',
    int? amount,
    String? type = '',
    String? referenceId = '',
    String? apiKey = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateBillCall',
        'variables': {
          'country': country,
          'customer': customer,
          'amount': amount,
          'type': type,
          'referenceId': referenceId,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListOfServiceCall {
  Future<ApiCallResponse> call({
    String? billType = '',
    String? billerCode = '',
    String? apiKey = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListOfServiceCall',
        'variables': {
          'billType': billType,
          'billerCode': billerCode,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListOfServiceAmountCall {
  Future<ApiCallResponse> call({
    String? billType = '',
    String? billerCode = '',
    String? itemCode = '',
    String? apiKey = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListOfServiceAmountCall',
        'variables': {
          'billType': billType,
          'billerCode': billerCode,
          'itemCode': itemCode,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateVirtualAccountNumberCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? bvn = '',
    String? phonenumber = '',
    String? firstname = '',
    String? lastname = '',
    String? narration = '',
    String? apiKey = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateVirtualAccountNumberCall',
        'variables': {
          'email': email,
          'bvn': bvn,
          'phonenumber': phonenumber,
          'firstname': firstname,
          'lastname': lastname,
          'narration': narration,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class StandardPaymentCall {
  Future<ApiCallResponse> call({
    String? referenceId = '',
    String? amount = '',
    String? currency = '',
    String? redirectUrl = '',
    String? customerEmail = '',
    String? customerPhonenumber = '',
    String? customerFullname = '',
    String? appName = '',
    String? appSquareLogo = '',
    String? apiKey = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'StandardPaymentCall',
        'variables': {
          'referenceId': referenceId,
          'amount': amount,
          'currency': currency,
          'redirectUrl': redirectUrl,
          'customerEmail': customerEmail,
          'customerPhonenumber': customerPhonenumber,
          'customerFullname': customerFullname,
          'appName': appName,
          'appSquareLogo': appSquareLogo,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class VerifyStandardPaymentCall {
  Future<ApiCallResponse> call({
    String? referenceId = '',
    String? apiKey = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'VerifyStandardPaymentCall',
        'variables': {
          'referenceId': referenceId,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class FetchBalanceByCurrencyCall {
  Future<ApiCallResponse> call({
    String? currency = 'NGN',
    String? apiKey = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'FetchBalanceByCurrencyCall',
        'variables': {
          'currency': currency,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class FetchAllBalanceCall {
  Future<ApiCallResponse> call({
    String? apiKey = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'FetchAllBalanceCall',
        'variables': {
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class FetchBillBalanceCall {
  Future<ApiCallResponse> call({
    String? apiKey = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'FetchBillBalanceCall',
        'variables': {
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetBillDetailsCall {
  Future<ApiCallResponse> call({
    String? country = '',
    String? type = '',
    String? apiKey = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetBillDetailsCall',
        'variables': {
          'country': country,
          'type': type,
          'apiKey': apiKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

/// End FluttewaveApi Group Code

/// Start BrevoApi Group Code

class BrevoApiGroup {
  static String baseUrl = 'https://api.brevo.com/v3';
  static Map<String, String> headers = {
    'api-key':
        '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',
    'content-type': 'application/json',
    'accept': 'application/json',
  };
  static EmailNotificationCall emailNotificationCall = EmailNotificationCall();
  static TransactionEmailCall transactionEmailCall = TransactionEmailCall();
}

class EmailNotificationCall {
  Future<ApiCallResponse> call({
    String? appName = '',
    String? appEmail = '',
    String? customerName = '',
    String? customerEmail = '',
    String? subject = '',
    String? previewText = '',
    String? content = '',
    String? additionalText = '',
    String? footerText = '',
    String? brandLogo = '',
    String? brandColor = '',
    String? backgroundColor = '',
    String? contentBackgroundColor = '',
    String? contentTextColor = '',
  }) async {
    final ffApiRequestBody = '''
{
  "sender": {
    "name": "${appName}",
    "email": "${appEmail}"
  },
  "to": [
    {
      "email": "${customerEmail}",
      "name": "${customerName}"
    }
  ],
  "subject": "${subject}",
"htmlContent": "<!doctype html><html> <head> <meta name='viewport' content='width=device-width, initial-scale=1.0'/> <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' /> <title>Email Notification</title> <style> /* ------------------------------------- GLOBAL RESETS ------------------------------------- */ /*All the styling goes here*/ img { border: none; -ms-interpolation-mode: bicubic; max-width: 100%; } body { background-color: ${backgroundColor}; color: ${contentTextColor}; font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; } table { border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; } table td { font-family: sans-serif; font-size: 14px; vertical-align: top; } /* ------------------------------------- BODY & CONTAINER ------------------------------------- */ .body { background-color: ${backgroundColor}; width: 100%; } /* Set a max-width, and make it display as block so it will automatically stretch to that width, but will also shrink down on a phone or something */ .container { display: block; margin: 0 auto !important; /* makes it centered */ max-width: 580px; padding: 10px; width: 580px; } /* This should also be a block element, so that it will fill 100% of the .container */ .content { box-sizing: border-box; display: block; margin: 0 auto; max-width: 580px; padding: 10px; } /* ------------------------------------- HEADER, FOOTER, MAIN ------------------------------------- */ .main { background: ${contentBackgroundColor}; border-radius: 3px; width: 100%; } .wrapper { box-sizing: border-box; padding: 20px; } .content-block { padding-bottom: 10px; padding-top: 10px; } .footer { clear: both; margin-top: 10px; text-align: left; width: 100%; } .footer td, .footer p, .footer span, .footer a { color: ${contentTextColor}; font-size: 13px; text-align: left; } /* ------------------------------------- TYPOGRAPHY ------------------------------------- */ h1, h2, h3, h4 { color: ${contentTextColor}; font-family: sans-serif; font-weight: 400; line-height: 1.4; margin: 0; margin-bottom: 30px; } h1 { font-size: 35px; font-weight: 300; text-align: left; text-transform: capitalize; } p, ul, ol { font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px; } p li, ul li, ol li { list-style-position: inside; margin-left: 5px; } a { color: ${brandColor}; text-decoration: underline; } /* ------------------------------------- BUTTONS ------------------------------------- */ .btn { box-sizing: border-box; width: 100%; } .btn > tbody > tr > td { padding-bottom: 15px; } .btn table { width: auto; } .btn table td { background-color: #ffffff; border-radius: 8px; text-align: center; } .btn a { background-color: #ffffff; border: solid 1px ${brandColor}; border-radius: 8px; box-sizing: border-box; color: ${brandColor}; cursor: pointer; display: inline-block; font-size: 14px; font-weight: bold; margin: 0; padding: 12px 25px; text-decoration: none; text-transform: capitalize; } .btn-primary table td { background-color: ${brandColor}; } .btn-primary a { background-color: ${brandColor}; border-color: ${brandColor}; color: #ffffff; } /* ------------------------------------- OTHER STYLES THAT MIGHT BE USEFUL ------------------------------------- */ .last { margin-bottom: 0; } .first { margin-top: 0; } .align-center { text-align: center; } .align-right { text-align: right; } .align-left { text-align: left; } .clear { clear: both; } .mt0 { margin-top: 0; } .mb0 { margin-bottom: 0; } .preheader { color: transparent; display: none; height: 0; max-height: 0; max-width: 0; opacity: 0; overflow: hidden; mso-hide: all; visibility: hidden; width: 0; } .powered-by a { text-decoration: none; } hr { border: 0; border-bottom: 1px solid ${backgroundColor}; margin: 20px 0; } /* ------------------------------------- RESPONSIVE AND MOBILE FRIENDLY STYLES ------------------------------------- */ @media only screen and (max-width: 620px) { table.body h1 { font-size: 28px !important; margin-bottom: 10px !important; } table.body p, table.body ul, table.body ol, table.body td, table.body span, table.body a { font-size: 16px !important; } table.body .wrapper, table.body .article { padding: 10px !important; } table.body .content { padding: 0 !important; } table.body .container { padding: 0 !important; width: 100% !important; } table.body .main { border-left-width: 0 !important; border-radius: 0 !important; border-right-width: 0 !important; } table.body .btn table { width: 100% !important; } table.body .btn a { width: 100% !important; } table.body .img-responsive { height: auto !important; max-width: 100% !important; width: auto !important; } } /* ------------------------------------- PRESERVE THESE STYLES IN THE HEAD ------------------------------------- */ @media all { .ExternalClass { width: 100%; } .ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; } .apple-link a { color: inherit !important; font-family: inherit !important; font-size: inherit !important; font-weight: inherit !important; line-height: inherit !important; text-decoration: none !important; } #MessageViewBody a { color: inherit; text-decoration: none; font-size: inherit; font-family: inherit; font-weight: inherit; line-height: inherit; } .btn-primary table td:hover { background-color: #34495e !important; } .btn-primary a:hover { background-color: #34495e !important; border-color: #34495e !important; } } </style></head> <body> <span class='preheader'>${previewText}</span> <table role='presentation' border='0' cellpadding='0' cellspacing='0' class='body'> <tr> <td>&nbsp;</td> <td class='container'> <div class='header'> <table role='presentation' border='0' cellpadding='0' cellspacing='0' width='100%''> <tr> <td class='align-right' width='100%''> <img src='${brandLogo}'' width='120' alt='Logo'> </td> </tr> </table> </div><div class='content'> <!-- START CENTERED WHITE CONTAINER --> <table role='presentation' class='main'> <!-- START MAIN CONTENT AREA --> <tr> <td class='wrapper'> <table role='presentation' border='0' cellpadding='0' cellspacing='0'> <tr> <td> <h3>${subject}</h3><p>Hi ${customerName},</p> <p> ${content} </p> <table role='presentation' border='0' cellpadding='0' cellspacing='0' class='btn btn-primary'> <tbody> <tr> <td align='left'> <table role='presentation' border='0' cellpadding='0' cellspacing='0'> <tbody> <tr> <td> <a href='https://teckaa.com' target='_blank'>Call To Action</a> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <p>Thanks.</p> </td> </tr> </table> </td> </tr> <!-- END MAIN CONTENT AREA --> </table> <!-- END CENTERED WHITE CONTAINER --> <!-- START FOOTER --> <div class='footer'> <table role='presentation' border='0' cellpadding='0' cellspacing='0'> <tr> <td class='content-block'><img src='${brandLogo}' alt='Logo' width='120' height='auto' border='0' style='border:0; outline:none; text-decoration:none; display:block;'><span class='apple-link'> ${footerText} </span> </td> </tr> </table> </div> <!-- END FOOTER --> </div> </td> <td>&nbsp;</td> </tr> </table></body></html>"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EmailNotification',
      apiUrl: '${BrevoApiGroup.baseUrl}/smtp/email',
      callType: ApiCallType.POST,
      headers: {
        'api-key':
            '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',
        'content-type': 'application/json',
        'accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TransactionEmailCall {
  Future<ApiCallResponse> call({
    String? appName = '',
    String? appEmail = '',
    String? customerName = '',
    String? customerEmail = '',
    String? subject = '',
    int? templateId,
  }) async {
    final ffApiRequestBody = '''
{
  "sender": {
    "name": "${appName}",
    "email": "${appEmail}"
  },
  "params": {
    "FIRSTNAME": "Kolawole",
    "LASTNAME": "Osho"
  },
  "to": [
    {
      "email": "${customerEmail}",
      "name": "${customerName}"
    }
  ],
  "subject": "${subject}",
  "templateId": ${templateId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TransactionEmail',
      apiUrl: '${BrevoApiGroup.baseUrl}/smtp/email',
      callType: ApiCallType.POST,
      headers: {
        'api-key':
            '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',
        'content-type': 'application/json',
        'accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End BrevoApi Group Code

/// Start CoinRankingApi Group Code

class CoinRankingApiGroup {
  static String baseUrl = 'https://api.coinranking.com/v2';
  static Map<String, String> headers = {
    'x-access-token':
        'coinranking4643318bbe34342bb6edf8aecba770f225e8e67bd475cd1c',
  };
  static ListOnCoinsCall listOnCoinsCall = ListOnCoinsCall();
  static GetCoinPriceCall getCoinPriceCall = GetCoinPriceCall();
}

class ListOnCoinsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'ListOnCoins',
      apiUrl: '${CoinRankingApiGroup.baseUrl}/coins?symbols=BTC',
      callType: ApiCallType.GET,
      headers: {
        'x-access-token':
            'coinranking4643318bbe34342bb6edf8aecba770f225e8e67bd475cd1c',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetCoinPriceCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetCoinPrice',
      apiUrl: '${CoinRankingApiGroup.baseUrl}/coins?symbols=BTC',
      callType: ApiCallType.GET,
      headers: {
        'x-access-token':
            'coinranking4643318bbe34342bb6edf8aecba770f225e8e67bd475cd1c',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End CoinRankingApi Group Code

/// Start PaystackApi Group Code

class PaystackApiGroup {
  static String baseUrl = 'https://api.paystack.co';
  static Map<String, String> headers = {
    'Authorization': 'Bearer sk_live_ac5d9de62172e7bf4d17875f78f4a64aefbaa430',
  };
}

/// End PaystackApi Group Code

class AllCryptoApiCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'AllCryptoApi',
      apiUrl:
          'https://cdn.jsdelivr.net/gh/vadimmalykhin/binance-icons/manifest.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ExchangeCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Exchange',
      apiUrl: 'https://countriesnow.space/api/v0.1/countries/currency',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetPriceCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetPrice',
      apiUrl:
          'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=EEC8C305-A172-4709-8EE0-9F8239BF7CE7',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PexelsAPICall {
  static Future<ApiCallResponse> call({
    String? query = '',
    String? pexelsApiKeys = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'PexelsAPI',
      apiUrl: 'https://api.pexels.com/v1/search',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${pexelsApiKeys}',
      },
      params: {
        'query': query,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PixabayApiCall {
  static Future<ApiCallResponse> call({
    String? query = '',
    String? pixabayApiKeys = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'PixabayApi',
      apiUrl: 'https://pixabay.com/api/?key=${pixabayApiKeys}&q=${query}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
