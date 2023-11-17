import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DwAppEmailApiRecord extends FirestoreRecord {
  DwAppEmailApiRecord._(
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

  // "email_provider_name" field.
  String? _emailProviderName;
  String get emailProviderName => _emailProviderName ?? '';
  bool hasEmailProviderName() => _emailProviderName != null;

  // "email_provider_api" field.
  String? _emailProviderApi;
  String get emailProviderApi => _emailProviderApi ?? '';
  bool hasEmailProviderApi() => _emailProviderApi != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _uuid = snapshotData['uuid'] as String?;
    _emailProviderName = snapshotData['email_provider_name'] as String?;
    _emailProviderApi = snapshotData['email_provider_api'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dw_app_email_api');

  static Stream<DwAppEmailApiRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DwAppEmailApiRecord.fromSnapshot(s));

  static Future<DwAppEmailApiRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DwAppEmailApiRecord.fromSnapshot(s));

  static DwAppEmailApiRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DwAppEmailApiRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DwAppEmailApiRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DwAppEmailApiRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DwAppEmailApiRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DwAppEmailApiRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDwAppEmailApiRecordData({
  DateTime? createdAt,
  String? uuid,
  String? emailProviderName,
  String? emailProviderApi,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'uuid': uuid,
      'email_provider_name': emailProviderName,
      'email_provider_api': emailProviderApi,
    }.withoutNulls,
  );

  return firestoreData;
}

class DwAppEmailApiRecordDocumentEquality
    implements Equality<DwAppEmailApiRecord> {
  const DwAppEmailApiRecordDocumentEquality();

  @override
  bool equals(DwAppEmailApiRecord? e1, DwAppEmailApiRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.uuid == e2?.uuid &&
        e1?.emailProviderName == e2?.emailProviderName &&
        e1?.emailProviderApi == e2?.emailProviderApi;
  }

  @override
  int hash(DwAppEmailApiRecord? e) => const ListEquality()
      .hash([e?.createdAt, e?.uuid, e?.emailProviderName, e?.emailProviderApi]);

  @override
  bool isValidKey(Object? o) => o is DwAppEmailApiRecord;
}
