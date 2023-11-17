import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BillpaymentSettingsRecord extends FirestoreRecord {
  BillpaymentSettingsRecord._(
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

  // "permit_selling" field.
  bool? _permitSelling;
  bool get permitSelling => _permitSelling ?? false;
  bool hasPermitSelling() => _permitSelling != null;

  // "permit_buying" field.
  bool? _permitBuying;
  bool get permitBuying => _permitBuying ?? false;
  bool hasPermitBuying() => _permitBuying != null;

  // "plugin_currency" field.
  String? _pluginCurrency;
  String get pluginCurrency => _pluginCurrency ?? '';
  bool hasPluginCurrency() => _pluginCurrency != null;

  // "plugin_received_currency" field.
  String? _pluginReceivedCurrency;
  String get pluginReceivedCurrency => _pluginReceivedCurrency ?? '';
  bool hasPluginReceivedCurrency() => _pluginReceivedCurrency != null;

  // "plugin_tax" field.
  double? _pluginTax;
  double get pluginTax => _pluginTax ?? 0.0;
  bool hasPluginTax() => _pluginTax != null;

  // "plugin_transaction_fee" field.
  double? _pluginTransactionFee;
  double get pluginTransactionFee => _pluginTransactionFee ?? 0.0;
  bool hasPluginTransactionFee() => _pluginTransactionFee != null;

  // "plugin_bank_transfer_fee" field.
  double? _pluginBankTransferFee;
  double get pluginBankTransferFee => _pluginBankTransferFee ?? 0.0;
  bool hasPluginBankTransferFee() => _pluginBankTransferFee != null;

  // "plugin_provider_api" field.
  String? _pluginProviderApi;
  String get pluginProviderApi => _pluginProviderApi ?? '';
  bool hasPluginProviderApi() => _pluginProviderApi != null;

  // "plugin_provider_api_key" field.
  String? _pluginProviderApiKey;
  String get pluginProviderApiKey => _pluginProviderApiKey ?? '';
  bool hasPluginProviderApiKey() => _pluginProviderApiKey != null;

  // "plugin_provider_api_status" field.
  String? _pluginProviderApiStatus;
  String get pluginProviderApiStatus => _pluginProviderApiStatus ?? '';
  bool hasPluginProviderApiStatus() => _pluginProviderApiStatus != null;

  // "plugin_min_topup" field.
  int? _pluginMinTopup;
  int get pluginMinTopup => _pluginMinTopup ?? 0;
  bool hasPluginMinTopup() => _pluginMinTopup != null;

  // "plugin_max_topup" field.
  int? _pluginMaxTopup;
  int get pluginMaxTopup => _pluginMaxTopup ?? 0;
  bool hasPluginMaxTopup() => _pluginMaxTopup != null;

  // "plugin_provider_test_api_key" field.
  String? _pluginProviderTestApiKey;
  String get pluginProviderTestApiKey => _pluginProviderTestApiKey ?? '';
  bool hasPluginProviderTestApiKey() => _pluginProviderTestApiKey != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _permitSelling = snapshotData['permit_selling'] as bool?;
    _permitBuying = snapshotData['permit_buying'] as bool?;
    _pluginCurrency = snapshotData['plugin_currency'] as String?;
    _pluginReceivedCurrency =
        snapshotData['plugin_received_currency'] as String?;
    _pluginTax = castToType<double>(snapshotData['plugin_tax']);
    _pluginTransactionFee =
        castToType<double>(snapshotData['plugin_transaction_fee']);
    _pluginBankTransferFee =
        castToType<double>(snapshotData['plugin_bank_transfer_fee']);
    _pluginProviderApi = snapshotData['plugin_provider_api'] as String?;
    _pluginProviderApiKey = snapshotData['plugin_provider_api_key'] as String?;
    _pluginProviderApiStatus =
        snapshotData['plugin_provider_api_status'] as String?;
    _pluginMinTopup = castToType<int>(snapshotData['plugin_min_topup']);
    _pluginMaxTopup = castToType<int>(snapshotData['plugin_max_topup']);
    _pluginProviderTestApiKey =
        snapshotData['plugin_provider_test_api_key'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('billpayment_settings');

  static Stream<BillpaymentSettingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BillpaymentSettingsRecord.fromSnapshot(s));

  static Future<BillpaymentSettingsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BillpaymentSettingsRecord.fromSnapshot(s));

  static BillpaymentSettingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BillpaymentSettingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BillpaymentSettingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BillpaymentSettingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BillpaymentSettingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BillpaymentSettingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBillpaymentSettingsRecordData({
  DateTime? createdAt,
  DocumentReference? userRef,
  bool? permitSelling,
  bool? permitBuying,
  String? pluginCurrency,
  String? pluginReceivedCurrency,
  double? pluginTax,
  double? pluginTransactionFee,
  double? pluginBankTransferFee,
  String? pluginProviderApi,
  String? pluginProviderApiKey,
  String? pluginProviderApiStatus,
  int? pluginMinTopup,
  int? pluginMaxTopup,
  String? pluginProviderTestApiKey,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'user_ref': userRef,
      'permit_selling': permitSelling,
      'permit_buying': permitBuying,
      'plugin_currency': pluginCurrency,
      'plugin_received_currency': pluginReceivedCurrency,
      'plugin_tax': pluginTax,
      'plugin_transaction_fee': pluginTransactionFee,
      'plugin_bank_transfer_fee': pluginBankTransferFee,
      'plugin_provider_api': pluginProviderApi,
      'plugin_provider_api_key': pluginProviderApiKey,
      'plugin_provider_api_status': pluginProviderApiStatus,
      'plugin_min_topup': pluginMinTopup,
      'plugin_max_topup': pluginMaxTopup,
      'plugin_provider_test_api_key': pluginProviderTestApiKey,
    }.withoutNulls,
  );

  return firestoreData;
}

class BillpaymentSettingsRecordDocumentEquality
    implements Equality<BillpaymentSettingsRecord> {
  const BillpaymentSettingsRecordDocumentEquality();

  @override
  bool equals(BillpaymentSettingsRecord? e1, BillpaymentSettingsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.permitSelling == e2?.permitSelling &&
        e1?.permitBuying == e2?.permitBuying &&
        e1?.pluginCurrency == e2?.pluginCurrency &&
        e1?.pluginReceivedCurrency == e2?.pluginReceivedCurrency &&
        e1?.pluginTax == e2?.pluginTax &&
        e1?.pluginTransactionFee == e2?.pluginTransactionFee &&
        e1?.pluginBankTransferFee == e2?.pluginBankTransferFee &&
        e1?.pluginProviderApi == e2?.pluginProviderApi &&
        e1?.pluginProviderApiKey == e2?.pluginProviderApiKey &&
        e1?.pluginProviderApiStatus == e2?.pluginProviderApiStatus &&
        e1?.pluginMinTopup == e2?.pluginMinTopup &&
        e1?.pluginMaxTopup == e2?.pluginMaxTopup &&
        e1?.pluginProviderTestApiKey == e2?.pluginProviderTestApiKey;
  }

  @override
  int hash(BillpaymentSettingsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.userRef,
        e?.permitSelling,
        e?.permitBuying,
        e?.pluginCurrency,
        e?.pluginReceivedCurrency,
        e?.pluginTax,
        e?.pluginTransactionFee,
        e?.pluginBankTransferFee,
        e?.pluginProviderApi,
        e?.pluginProviderApiKey,
        e?.pluginProviderApiStatus,
        e?.pluginMinTopup,
        e?.pluginMaxTopup,
        e?.pluginProviderTestApiKey
      ]);

  @override
  bool isValidKey(Object? o) => o is BillpaymentSettingsRecord;
}
