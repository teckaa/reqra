import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DwEmailCustomTemplatesRecord extends FirestoreRecord {
  DwEmailCustomTemplatesRecord._(
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

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "heading" field.
  String? _heading;
  String get heading => _heading ?? '';
  bool hasHeading() => _heading != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "recipient" field.
  String? _recipient;
  String get recipient => _recipient ?? '';
  bool hasRecipient() => _recipient != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _uuid = snapshotData['uuid'] as String?;
    _name = snapshotData['name'] as String?;
    _status = snapshotData['status'] as bool?;
    _subject = snapshotData['subject'] as String?;
    _heading = snapshotData['heading'] as String?;
    _content = snapshotData['content'] as String?;
    _type = snapshotData['type'] as String?;
    _recipient = snapshotData['recipient'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dw_email_custom_templates');

  static Stream<DwEmailCustomTemplatesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => DwEmailCustomTemplatesRecord.fromSnapshot(s));

  static Future<DwEmailCustomTemplatesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DwEmailCustomTemplatesRecord.fromSnapshot(s));

  static DwEmailCustomTemplatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DwEmailCustomTemplatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DwEmailCustomTemplatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DwEmailCustomTemplatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DwEmailCustomTemplatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DwEmailCustomTemplatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDwEmailCustomTemplatesRecordData({
  DateTime? createdAt,
  String? uuid,
  String? name,
  bool? status,
  String? subject,
  String? heading,
  String? content,
  String? type,
  String? recipient,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'uuid': uuid,
      'name': name,
      'status': status,
      'subject': subject,
      'heading': heading,
      'content': content,
      'type': type,
      'recipient': recipient,
    }.withoutNulls,
  );

  return firestoreData;
}

class DwEmailCustomTemplatesRecordDocumentEquality
    implements Equality<DwEmailCustomTemplatesRecord> {
  const DwEmailCustomTemplatesRecordDocumentEquality();

  @override
  bool equals(
      DwEmailCustomTemplatesRecord? e1, DwEmailCustomTemplatesRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.uuid == e2?.uuid &&
        e1?.name == e2?.name &&
        e1?.status == e2?.status &&
        e1?.subject == e2?.subject &&
        e1?.heading == e2?.heading &&
        e1?.content == e2?.content &&
        e1?.type == e2?.type &&
        e1?.recipient == e2?.recipient;
  }

  @override
  int hash(DwEmailCustomTemplatesRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.uuid,
        e?.name,
        e?.status,
        e?.subject,
        e?.heading,
        e?.content,
        e?.type,
        e?.recipient
      ]);

  @override
  bool isValidKey(Object? o) => o is DwEmailCustomTemplatesRecord;
}
