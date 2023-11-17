import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "dob" field.
  String? _dob;
  String get dob => _dob ?? '';
  bool hasDob() => _dob != null;

  // "user_role" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  bool hasUserRole() => _userRole != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "user_referral" field.
  DocumentReference? _userReferral;
  DocumentReference? get userReferral => _userReferral;
  bool hasUserReferral() => _userReferral != null;

  // "user_referrals" field.
  List<DocumentReference>? _userReferrals;
  List<DocumentReference> get userReferrals => _userReferrals ?? const [];
  bool hasUserReferrals() => _userReferrals != null;

  // "is_user_active" field.
  String? _isUserActive;
  String get isUserActive => _isUserActive ?? '';
  bool hasIsUserActive() => _isUserActive != null;

  // "iso_code" field.
  String? _isoCode;
  String get isoCode => _isoCode ?? '';
  bool hasIsoCode() => _isoCode != null;

  // "dial_code" field.
  String? _dialCode;
  String get dialCode => _dialCode ?? '';
  bool hasDialCode() => _dialCode != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "zipcode" field.
  String? _zipcode;
  String get zipcode => _zipcode ?? '';
  bool hasZipcode() => _zipcode != null;

  // "apartment_number" field.
  String? _apartmentNumber;
  String get apartmentNumber => _apartmentNumber ?? '';
  bool hasApartmentNumber() => _apartmentNumber != null;

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  bool hasStreet() => _street != null;

  // "user_status" field.
  String? _userStatus;
  String get userStatus => _userStatus ?? '';
  bool hasUserStatus() => _userStatus != null;

  // "bvn_number" field.
  String? _bvnNumber;
  String get bvnNumber => _bvnNumber ?? '';
  bool hasBvnNumber() => _bvnNumber != null;

  // "account_balance" field.
  double? _accountBalance;
  double get accountBalance => _accountBalance ?? 0.0;
  bool hasAccountBalance() => _accountBalance != null;

  // "account_number" field.
  int? _accountNumber;
  int get accountNumber => _accountNumber ?? 0;
  bool hasAccountNumber() => _accountNumber != null;

  // "security_pin" field.
  String? _securityPin;
  String get securityPin => _securityPin ?? '';
  bool hasSecurityPin() => _securityPin != null;

  // "transaction_pin" field.
  String? _transactionPin;
  String get transactionPin => _transactionPin ?? '';
  bool hasTransactionPin() => _transactionPin != null;

  // "card_account_balance" field.
  double? _cardAccountBalance;
  double get cardAccountBalance => _cardAccountBalance ?? 0.0;
  bool hasCardAccountBalance() => _cardAccountBalance != null;

  // "push_notification" field.
  bool? _pushNotification;
  bool get pushNotification => _pushNotification ?? false;
  bool hasPushNotification() => _pushNotification != null;

  // "email_notification" field.
  bool? _emailNotification;
  bool get emailNotification => _emailNotification ?? false;
  bool hasEmailNotification() => _emailNotification != null;

  // "permissions" field.
  List<DocumentReference>? _permissions;
  List<DocumentReference> get permissions => _permissions ?? const [];
  bool hasPermissions() => _permissions != null;

  // "cash_back_balance" field.
  double? _cashBackBalance;
  double get cashBackBalance => _cashBackBalance ?? 0.0;
  bool hasCashBackBalance() => _cashBackBalance != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _currency = snapshotData['currency'] as String?;
    _dob = snapshotData['dob'] as String?;
    _userRole = snapshotData['user_role'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _gender = snapshotData['gender'] as String?;
    _userReferral = snapshotData['user_referral'] as DocumentReference?;
    _userReferrals = getDataList(snapshotData['user_referrals']);
    _isUserActive = snapshotData['is_user_active'] as String?;
    _isoCode = snapshotData['iso_code'] as String?;
    _dialCode = snapshotData['dial_code'] as String?;
    _country = snapshotData['country'] as String?;
    _address = snapshotData['address'] as String?;
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _zipcode = snapshotData['zipcode'] as String?;
    _apartmentNumber = snapshotData['apartment_number'] as String?;
    _street = snapshotData['street'] as String?;
    _userStatus = snapshotData['user_status'] as String?;
    _bvnNumber = snapshotData['bvn_number'] as String?;
    _accountBalance = castToType<double>(snapshotData['account_balance']);
    _accountNumber = castToType<int>(snapshotData['account_number']);
    _securityPin = snapshotData['security_pin'] as String?;
    _transactionPin = snapshotData['transaction_pin'] as String?;
    _cardAccountBalance =
        castToType<double>(snapshotData['card_account_balance']);
    _pushNotification = snapshotData['push_notification'] as bool?;
    _emailNotification = snapshotData['email_notification'] as bool?;
    _permissions = getDataList(snapshotData['permissions']);
    _cashBackBalance = castToType<double>(snapshotData['cash_back_balance']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? currency,
  String? dob,
  String? userRole,
  String? firstName,
  String? lastName,
  String? gender,
  DocumentReference? userReferral,
  String? isUserActive,
  String? isoCode,
  String? dialCode,
  String? country,
  String? address,
  String? city,
  String? state,
  String? zipcode,
  String? apartmentNumber,
  String? street,
  String? userStatus,
  String? bvnNumber,
  double? accountBalance,
  int? accountNumber,
  String? securityPin,
  String? transactionPin,
  double? cardAccountBalance,
  bool? pushNotification,
  bool? emailNotification,
  double? cashBackBalance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'currency': currency,
      'dob': dob,
      'user_role': userRole,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'user_referral': userReferral,
      'is_user_active': isUserActive,
      'iso_code': isoCode,
      'dial_code': dialCode,
      'country': country,
      'address': address,
      'city': city,
      'state': state,
      'zipcode': zipcode,
      'apartment_number': apartmentNumber,
      'street': street,
      'user_status': userStatus,
      'bvn_number': bvnNumber,
      'account_balance': accountBalance,
      'account_number': accountNumber,
      'security_pin': securityPin,
      'transaction_pin': transactionPin,
      'card_account_balance': cardAccountBalance,
      'push_notification': pushNotification,
      'email_notification': emailNotification,
      'cash_back_balance': cashBackBalance,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.currency == e2?.currency &&
        e1?.dob == e2?.dob &&
        e1?.userRole == e2?.userRole &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.gender == e2?.gender &&
        e1?.userReferral == e2?.userReferral &&
        listEquality.equals(e1?.userReferrals, e2?.userReferrals) &&
        e1?.isUserActive == e2?.isUserActive &&
        e1?.isoCode == e2?.isoCode &&
        e1?.dialCode == e2?.dialCode &&
        e1?.country == e2?.country &&
        e1?.address == e2?.address &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        e1?.zipcode == e2?.zipcode &&
        e1?.apartmentNumber == e2?.apartmentNumber &&
        e1?.street == e2?.street &&
        e1?.userStatus == e2?.userStatus &&
        e1?.bvnNumber == e2?.bvnNumber &&
        e1?.accountBalance == e2?.accountBalance &&
        e1?.accountNumber == e2?.accountNumber &&
        e1?.securityPin == e2?.securityPin &&
        e1?.transactionPin == e2?.transactionPin &&
        e1?.cardAccountBalance == e2?.cardAccountBalance &&
        e1?.pushNotification == e2?.pushNotification &&
        e1?.emailNotification == e2?.emailNotification &&
        listEquality.equals(e1?.permissions, e2?.permissions) &&
        e1?.cashBackBalance == e2?.cashBackBalance;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.currency,
        e?.dob,
        e?.userRole,
        e?.firstName,
        e?.lastName,
        e?.gender,
        e?.userReferral,
        e?.userReferrals,
        e?.isUserActive,
        e?.isoCode,
        e?.dialCode,
        e?.country,
        e?.address,
        e?.city,
        e?.state,
        e?.zipcode,
        e?.apartmentNumber,
        e?.street,
        e?.userStatus,
        e?.bvnNumber,
        e?.accountBalance,
        e?.accountNumber,
        e?.securityPin,
        e?.transactionPin,
        e?.cardAccountBalance,
        e?.pushNotification,
        e?.emailNotification,
        e?.permissions,
        e?.cashBackBalance
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
