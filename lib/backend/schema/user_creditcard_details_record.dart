import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCreditcardDetailsRecord extends FirestoreRecord {
  UserCreditcardDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "expiry_at" field.
  DateTime? _expiryAt;
  DateTime? get expiryAt => _expiryAt;
  bool hasExpiryAt() => _expiryAt != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "card_type" field.
  String? _cardType;
  String get cardType => _cardType ?? '';
  bool hasCardType() => _cardType != null;

  // "card_pan" field.
  String? _cardPan;
  String get cardPan => _cardPan ?? '';
  bool hasCardPan() => _cardPan != null;

  // "masked_pan" field.
  String? _maskedPan;
  String get maskedPan => _maskedPan ?? '';
  bool hasMaskedPan() => _maskedPan != null;

  // "cvv" field.
  int? _cvv;
  int get cvv => _cvv ?? 0;
  bool hasCvv() => _cvv != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _expiryAt = snapshotData['expiry_at'] as DateTime?;
    _amount = castToType<double>(snapshotData['amount']);
    _currency = snapshotData['currency'] as String?;
    _isActive = snapshotData['is_active'] as bool?;
    _cardType = snapshotData['card_type'] as String?;
    _cardPan = snapshotData['card_pan'] as String?;
    _maskedPan = snapshotData['masked_pan'] as String?;
    _cvv = castToType<int>(snapshotData['cvv']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_creditcard_details');

  static Stream<UserCreditcardDetailsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => UserCreditcardDetailsRecord.fromSnapshot(s));

  static Future<UserCreditcardDetailsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserCreditcardDetailsRecord.fromSnapshot(s));

  static UserCreditcardDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserCreditcardDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserCreditcardDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserCreditcardDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserCreditcardDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserCreditcardDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserCreditcardDetailsRecordData({
  DateTime? createdAt,
  DateTime? modifiedAt,
  DateTime? expiryAt,
  double? amount,
  String? currency,
  bool? isActive,
  String? cardType,
  String? cardPan,
  String? maskedPan,
  int? cvv,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'expiry_at': expiryAt,
      'amount': amount,
      'currency': currency,
      'is_active': isActive,
      'card_type': cardType,
      'card_pan': cardPan,
      'masked_pan': maskedPan,
      'cvv': cvv,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserCreditcardDetailsRecordDocumentEquality
    implements Equality<UserCreditcardDetailsRecord> {
  const UserCreditcardDetailsRecordDocumentEquality();

  @override
  bool equals(
      UserCreditcardDetailsRecord? e1, UserCreditcardDetailsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.expiryAt == e2?.expiryAt &&
        e1?.amount == e2?.amount &&
        e1?.currency == e2?.currency &&
        e1?.isActive == e2?.isActive &&
        e1?.cardType == e2?.cardType &&
        e1?.cardPan == e2?.cardPan &&
        e1?.maskedPan == e2?.maskedPan &&
        e1?.cvv == e2?.cvv;
  }

  @override
  int hash(UserCreditcardDetailsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.modifiedAt,
        e?.expiryAt,
        e?.amount,
        e?.currency,
        e?.isActive,
        e?.cardType,
        e?.cardPan,
        e?.maskedPan,
        e?.cvv
      ]);

  @override
  bool isValidKey(Object? o) => o is UserCreditcardDetailsRecord;
}
