import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FintechTransactionsRecord extends FirestoreRecord {
  FintechTransactionsRecord._(
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

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "from" field.
  String? _from;
  String get from => _from ?? '';
  bool hasFrom() => _from != null;

  // "to" field.
  String? _to;
  String get to => _to ?? '';
  bool hasTo() => _to != null;

  // "payment_method" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  bool hasPaymentMethod() => _paymentMethod != null;

  // "reference_id" field.
  String? _referenceId;
  String get referenceId => _referenceId ?? '';
  bool hasReferenceId() => _referenceId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['amount']);
    _from = snapshotData['from'] as String?;
    _to = snapshotData['to'] as String?;
    _paymentMethod = snapshotData['payment_method'] as String?;
    _referenceId = snapshotData['reference_id'] as String?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fintech_transactions');

  static Stream<FintechTransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FintechTransactionsRecord.fromSnapshot(s));

  static Future<FintechTransactionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FintechTransactionsRecord.fromSnapshot(s));

  static FintechTransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FintechTransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FintechTransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FintechTransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FintechTransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FintechTransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFintechTransactionsRecordData({
  DateTime? createdAt,
  DocumentReference? userRef,
  double? amount,
  String? from,
  String? to,
  String? paymentMethod,
  String? referenceId,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'user_ref': userRef,
      'amount': amount,
      'from': from,
      'to': to,
      'payment_method': paymentMethod,
      'reference_id': referenceId,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class FintechTransactionsRecordDocumentEquality
    implements Equality<FintechTransactionsRecord> {
  const FintechTransactionsRecordDocumentEquality();

  @override
  bool equals(FintechTransactionsRecord? e1, FintechTransactionsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.amount == e2?.amount &&
        e1?.from == e2?.from &&
        e1?.to == e2?.to &&
        e1?.paymentMethod == e2?.paymentMethod &&
        e1?.referenceId == e2?.referenceId &&
        e1?.status == e2?.status;
  }

  @override
  int hash(FintechTransactionsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.userRef,
        e?.amount,
        e?.from,
        e?.to,
        e?.paymentMethod,
        e?.referenceId,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is FintechTransactionsRecord;
}
