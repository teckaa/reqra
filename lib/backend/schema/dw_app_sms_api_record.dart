import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DwAppSmsApiRecord extends FirestoreRecord {
  DwAppSmsApiRecord._(
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

  // "sms_name" field.
  String? _smsName;
  String get smsName => _smsName ?? '';
  bool hasSmsName() => _smsName != null;

  // "sms_api" field.
  String? _smsApi;
  String get smsApi => _smsApi ?? '';
  bool hasSmsApi() => _smsApi != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _uuid = snapshotData['uuid'] as String?;
    _smsName = snapshotData['sms_name'] as String?;
    _smsApi = snapshotData['sms_api'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dw_app_sms_api');

  static Stream<DwAppSmsApiRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DwAppSmsApiRecord.fromSnapshot(s));

  static Future<DwAppSmsApiRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DwAppSmsApiRecord.fromSnapshot(s));

  static DwAppSmsApiRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DwAppSmsApiRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DwAppSmsApiRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DwAppSmsApiRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DwAppSmsApiRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DwAppSmsApiRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDwAppSmsApiRecordData({
  DateTime? createdAt,
  String? uuid,
  String? smsName,
  String? smsApi,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'uuid': uuid,
      'sms_name': smsName,
      'sms_api': smsApi,
    }.withoutNulls,
  );

  return firestoreData;
}

class DwAppSmsApiRecordDocumentEquality implements Equality<DwAppSmsApiRecord> {
  const DwAppSmsApiRecordDocumentEquality();

  @override
  bool equals(DwAppSmsApiRecord? e1, DwAppSmsApiRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.uuid == e2?.uuid &&
        e1?.smsName == e2?.smsName &&
        e1?.smsApi == e2?.smsApi;
  }

  @override
  int hash(DwAppSmsApiRecord? e) =>
      const ListEquality().hash([e?.createdAt, e?.uuid, e?.smsName, e?.smsApi]);

  @override
  bool isValidKey(Object? o) => o is DwAppSmsApiRecord;
}
