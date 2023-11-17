import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CryptoWalletsRecord extends FirestoreRecord {
  CryptoWalletsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "wallet_name" field.
  String? _walletName;
  String get walletName => _walletName ?? '';
  bool hasWalletName() => _walletName != null;

  // "wallet_network" field.
  String? _walletNetwork;
  String get walletNetwork => _walletNetwork ?? '';
  bool hasWalletNetwork() => _walletNetwork != null;

  // "wallet_address" field.
  String? _walletAddress;
  String get walletAddress => _walletAddress ?? '';
  bool hasWalletAddress() => _walletAddress != null;

  // "wallet_code" field.
  String? _walletCode;
  String get walletCode => _walletCode ?? '';
  bool hasWalletCode() => _walletCode != null;

  // "wallet_status" field.
  String? _walletStatus;
  String get walletStatus => _walletStatus ?? '';
  bool hasWalletStatus() => _walletStatus != null;

  // "exchange_currency" field.
  String? _exchangeCurrency;
  String get exchangeCurrency => _exchangeCurrency ?? '';
  bool hasExchangeCurrency() => _exchangeCurrency != null;

  // "received_currency" field.
  String? _receivedCurrency;
  String get receivedCurrency => _receivedCurrency ?? '';
  bool hasReceivedCurrency() => _receivedCurrency != null;

  // "selling_rate" field.
  double? _sellingRate;
  double get sellingRate => _sellingRate ?? 0.0;
  bool hasSellingRate() => _sellingRate != null;

  // "buying_rate" field.
  double? _buyingRate;
  double get buyingRate => _buyingRate ?? 0.0;
  bool hasBuyingRate() => _buyingRate != null;

  // "min_amount" field.
  int? _minAmount;
  int get minAmount => _minAmount ?? 0;
  bool hasMinAmount() => _minAmount != null;

  // "max_amount" field.
  int? _maxAmount;
  int get maxAmount => _maxAmount ?? 0;
  bool hasMaxAmount() => _maxAmount != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _walletName = snapshotData['wallet_name'] as String?;
    _walletNetwork = snapshotData['wallet_network'] as String?;
    _walletAddress = snapshotData['wallet_address'] as String?;
    _walletCode = snapshotData['wallet_code'] as String?;
    _walletStatus = snapshotData['wallet_status'] as String?;
    _exchangeCurrency = snapshotData['exchange_currency'] as String?;
    _receivedCurrency = snapshotData['received_currency'] as String?;
    _sellingRate = castToType<double>(snapshotData['selling_rate']);
    _buyingRate = castToType<double>(snapshotData['buying_rate']);
    _minAmount = castToType<int>(snapshotData['min_amount']);
    _maxAmount = castToType<int>(snapshotData['max_amount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('crypto_wallets');

  static Stream<CryptoWalletsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CryptoWalletsRecord.fromSnapshot(s));

  static Future<CryptoWalletsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CryptoWalletsRecord.fromSnapshot(s));

  static CryptoWalletsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CryptoWalletsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CryptoWalletsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CryptoWalletsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CryptoWalletsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CryptoWalletsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCryptoWalletsRecordData({
  DateTime? createdAt,
  String? walletName,
  String? walletNetwork,
  String? walletAddress,
  String? walletCode,
  String? walletStatus,
  String? exchangeCurrency,
  String? receivedCurrency,
  double? sellingRate,
  double? buyingRate,
  int? minAmount,
  int? maxAmount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'wallet_name': walletName,
      'wallet_network': walletNetwork,
      'wallet_address': walletAddress,
      'wallet_code': walletCode,
      'wallet_status': walletStatus,
      'exchange_currency': exchangeCurrency,
      'received_currency': receivedCurrency,
      'selling_rate': sellingRate,
      'buying_rate': buyingRate,
      'min_amount': minAmount,
      'max_amount': maxAmount,
    }.withoutNulls,
  );

  return firestoreData;
}

class CryptoWalletsRecordDocumentEquality
    implements Equality<CryptoWalletsRecord> {
  const CryptoWalletsRecordDocumentEquality();

  @override
  bool equals(CryptoWalletsRecord? e1, CryptoWalletsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.walletName == e2?.walletName &&
        e1?.walletNetwork == e2?.walletNetwork &&
        e1?.walletAddress == e2?.walletAddress &&
        e1?.walletCode == e2?.walletCode &&
        e1?.walletStatus == e2?.walletStatus &&
        e1?.exchangeCurrency == e2?.exchangeCurrency &&
        e1?.receivedCurrency == e2?.receivedCurrency &&
        e1?.sellingRate == e2?.sellingRate &&
        e1?.buyingRate == e2?.buyingRate &&
        e1?.minAmount == e2?.minAmount &&
        e1?.maxAmount == e2?.maxAmount;
  }

  @override
  int hash(CryptoWalletsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.walletName,
        e?.walletNetwork,
        e?.walletAddress,
        e?.walletCode,
        e?.walletStatus,
        e?.exchangeCurrency,
        e?.receivedCurrency,
        e?.sellingRate,
        e?.buyingRate,
        e?.minAmount,
        e?.maxAmount
      ]);

  @override
  bool isValidKey(Object? o) => o is CryptoWalletsRecord;
}
