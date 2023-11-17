import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DwAppHelpCenterRecord extends FirestoreRecord {
  DwAppHelpCenterRecord._(
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

  // "help_center_title" field.
  String? _helpCenterTitle;
  String get helpCenterTitle => _helpCenterTitle ?? '';
  bool hasHelpCenterTitle() => _helpCenterTitle != null;

  // "help_center_desc" field.
  String? _helpCenterDesc;
  String get helpCenterDesc => _helpCenterDesc ?? '';
  bool hasHelpCenterDesc() => _helpCenterDesc != null;

  // "help_center_hotline" field.
  String? _helpCenterHotline;
  String get helpCenterHotline => _helpCenterHotline ?? '';
  bool hasHelpCenterHotline() => _helpCenterHotline != null;

  // "help_center_email" field.
  String? _helpCenterEmail;
  String get helpCenterEmail => _helpCenterEmail ?? '';
  bool hasHelpCenterEmail() => _helpCenterEmail != null;

  // "help_center_image" field.
  String? _helpCenterImage;
  String get helpCenterImage => _helpCenterImage ?? '';
  bool hasHelpCenterImage() => _helpCenterImage != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _uuid = snapshotData['uuid'] as String?;
    _helpCenterTitle = snapshotData['help_center_title'] as String?;
    _helpCenterDesc = snapshotData['help_center_desc'] as String?;
    _helpCenterHotline = snapshotData['help_center_hotline'] as String?;
    _helpCenterEmail = snapshotData['help_center_email'] as String?;
    _helpCenterImage = snapshotData['help_center_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dw_app_help_center');

  static Stream<DwAppHelpCenterRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DwAppHelpCenterRecord.fromSnapshot(s));

  static Future<DwAppHelpCenterRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DwAppHelpCenterRecord.fromSnapshot(s));

  static DwAppHelpCenterRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DwAppHelpCenterRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DwAppHelpCenterRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DwAppHelpCenterRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DwAppHelpCenterRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DwAppHelpCenterRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDwAppHelpCenterRecordData({
  DateTime? createdAt,
  String? uuid,
  String? helpCenterTitle,
  String? helpCenterDesc,
  String? helpCenterHotline,
  String? helpCenterEmail,
  String? helpCenterImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'uuid': uuid,
      'help_center_title': helpCenterTitle,
      'help_center_desc': helpCenterDesc,
      'help_center_hotline': helpCenterHotline,
      'help_center_email': helpCenterEmail,
      'help_center_image': helpCenterImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class DwAppHelpCenterRecordDocumentEquality
    implements Equality<DwAppHelpCenterRecord> {
  const DwAppHelpCenterRecordDocumentEquality();

  @override
  bool equals(DwAppHelpCenterRecord? e1, DwAppHelpCenterRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.uuid == e2?.uuid &&
        e1?.helpCenterTitle == e2?.helpCenterTitle &&
        e1?.helpCenterDesc == e2?.helpCenterDesc &&
        e1?.helpCenterHotline == e2?.helpCenterHotline &&
        e1?.helpCenterEmail == e2?.helpCenterEmail &&
        e1?.helpCenterImage == e2?.helpCenterImage;
  }

  @override
  int hash(DwAppHelpCenterRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.uuid,
        e?.helpCenterTitle,
        e?.helpCenterDesc,
        e?.helpCenterHotline,
        e?.helpCenterEmail,
        e?.helpCenterImage
      ]);

  @override
  bool isValidKey(Object? o) => o is DwAppHelpCenterRecord;
}
