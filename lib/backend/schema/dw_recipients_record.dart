import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DwRecipientsRecord extends FirestoreRecord {
  DwRecipientsRecord._(
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

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "bank_name" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  bool hasBankName() => _bankName != null;

  // "account_number" field.
  String? _accountNumber;
  String get accountNumber => _accountNumber ?? '';
  bool hasAccountNumber() => _accountNumber != null;

  // "account_name" field.
  String? _accountName;
  String get accountName => _accountName ?? '';
  bool hasAccountName() => _accountName != null;

  // "account_owner" field.
  String? _accountOwner;
  String get accountOwner => _accountOwner ?? '';
  bool hasAccountOwner() => _accountOwner != null;

  // "iban_number" field.
  String? _ibanNumber;
  String get ibanNumber => _ibanNumber ?? '';
  bool hasIbanNumber() => _ibanNumber != null;

  // "sort_code" field.
  String? _sortCode;
  String get sortCode => _sortCode ?? '';
  bool hasSortCode() => _sortCode != null;

  // "swift_code" field.
  String? _swiftCode;
  String get swiftCode => _swiftCode ?? '';
  bool hasSwiftCode() => _swiftCode != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _uuid = snapshotData['uuid'] as String?;
    _type = snapshotData['type'] as String?;
    _country = snapshotData['country'] as String?;
    _bankName = snapshotData['bank_name'] as String?;
    _accountNumber = snapshotData['account_number'] as String?;
    _accountName = snapshotData['account_name'] as String?;
    _accountOwner = snapshotData['account_owner'] as String?;
    _ibanNumber = snapshotData['iban_number'] as String?;
    _sortCode = snapshotData['sort_code'] as String?;
    _swiftCode = snapshotData['swift_code'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dw_recipients');

  static Stream<DwRecipientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DwRecipientsRecord.fromSnapshot(s));

  static Future<DwRecipientsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DwRecipientsRecord.fromSnapshot(s));

  static DwRecipientsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DwRecipientsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DwRecipientsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DwRecipientsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DwRecipientsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DwRecipientsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDwRecipientsRecordData({
  DateTime? createdAt,
  DocumentReference? userRef,
  String? uuid,
  String? type,
  String? country,
  String? bankName,
  String? accountNumber,
  String? accountName,
  String? accountOwner,
  String? ibanNumber,
  String? sortCode,
  String? swiftCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'user_ref': userRef,
      'uuid': uuid,
      'type': type,
      'country': country,
      'bank_name': bankName,
      'account_number': accountNumber,
      'account_name': accountName,
      'account_owner': accountOwner,
      'iban_number': ibanNumber,
      'sort_code': sortCode,
      'swift_code': swiftCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class DwRecipientsRecordDocumentEquality
    implements Equality<DwRecipientsRecord> {
  const DwRecipientsRecordDocumentEquality();

  @override
  bool equals(DwRecipientsRecord? e1, DwRecipientsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.uuid == e2?.uuid &&
        e1?.type == e2?.type &&
        e1?.country == e2?.country &&
        e1?.bankName == e2?.bankName &&
        e1?.accountNumber == e2?.accountNumber &&
        e1?.accountName == e2?.accountName &&
        e1?.accountOwner == e2?.accountOwner &&
        e1?.ibanNumber == e2?.ibanNumber &&
        e1?.sortCode == e2?.sortCode &&
        e1?.swiftCode == e2?.swiftCode;
  }

  @override
  int hash(DwRecipientsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.userRef,
        e?.uuid,
        e?.type,
        e?.country,
        e?.bankName,
        e?.accountNumber,
        e?.accountName,
        e?.accountOwner,
        e?.ibanNumber,
        e?.sortCode,
        e?.swiftCode
      ]);

  @override
  bool isValidKey(Object? o) => o is DwRecipientsRecord;
}
