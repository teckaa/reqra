import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CryptoSettingsRecord extends FirestoreRecord {
  CryptoSettingsRecord._(
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
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('crypto_settings');

  static Stream<CryptoSettingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CryptoSettingsRecord.fromSnapshot(s));

  static Future<CryptoSettingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CryptoSettingsRecord.fromSnapshot(s));

  static CryptoSettingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CryptoSettingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CryptoSettingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CryptoSettingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CryptoSettingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CryptoSettingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCryptoSettingsRecordData({
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
    }.withoutNulls,
  );

  return firestoreData;
}

class CryptoSettingsRecordDocumentEquality
    implements Equality<CryptoSettingsRecord> {
  const CryptoSettingsRecordDocumentEquality();

  @override
  bool equals(CryptoSettingsRecord? e1, CryptoSettingsRecord? e2) {
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
        e1?.pluginProviderApiStatus == e2?.pluginProviderApiStatus;
  }

  @override
  int hash(CryptoSettingsRecord? e) => const ListEquality().hash([
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
        e?.pluginProviderApiStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is CryptoSettingsRecord;
}
