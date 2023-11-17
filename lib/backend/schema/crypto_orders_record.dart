import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CryptoOrdersRecord extends FirestoreRecord {
  CryptoOrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  bool hasUuid() => _uuid != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "exchange_currency" field.
  String? _exchangeCurrency;
  String get exchangeCurrency => _exchangeCurrency ?? '';
  bool hasExchangeCurrency() => _exchangeCurrency != null;

  // "receiver_currency" field.
  String? _receiverCurrency;
  String get receiverCurrency => _receiverCurrency ?? '';
  bool hasReceiverCurrency() => _receiverCurrency != null;

  // "tender" field.
  double? _tender;
  double get tender => _tender ?? 0.0;
  bool hasTender() => _tender != null;

  // "received" field.
  double? _received;
  double get received => _received ?? 0.0;
  bool hasReceived() => _received != null;

  // "buying_rate" field.
  double? _buyingRate;
  double get buyingRate => _buyingRate ?? 0.0;
  bool hasBuyingRate() => _buyingRate != null;

  // "selling_rate" field.
  double? _sellingRate;
  double get sellingRate => _sellingRate ?? 0.0;
  bool hasSellingRate() => _sellingRate != null;

  // "bank_name" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  bool hasBankName() => _bankName != null;

  // "account_number" field.
  int? _accountNumber;
  int get accountNumber => _accountNumber ?? 0;
  bool hasAccountNumber() => _accountNumber != null;

  // "account_name" field.
  String? _accountName;
  String get accountName => _accountName ?? '';
  bool hasAccountName() => _accountName != null;

  // "swift_code" field.
  String? _swiftCode;
  String get swiftCode => _swiftCode ?? '';
  bool hasSwiftCode() => _swiftCode != null;

  // "routing_number" field.
  int? _routingNumber;
  int get routingNumber => _routingNumber ?? 0;
  bool hasRoutingNumber() => _routingNumber != null;

  // "order_status" field.
  String? _orderStatus;
  String get orderStatus => _orderStatus ?? '';
  bool hasOrderStatus() => _orderStatus != null;

  // "order_type" field.
  String? _orderType;
  String get orderType => _orderType ?? '';
  bool hasOrderType() => _orderType != null;

  // "order_wallet_name" field.
  String? _orderWalletName;
  String get orderWalletName => _orderWalletName ?? '';
  bool hasOrderWalletName() => _orderWalletName != null;

  // "order_wallet" field.
  String? _orderWallet;
  String get orderWallet => _orderWallet ?? '';
  bool hasOrderWallet() => _orderWallet != null;

  // "order_network" field.
  String? _orderNetwork;
  String get orderNetwork => _orderNetwork ?? '';
  bool hasOrderNetwork() => _orderNetwork != null;

  // "order_receipt" field.
  String? _orderReceipt;
  String get orderReceipt => _orderReceipt ?? '';
  bool hasOrderReceipt() => _orderReceipt != null;

  // "order_trading_source" field.
  String? _orderTradingSource;
  String get orderTradingSource => _orderTradingSource ?? '';
  bool hasOrderTradingSource() => _orderTradingSource != null;

  // "order_trading_created_at" field.
  DateTime? _orderTradingCreatedAt;
  DateTime? get orderTradingCreatedAt => _orderTradingCreatedAt;
  bool hasOrderTradingCreatedAt() => _orderTradingCreatedAt != null;

  // "order_trader_name" field.
  String? _orderTraderName;
  String get orderTraderName => _orderTraderName ?? '';
  bool hasOrderTraderName() => _orderTraderName != null;

  // "order_trader_info" field.
  List<String>? _orderTraderInfo;
  List<String> get orderTraderInfo => _orderTraderInfo ?? const [];
  bool hasOrderTraderInfo() => _orderTraderInfo != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _uuid = snapshotData['uuid'] as String?;
    _country = snapshotData['country'] as String?;
    _exchangeCurrency = snapshotData['exchange_currency'] as String?;
    _receiverCurrency = snapshotData['receiver_currency'] as String?;
    _tender = castToType<double>(snapshotData['tender']);
    _received = castToType<double>(snapshotData['received']);
    _buyingRate = castToType<double>(snapshotData['buying_rate']);
    _sellingRate = castToType<double>(snapshotData['selling_rate']);
    _bankName = snapshotData['bank_name'] as String?;
    _accountNumber = castToType<int>(snapshotData['account_number']);
    _accountName = snapshotData['account_name'] as String?;
    _swiftCode = snapshotData['swift_code'] as String?;
    _routingNumber = castToType<int>(snapshotData['routing_number']);
    _orderStatus = snapshotData['order_status'] as String?;
    _orderType = snapshotData['order_type'] as String?;
    _orderWalletName = snapshotData['order_wallet_name'] as String?;
    _orderWallet = snapshotData['order_wallet'] as String?;
    _orderNetwork = snapshotData['order_network'] as String?;
    _orderReceipt = snapshotData['order_receipt'] as String?;
    _orderTradingSource = snapshotData['order_trading_source'] as String?;
    _orderTradingCreatedAt =
        snapshotData['order_trading_created_at'] as DateTime?;
    _orderTraderName = snapshotData['order_trader_name'] as String?;
    _orderTraderInfo = getDataList(snapshotData['order_trader_info']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('crypto_orders');

  static Stream<CryptoOrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CryptoOrdersRecord.fromSnapshot(s));

  static Future<CryptoOrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CryptoOrdersRecord.fromSnapshot(s));

  static CryptoOrdersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CryptoOrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CryptoOrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CryptoOrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CryptoOrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CryptoOrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCryptoOrdersRecordData({
  DateTime? createdAt,
  DocumentReference? userRef,
  String? uuid,
  String? country,
  String? exchangeCurrency,
  String? receiverCurrency,
  double? tender,
  double? received,
  double? buyingRate,
  double? sellingRate,
  String? bankName,
  int? accountNumber,
  String? accountName,
  String? swiftCode,
  int? routingNumber,
  String? orderStatus,
  String? orderType,
  String? orderWalletName,
  String? orderWallet,
  String? orderNetwork,
  String? orderReceipt,
  String? orderTradingSource,
  DateTime? orderTradingCreatedAt,
  String? orderTraderName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'user_ref': userRef,
      'uuid': uuid,
      'country': country,
      'exchange_currency': exchangeCurrency,
      'receiver_currency': receiverCurrency,
      'tender': tender,
      'received': received,
      'buying_rate': buyingRate,
      'selling_rate': sellingRate,
      'bank_name': bankName,
      'account_number': accountNumber,
      'account_name': accountName,
      'swift_code': swiftCode,
      'routing_number': routingNumber,
      'order_status': orderStatus,
      'order_type': orderType,
      'order_wallet_name': orderWalletName,
      'order_wallet': orderWallet,
      'order_network': orderNetwork,
      'order_receipt': orderReceipt,
      'order_trading_source': orderTradingSource,
      'order_trading_created_at': orderTradingCreatedAt,
      'order_trader_name': orderTraderName,
    }.withoutNulls,
  );

  return firestoreData;
}

class CryptoOrdersRecordDocumentEquality
    implements Equality<CryptoOrdersRecord> {
  const CryptoOrdersRecordDocumentEquality();

  @override
  bool equals(CryptoOrdersRecord? e1, CryptoOrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.uuid == e2?.uuid &&
        e1?.country == e2?.country &&
        e1?.exchangeCurrency == e2?.exchangeCurrency &&
        e1?.receiverCurrency == e2?.receiverCurrency &&
        e1?.tender == e2?.tender &&
        e1?.received == e2?.received &&
        e1?.buyingRate == e2?.buyingRate &&
        e1?.sellingRate == e2?.sellingRate &&
        e1?.bankName == e2?.bankName &&
        e1?.accountNumber == e2?.accountNumber &&
        e1?.accountName == e2?.accountName &&
        e1?.swiftCode == e2?.swiftCode &&
        e1?.routingNumber == e2?.routingNumber &&
        e1?.orderStatus == e2?.orderStatus &&
        e1?.orderType == e2?.orderType &&
        e1?.orderWalletName == e2?.orderWalletName &&
        e1?.orderWallet == e2?.orderWallet &&
        e1?.orderNetwork == e2?.orderNetwork &&
        e1?.orderReceipt == e2?.orderReceipt &&
        e1?.orderTradingSource == e2?.orderTradingSource &&
        e1?.orderTradingCreatedAt == e2?.orderTradingCreatedAt &&
        e1?.orderTraderName == e2?.orderTraderName &&
        listEquality.equals(e1?.orderTraderInfo, e2?.orderTraderInfo);
  }

  @override
  int hash(CryptoOrdersRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.userRef,
        e?.uuid,
        e?.country,
        e?.exchangeCurrency,
        e?.receiverCurrency,
        e?.tender,
        e?.received,
        e?.buyingRate,
        e?.sellingRate,
        e?.bankName,
        e?.accountNumber,
        e?.accountName,
        e?.swiftCode,
        e?.routingNumber,
        e?.orderStatus,
        e?.orderType,
        e?.orderWalletName,
        e?.orderWallet,
        e?.orderNetwork,
        e?.orderReceipt,
        e?.orderTradingSource,
        e?.orderTradingCreatedAt,
        e?.orderTraderName,
        e?.orderTraderInfo
      ]);

  @override
  bool isValidKey(Object? o) => o is CryptoOrdersRecord;
}
