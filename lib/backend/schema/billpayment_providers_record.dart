import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BillpaymentProvidersRecord extends FirestoreRecord {
  BillpaymentProvidersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  bool hasUuid() => _uuid != null;

  // "provider_name" field.
  String? _providerName;
  String get providerName => _providerName ?? '';
  bool hasProviderName() => _providerName != null;

  // "provider_service_type" field.
  String? _providerServiceType;
  String get providerServiceType => _providerServiceType ?? '';
  bool hasProviderServiceType() => _providerServiceType != null;

  // "provider_status" field.
  bool? _providerStatus;
  bool get providerStatus => _providerStatus ?? false;
  bool hasProviderStatus() => _providerStatus != null;

  // "provider_logo" field.
  String? _providerLogo;
  String get providerLogo => _providerLogo ?? '';
  bool hasProviderLogo() => _providerLogo != null;

  // "provider_default_commission" field.
  double? _providerDefaultCommission;
  double get providerDefaultCommission => _providerDefaultCommission ?? 0.0;
  bool hasProviderDefaultCommission() => _providerDefaultCommission != null;

  // "provider_biller_code" field.
  String? _providerBillerCode;
  String get providerBillerCode => _providerBillerCode ?? '';
  bool hasProviderBillerCode() => _providerBillerCode != null;

  // "provider_biller_name" field.
  String? _providerBillerName;
  String get providerBillerName => _providerBillerName ?? '';
  bool hasProviderBillerName() => _providerBillerName != null;

  // "provider_item_code" field.
  String? _providerItemCode;
  String get providerItemCode => _providerItemCode ?? '';
  bool hasProviderItemCode() => _providerItemCode != null;

  // "provider_short_name" field.
  String? _providerShortName;
  String get providerShortName => _providerShortName ?? '';
  bool hasProviderShortName() => _providerShortName != null;

  // "provider_transfer_fee" field.
  int? _providerTransferFee;
  int get providerTransferFee => _providerTransferFee ?? 0;
  bool hasProviderTransferFee() => _providerTransferFee != null;

  // "provider_country" field.
  String? _providerCountry;
  String get providerCountry => _providerCountry ?? '';
  bool hasProviderCountry() => _providerCountry != null;

  // "provider_currency" field.
  String? _providerCurrency;
  String get providerCurrency => _providerCurrency ?? '';
  bool hasProviderCurrency() => _providerCurrency != null;

  // "cashback_status" field.
  bool? _cashbackStatus;
  bool get cashbackStatus => _cashbackStatus ?? false;
  bool hasCashbackStatus() => _cashbackStatus != null;

  // "cashback_percent" field.
  double? _cashbackPercent;
  double get cashbackPercent => _cashbackPercent ?? 0.0;
  bool hasCashbackPercent() => _cashbackPercent != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _uuid = snapshotData['uuid'] as String?;
    _providerName = snapshotData['provider_name'] as String?;
    _providerServiceType = snapshotData['provider_service_type'] as String?;
    _providerStatus = snapshotData['provider_status'] as bool?;
    _providerLogo = snapshotData['provider_logo'] as String?;
    _providerDefaultCommission =
        castToType<double>(snapshotData['provider_default_commission']);
    _providerBillerCode = snapshotData['provider_biller_code'] as String?;
    _providerBillerName = snapshotData['provider_biller_name'] as String?;
    _providerItemCode = snapshotData['provider_item_code'] as String?;
    _providerShortName = snapshotData['provider_short_name'] as String?;
    _providerTransferFee =
        castToType<int>(snapshotData['provider_transfer_fee']);
    _providerCountry = snapshotData['provider_country'] as String?;
    _providerCurrency = snapshotData['provider_currency'] as String?;
    _cashbackStatus = snapshotData['cashback_status'] as bool?;
    _cashbackPercent = castToType<double>(snapshotData['cashback_percent']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('billpayment_providers');

  static Stream<BillpaymentProvidersRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => BillpaymentProvidersRecord.fromSnapshot(s));

  static Future<BillpaymentProvidersRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BillpaymentProvidersRecord.fromSnapshot(s));

  static BillpaymentProvidersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BillpaymentProvidersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BillpaymentProvidersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BillpaymentProvidersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BillpaymentProvidersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BillpaymentProvidersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBillpaymentProvidersRecordData({
  DateTime? createdAt,
  String? uuid,
  String? providerName,
  String? providerServiceType,
  bool? providerStatus,
  String? providerLogo,
  double? providerDefaultCommission,
  String? providerBillerCode,
  String? providerBillerName,
  String? providerItemCode,
  String? providerShortName,
  int? providerTransferFee,
  String? providerCountry,
  String? providerCurrency,
  bool? cashbackStatus,
  double? cashbackPercent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'uuid': uuid,
      'provider_name': providerName,
      'provider_service_type': providerServiceType,
      'provider_status': providerStatus,
      'provider_logo': providerLogo,
      'provider_default_commission': providerDefaultCommission,
      'provider_biller_code': providerBillerCode,
      'provider_biller_name': providerBillerName,
      'provider_item_code': providerItemCode,
      'provider_short_name': providerShortName,
      'provider_transfer_fee': providerTransferFee,
      'provider_country': providerCountry,
      'provider_currency': providerCurrency,
      'cashback_status': cashbackStatus,
      'cashback_percent': cashbackPercent,
    }.withoutNulls,
  );

  return firestoreData;
}

class BillpaymentProvidersRecordDocumentEquality
    implements Equality<BillpaymentProvidersRecord> {
  const BillpaymentProvidersRecordDocumentEquality();

  @override
  bool equals(BillpaymentProvidersRecord? e1, BillpaymentProvidersRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.uuid == e2?.uuid &&
        e1?.providerName == e2?.providerName &&
        e1?.providerServiceType == e2?.providerServiceType &&
        e1?.providerStatus == e2?.providerStatus &&
        e1?.providerLogo == e2?.providerLogo &&
        e1?.providerDefaultCommission == e2?.providerDefaultCommission &&
        e1?.providerBillerCode == e2?.providerBillerCode &&
        e1?.providerBillerName == e2?.providerBillerName &&
        e1?.providerItemCode == e2?.providerItemCode &&
        e1?.providerShortName == e2?.providerShortName &&
        e1?.providerTransferFee == e2?.providerTransferFee &&
        e1?.providerCountry == e2?.providerCountry &&
        e1?.providerCurrency == e2?.providerCurrency &&
        e1?.cashbackStatus == e2?.cashbackStatus &&
        e1?.cashbackPercent == e2?.cashbackPercent;
  }

  @override
  int hash(BillpaymentProvidersRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.uuid,
        e?.providerName,
        e?.providerServiceType,
        e?.providerStatus,
        e?.providerLogo,
        e?.providerDefaultCommission,
        e?.providerBillerCode,
        e?.providerBillerName,
        e?.providerItemCode,
        e?.providerShortName,
        e?.providerTransferFee,
        e?.providerCountry,
        e?.providerCurrency,
        e?.cashbackStatus,
        e?.cashbackPercent
      ]);

  @override
  bool isValidKey(Object? o) => o is BillpaymentProvidersRecord;
}
