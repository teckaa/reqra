import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DwThemesRecord extends FirestoreRecord {
  DwThemesRecord._(
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

  // "theme_name" field.
  String? _themeName;
  String get themeName => _themeName ?? '';
  bool hasThemeName() => _themeName != null;

  // "theme_desc" field.
  String? _themeDesc;
  String get themeDesc => _themeDesc ?? '';
  bool hasThemeDesc() => _themeDesc != null;

  // "theme_photo" field.
  String? _themePhoto;
  String get themePhoto => _themePhoto ?? '';
  bool hasThemePhoto() => _themePhoto != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _uuid = snapshotData['uuid'] as String?;
    _themeName = snapshotData['theme_name'] as String?;
    _themeDesc = snapshotData['theme_desc'] as String?;
    _themePhoto = snapshotData['theme_photo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dw_themes');

  static Stream<DwThemesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DwThemesRecord.fromSnapshot(s));

  static Future<DwThemesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DwThemesRecord.fromSnapshot(s));

  static DwThemesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DwThemesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DwThemesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DwThemesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DwThemesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DwThemesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDwThemesRecordData({
  DateTime? createdAt,
  String? uuid,
  String? themeName,
  String? themeDesc,
  String? themePhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'uuid': uuid,
      'theme_name': themeName,
      'theme_desc': themeDesc,
      'theme_photo': themePhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class DwThemesRecordDocumentEquality implements Equality<DwThemesRecord> {
  const DwThemesRecordDocumentEquality();

  @override
  bool equals(DwThemesRecord? e1, DwThemesRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.uuid == e2?.uuid &&
        e1?.themeName == e2?.themeName &&
        e1?.themeDesc == e2?.themeDesc &&
        e1?.themePhoto == e2?.themePhoto;
  }

  @override
  int hash(DwThemesRecord? e) => const ListEquality()
      .hash([e?.createdAt, e?.uuid, e?.themeName, e?.themeDesc, e?.themePhoto]);

  @override
  bool isValidKey(Object? o) => o is DwThemesRecord;
}
