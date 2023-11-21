import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DwAnnouncementsRecord extends FirestoreRecord {
  DwAnnouncementsRecord._(
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

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "post_desc" field.
  String? _postDesc;
  String get postDesc => _postDesc ?? '';
  bool hasPostDesc() => _postDesc != null;

  // "post_responsive" field.
  List<String>? _postResponsive;
  List<String> get postResponsive => _postResponsive ?? const [];
  bool hasPostResponsive() => _postResponsive != null;

  // "post_status" field.
  bool? _postStatus;
  bool get postStatus => _postStatus ?? false;
  bool hasPostStatus() => _postStatus != null;

  // "post_bg_color" field.
  Color? _postBgColor;
  Color? get postBgColor => _postBgColor;
  bool hasPostBgColor() => _postBgColor != null;

  // "post_text_color" field.
  Color? _postTextColor;
  Color? get postTextColor => _postTextColor;
  bool hasPostTextColor() => _postTextColor != null;

  // "post_text_size" field.
  int? _postTextSize;
  int get postTextSize => _postTextSize ?? 0;
  bool hasPostTextSize() => _postTextSize != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _postTitle = snapshotData['post_title'] as String?;
    _postDesc = snapshotData['post_desc'] as String?;
    _postResponsive = getDataList(snapshotData['post_responsive']);
    _postStatus = snapshotData['post_status'] as bool?;
    _postBgColor = getSchemaColor(snapshotData['post_bg_color']);
    _postTextColor = getSchemaColor(snapshotData['post_text_color']);
    _postTextSize = castToType<int>(snapshotData['post_text_size']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dw_announcements');

  static Stream<DwAnnouncementsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DwAnnouncementsRecord.fromSnapshot(s));

  static Future<DwAnnouncementsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DwAnnouncementsRecord.fromSnapshot(s));

  static DwAnnouncementsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DwAnnouncementsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DwAnnouncementsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DwAnnouncementsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DwAnnouncementsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DwAnnouncementsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDwAnnouncementsRecordData({
  DateTime? createdAt,
  DocumentReference? userRef,
  String? postTitle,
  String? postDesc,
  bool? postStatus,
  Color? postBgColor,
  Color? postTextColor,
  int? postTextSize,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'user_ref': userRef,
      'post_title': postTitle,
      'post_desc': postDesc,
      'post_status': postStatus,
      'post_bg_color': postBgColor,
      'post_text_color': postTextColor,
      'post_text_size': postTextSize,
    }.withoutNulls,
  );

  return firestoreData;
}

class DwAnnouncementsRecordDocumentEquality
    implements Equality<DwAnnouncementsRecord> {
  const DwAnnouncementsRecordDocumentEquality();

  @override
  bool equals(DwAnnouncementsRecord? e1, DwAnnouncementsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.postTitle == e2?.postTitle &&
        e1?.postDesc == e2?.postDesc &&
        listEquality.equals(e1?.postResponsive, e2?.postResponsive) &&
        e1?.postStatus == e2?.postStatus &&
        e1?.postBgColor == e2?.postBgColor &&
        e1?.postTextColor == e2?.postTextColor &&
        e1?.postTextSize == e2?.postTextSize;
  }

  @override
  int hash(DwAnnouncementsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.userRef,
        e?.postTitle,
        e?.postDesc,
        e?.postResponsive,
        e?.postStatus,
        e?.postBgColor,
        e?.postTextColor,
        e?.postTextSize
      ]);

  @override
  bool isValidKey(Object? o) => o is DwAnnouncementsRecord;
}
