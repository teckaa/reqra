import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DwPostsSettingsRecord extends FirestoreRecord {
  DwPostsSettingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "blog_name" field.
  String? _blogName;
  String get blogName => _blogName ?? '';
  bool hasBlogName() => _blogName != null;

  // "blog_title" field.
  String? _blogTitle;
  String get blogTitle => _blogTitle ?? '';
  bool hasBlogTitle() => _blogTitle != null;

  // "blog_desc" field.
  String? _blogDesc;
  String get blogDesc => _blogDesc ?? '';
  bool hasBlogDesc() => _blogDesc != null;

  // "blog_width" field.
  int? _blogWidth;
  int get blogWidth => _blogWidth ?? 0;
  bool hasBlogWidth() => _blogWidth != null;

  void _initializeFields() {
    _blogName = snapshotData['blog_name'] as String?;
    _blogTitle = snapshotData['blog_title'] as String?;
    _blogDesc = snapshotData['blog_desc'] as String?;
    _blogWidth = castToType<int>(snapshotData['blog_width']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dw_posts_settings');

  static Stream<DwPostsSettingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DwPostsSettingsRecord.fromSnapshot(s));

  static Future<DwPostsSettingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DwPostsSettingsRecord.fromSnapshot(s));

  static DwPostsSettingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DwPostsSettingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DwPostsSettingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DwPostsSettingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DwPostsSettingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DwPostsSettingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDwPostsSettingsRecordData({
  String? blogName,
  String? blogTitle,
  String? blogDesc,
  int? blogWidth,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'blog_name': blogName,
      'blog_title': blogTitle,
      'blog_desc': blogDesc,
      'blog_width': blogWidth,
    }.withoutNulls,
  );

  return firestoreData;
}

class DwPostsSettingsRecordDocumentEquality
    implements Equality<DwPostsSettingsRecord> {
  const DwPostsSettingsRecordDocumentEquality();

  @override
  bool equals(DwPostsSettingsRecord? e1, DwPostsSettingsRecord? e2) {
    return e1?.blogName == e2?.blogName &&
        e1?.blogTitle == e2?.blogTitle &&
        e1?.blogDesc == e2?.blogDesc &&
        e1?.blogWidth == e2?.blogWidth;
  }

  @override
  int hash(DwPostsSettingsRecord? e) => const ListEquality()
      .hash([e?.blogName, e?.blogTitle, e?.blogDesc, e?.blogWidth]);

  @override
  bool isValidKey(Object? o) => o is DwPostsSettingsRecord;
}
