import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BillpaymentOrdersRecord extends FirestoreRecord {
  BillpaymentOrdersRecord._(
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

  // "service_type" field.
  String? _serviceType;
  String get serviceType => _serviceType ?? '';
  bool hasServiceType() => _serviceType != null;

  // "service_provider" field.
  String? _serviceProvider;
  String get serviceProvider => _serviceProvider ?? '';
  bool hasServiceProvider() => _serviceProvider != null;

  // "package" field.
  String? _package;
  String get package => _package ?? '';
  bool hasPackage() => _package != null;

  // "customer_number" field.
  int? _customerNumber;
  int get customerNumber => _customerNumber ?? 0;
  bool hasCustomerNumber() => _customerNumber != null;

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

  // "tax" field.
  double? _tax;
  double get tax => _tax ?? 0.0;
  bool hasTax() => _tax != null;

  // "commission" field.
  double? _commission;
  double get commission => _commission ?? 0.0;
  bool hasCommission() => _commission != null;

  // "service_provider_logo" field.
  String? _serviceProviderLogo;
  String get serviceProviderLogo => _serviceProviderLogo ?? '';
  bool hasServiceProviderLogo() => _serviceProviderLogo != null;

  // "permissions" field.
  List<String>? _permissions;
  List<String> get permissions => _permissions ?? const [];
  bool hasPermissions() => _permissions != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _uuid = snapshotData['uuid'] as String?;
    _serviceType = snapshotData['service_type'] as String?;
    _serviceProvider = snapshotData['service_provider'] as String?;
    _package = snapshotData['package'] as String?;
    _customerNumber = castToType<int>(snapshotData['customer_number']);
    _amount = castToType<int>(snapshotData['amount']);
    _country = snapshotData['country'] as String?;
    _currency = snapshotData['currency'] as String?;
    _tax = castToType<double>(snapshotData['tax']);
    _commission = castToType<double>(snapshotData['commission']);
    _serviceProviderLogo = snapshotData['service_provider_logo'] as String?;
    _permissions = getDataList(snapshotData['permissions']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('billpayment_orders');

  static Stream<BillpaymentOrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BillpaymentOrdersRecord.fromSnapshot(s));

  static Future<BillpaymentOrdersRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BillpaymentOrdersRecord.fromSnapshot(s));

  static BillpaymentOrdersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BillpaymentOrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BillpaymentOrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BillpaymentOrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BillpaymentOrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BillpaymentOrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBillpaymentOrdersRecordData({
  DateTime? createdAt,
  DocumentReference? userRef,
  String? uuid,
  String? serviceType,
  String? serviceProvider,
  String? package,
  int? customerNumber,
  int? amount,
  String? country,
  String? currency,
  double? tax,
  double? commission,
  String? serviceProviderLogo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'user_ref': userRef,
      'uuid': uuid,
      'service_type': serviceType,
      'service_provider': serviceProvider,
      'package': package,
      'customer_number': customerNumber,
      'amount': amount,
      'country': country,
      'currency': currency,
      'tax': tax,
      'commission': commission,
      'service_provider_logo': serviceProviderLogo,
    }.withoutNulls,
  );

  return firestoreData;
}

class BillpaymentOrdersRecordDocumentEquality
    implements Equality<BillpaymentOrdersRecord> {
  const BillpaymentOrdersRecordDocumentEquality();

  @override
  bool equals(BillpaymentOrdersRecord? e1, BillpaymentOrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.uuid == e2?.uuid &&
        e1?.serviceType == e2?.serviceType &&
        e1?.serviceProvider == e2?.serviceProvider &&
        e1?.package == e2?.package &&
        e1?.customerNumber == e2?.customerNumber &&
        e1?.amount == e2?.amount &&
        e1?.country == e2?.country &&
        e1?.currency == e2?.currency &&
        e1?.tax == e2?.tax &&
        e1?.commission == e2?.commission &&
        e1?.serviceProviderLogo == e2?.serviceProviderLogo &&
        listEquality.equals(e1?.permissions, e2?.permissions);
  }

  @override
  int hash(BillpaymentOrdersRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.userRef,
        e?.uuid,
        e?.serviceType,
        e?.serviceProvider,
        e?.package,
        e?.customerNumber,
        e?.amount,
        e?.country,
        e?.currency,
        e?.tax,
        e?.commission,
        e?.serviceProviderLogo,
        e?.permissions
      ]);

  @override
  bool isValidKey(Object? o) => o is BillpaymentOrdersRecord;
}
