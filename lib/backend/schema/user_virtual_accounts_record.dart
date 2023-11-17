import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserVirtualAccountsRecord extends FirestoreRecord {
  UserVirtualAccountsRecord._(
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

  // "expiry_date" field.
  String? _expiryDate;
  String get expiryDate => _expiryDate ?? '';
  bool hasExpiryDate() => _expiryDate != null;

  // "flw_ref" field.
  String? _flwRef;
  String get flwRef => _flwRef ?? '';
  bool hasFlwRef() => _flwRef != null;

  // "order_ref" field.
  String? _orderRef;
  String get orderRef => _orderRef ?? '';
  bool hasOrderRef() => _orderRef != null;

  // "account_number" field.
  String? _accountNumber;
  String get accountNumber => _accountNumber ?? '';
  bool hasAccountNumber() => _accountNumber != null;

  // "account_status" field.
  String? _accountStatus;
  String get accountStatus => _accountStatus ?? '';
  bool hasAccountStatus() => _accountStatus != null;

  // "frequency" field.
  String? _frequency;
  String get frequency => _frequency ?? '';
  bool hasFrequency() => _frequency != null;

  // "bank_name" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  bool hasBankName() => _bankName != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _expiryDate = snapshotData['expiry_date'] as String?;
    _flwRef = snapshotData['flw_ref'] as String?;
    _orderRef = snapshotData['order_ref'] as String?;
    _accountNumber = snapshotData['account_number'] as String?;
    _accountStatus = snapshotData['account_status'] as String?;
    _frequency = snapshotData['frequency'] as String?;
    _bankName = snapshotData['bank_name'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_virtual_accounts');

  static Stream<UserVirtualAccountsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserVirtualAccountsRecord.fromSnapshot(s));

  static Future<UserVirtualAccountsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserVirtualAccountsRecord.fromSnapshot(s));

  static UserVirtualAccountsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserVirtualAccountsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserVirtualAccountsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserVirtualAccountsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserVirtualAccountsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserVirtualAccountsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserVirtualAccountsRecordData({
  DateTime? createdAt,
  DocumentReference? userRef,
  String? expiryDate,
  String? flwRef,
  String? orderRef,
  String? accountNumber,
  String? accountStatus,
  String? frequency,
  String? bankName,
  double? amount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'user_ref': userRef,
      'expiry_date': expiryDate,
      'flw_ref': flwRef,
      'order_ref': orderRef,
      'account_number': accountNumber,
      'account_status': accountStatus,
      'frequency': frequency,
      'bank_name': bankName,
      'amount': amount,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserVirtualAccountsRecordDocumentEquality
    implements Equality<UserVirtualAccountsRecord> {
  const UserVirtualAccountsRecordDocumentEquality();

  @override
  bool equals(UserVirtualAccountsRecord? e1, UserVirtualAccountsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.expiryDate == e2?.expiryDate &&
        e1?.flwRef == e2?.flwRef &&
        e1?.orderRef == e2?.orderRef &&
        e1?.accountNumber == e2?.accountNumber &&
        e1?.accountStatus == e2?.accountStatus &&
        e1?.frequency == e2?.frequency &&
        e1?.bankName == e2?.bankName &&
        e1?.amount == e2?.amount;
  }

  @override
  int hash(UserVirtualAccountsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.userRef,
        e?.expiryDate,
        e?.flwRef,
        e?.orderRef,
        e?.accountNumber,
        e?.accountStatus,
        e?.frequency,
        e?.bankName,
        e?.amount
      ]);

  @override
  bool isValidKey(Object? o) => o is UserVirtualAccountsRecord;
}
