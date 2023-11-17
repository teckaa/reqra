import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DwRecipientsSettingsRecord extends FirestoreRecord {
  DwRecipientsSettingsRecord._(
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

  // "type_name" field.
  String? _typeName;
  String get typeName => _typeName ?? '';
  bool hasTypeName() => _typeName != null;

  // "type_status" field.
  bool? _typeStatus;
  bool get typeStatus => _typeStatus ?? false;
  bool hasTypeStatus() => _typeStatus != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _uuid = snapshotData['uuid'] as String?;
    _typeName = snapshotData['type_name'] as String?;
    _typeStatus = snapshotData['type_status'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dw_recipients_settings');

  static Stream<DwRecipientsSettingsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => DwRecipientsSettingsRecord.fromSnapshot(s));

  static Future<DwRecipientsSettingsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DwRecipientsSettingsRecord.fromSnapshot(s));

  static DwRecipientsSettingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DwRecipientsSettingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DwRecipientsSettingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DwRecipientsSettingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DwRecipientsSettingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DwRecipientsSettingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDwRecipientsSettingsRecordData({
  DateTime? createdAt,
  String? uuid,
  String? typeName,
  bool? typeStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'uuid': uuid,
      'type_name': typeName,
      'type_status': typeStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class DwRecipientsSettingsRecordDocumentEquality
    implements Equality<DwRecipientsSettingsRecord> {
  const DwRecipientsSettingsRecordDocumentEquality();

  @override
  bool equals(DwRecipientsSettingsRecord? e1, DwRecipientsSettingsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.uuid == e2?.uuid &&
        e1?.typeName == e2?.typeName &&
        e1?.typeStatus == e2?.typeStatus;
  }

  @override
  int hash(DwRecipientsSettingsRecord? e) => const ListEquality()
      .hash([e?.createdAt, e?.uuid, e?.typeName, e?.typeStatus]);

  @override
  bool isValidKey(Object? o) => o is DwRecipientsSettingsRecord;
}
