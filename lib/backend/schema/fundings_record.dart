import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FundingsRecord extends FirestoreRecord {
  FundingsRecord._(
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

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "merchant" field.
  String? _merchant;
  String get merchant => _merchant ?? '';
  bool hasMerchant() => _merchant != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _uuid = snapshotData['uuid'] as String?;
    _amount = castToType<int>(snapshotData['amount']);
    _country = snapshotData['country'] as String?;
    _currency = snapshotData['currency'] as String?;
    _merchant = snapshotData['merchant'] as String?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fundings');

  static Stream<FundingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FundingsRecord.fromSnapshot(s));

  static Future<FundingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FundingsRecord.fromSnapshot(s));

  static FundingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FundingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FundingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FundingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FundingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FundingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFundingsRecordData({
  DateTime? createdAt,
  DocumentReference? userRef,
  String? uuid,
  int? amount,
  String? country,
  String? currency,
  String? merchant,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'user_ref': userRef,
      'uuid': uuid,
      'amount': amount,
      'country': country,
      'currency': currency,
      'merchant': merchant,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class FundingsRecordDocumentEquality implements Equality<FundingsRecord> {
  const FundingsRecordDocumentEquality();

  @override
  bool equals(FundingsRecord? e1, FundingsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.uuid == e2?.uuid &&
        e1?.amount == e2?.amount &&
        e1?.country == e2?.country &&
        e1?.currency == e2?.currency &&
        e1?.merchant == e2?.merchant &&
        e1?.status == e2?.status;
  }

  @override
  int hash(FundingsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.userRef,
        e?.uuid,
        e?.amount,
        e?.country,
        e?.currency,
        e?.merchant,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is FundingsRecord;
}
