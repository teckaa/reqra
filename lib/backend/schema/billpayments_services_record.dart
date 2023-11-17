import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BillpaymentsServicesRecord extends FirestoreRecord {
  BillpaymentsServicesRecord._(
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

  // "service_status" field.
  bool? _serviceStatus;
  bool get serviceStatus => _serviceStatus ?? false;
  bool hasServiceStatus() => _serviceStatus != null;

  // "service_name" field.
  String? _serviceName;
  String get serviceName => _serviceName ?? '';
  bool hasServiceName() => _serviceName != null;

  // "service_desc" field.
  String? _serviceDesc;
  String get serviceDesc => _serviceDesc ?? '';
  bool hasServiceDesc() => _serviceDesc != null;

  // "service_provider" field.
  List<String>? _serviceProvider;
  List<String> get serviceProvider => _serviceProvider ?? const [];
  bool hasServiceProvider() => _serviceProvider != null;

  // "service_min_amount" field.
  int? _serviceMinAmount;
  int get serviceMinAmount => _serviceMinAmount ?? 0;
  bool hasServiceMinAmount() => _serviceMinAmount != null;

  // "service_max_amount" field.
  int? _serviceMaxAmount;
  int get serviceMaxAmount => _serviceMaxAmount ?? 0;
  bool hasServiceMaxAmount() => _serviceMaxAmount != null;

  // "suspension_title" field.
  String? _suspensionTitle;
  String get suspensionTitle => _suspensionTitle ?? '';
  bool hasSuspensionTitle() => _suspensionTitle != null;

  // "suspension_desc" field.
  String? _suspensionDesc;
  String get suspensionDesc => _suspensionDesc ?? '';
  bool hasSuspensionDesc() => _suspensionDesc != null;

  // "service_amount_picker_status" field.
  bool? _serviceAmountPickerStatus;
  bool get serviceAmountPickerStatus => _serviceAmountPickerStatus ?? false;
  bool hasServiceAmountPickerStatus() => _serviceAmountPickerStatus != null;

  // "service_amount_picker" field.
  List<int>? _serviceAmountPicker;
  List<int> get serviceAmountPicker => _serviceAmountPicker ?? const [];
  bool hasServiceAmountPicker() => _serviceAmountPicker != null;

  // "service_cash_back_status" field.
  bool? _serviceCashBackStatus;
  bool get serviceCashBackStatus => _serviceCashBackStatus ?? false;
  bool hasServiceCashBackStatus() => _serviceCashBackStatus != null;

  // "servicer_cash_back_percent" field.
  double? _servicerCashBackPercent;
  double get servicerCashBackPercent => _servicerCashBackPercent ?? 0.0;
  bool hasServicerCashBackPercent() => _servicerCashBackPercent != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _uuid = snapshotData['uuid'] as String?;
    _serviceStatus = snapshotData['service_status'] as bool?;
    _serviceName = snapshotData['service_name'] as String?;
    _serviceDesc = snapshotData['service_desc'] as String?;
    _serviceProvider = getDataList(snapshotData['service_provider']);
    _serviceMinAmount = castToType<int>(snapshotData['service_min_amount']);
    _serviceMaxAmount = castToType<int>(snapshotData['service_max_amount']);
    _suspensionTitle = snapshotData['suspension_title'] as String?;
    _suspensionDesc = snapshotData['suspension_desc'] as String?;
    _serviceAmountPickerStatus =
        snapshotData['service_amount_picker_status'] as bool?;
    _serviceAmountPicker = getDataList(snapshotData['service_amount_picker']);
    _serviceCashBackStatus = snapshotData['service_cash_back_status'] as bool?;
    _servicerCashBackPercent =
        castToType<double>(snapshotData['servicer_cash_back_percent']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('billpayments_services');

  static Stream<BillpaymentsServicesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => BillpaymentsServicesRecord.fromSnapshot(s));

  static Future<BillpaymentsServicesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BillpaymentsServicesRecord.fromSnapshot(s));

  static BillpaymentsServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BillpaymentsServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BillpaymentsServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BillpaymentsServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BillpaymentsServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BillpaymentsServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBillpaymentsServicesRecordData({
  DateTime? createdAt,
  String? uuid,
  bool? serviceStatus,
  String? serviceName,
  String? serviceDesc,
  int? serviceMinAmount,
  int? serviceMaxAmount,
  String? suspensionTitle,
  String? suspensionDesc,
  bool? serviceAmountPickerStatus,
  bool? serviceCashBackStatus,
  double? servicerCashBackPercent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'uuid': uuid,
      'service_status': serviceStatus,
      'service_name': serviceName,
      'service_desc': serviceDesc,
      'service_min_amount': serviceMinAmount,
      'service_max_amount': serviceMaxAmount,
      'suspension_title': suspensionTitle,
      'suspension_desc': suspensionDesc,
      'service_amount_picker_status': serviceAmountPickerStatus,
      'service_cash_back_status': serviceCashBackStatus,
      'servicer_cash_back_percent': servicerCashBackPercent,
    }.withoutNulls,
  );

  return firestoreData;
}

class BillpaymentsServicesRecordDocumentEquality
    implements Equality<BillpaymentsServicesRecord> {
  const BillpaymentsServicesRecordDocumentEquality();

  @override
  bool equals(BillpaymentsServicesRecord? e1, BillpaymentsServicesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.uuid == e2?.uuid &&
        e1?.serviceStatus == e2?.serviceStatus &&
        e1?.serviceName == e2?.serviceName &&
        e1?.serviceDesc == e2?.serviceDesc &&
        listEquality.equals(e1?.serviceProvider, e2?.serviceProvider) &&
        e1?.serviceMinAmount == e2?.serviceMinAmount &&
        e1?.serviceMaxAmount == e2?.serviceMaxAmount &&
        e1?.suspensionTitle == e2?.suspensionTitle &&
        e1?.suspensionDesc == e2?.suspensionDesc &&
        e1?.serviceAmountPickerStatus == e2?.serviceAmountPickerStatus &&
        listEquality.equals(e1?.serviceAmountPicker, e2?.serviceAmountPicker) &&
        e1?.serviceCashBackStatus == e2?.serviceCashBackStatus &&
        e1?.servicerCashBackPercent == e2?.servicerCashBackPercent;
  }

  @override
  int hash(BillpaymentsServicesRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.uuid,
        e?.serviceStatus,
        e?.serviceName,
        e?.serviceDesc,
        e?.serviceProvider,
        e?.serviceMinAmount,
        e?.serviceMaxAmount,
        e?.suspensionTitle,
        e?.suspensionDesc,
        e?.serviceAmountPickerStatus,
        e?.serviceAmountPicker,
        e?.serviceCashBackStatus,
        e?.servicerCashBackPercent
      ]);

  @override
  bool isValidKey(Object? o) => o is BillpaymentsServicesRecord;
}
