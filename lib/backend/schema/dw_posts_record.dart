import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DwPostsRecord extends FirestoreRecord {
  DwPostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "post_type" field.
  String? _postType;
  String get postType => _postType ?? '';
  bool hasPostType() => _postType != null;

  // "post_publish_status" field.
  String? _postPublishStatus;
  String get postPublishStatus => _postPublishStatus ?? '';
  bool hasPostPublishStatus() => _postPublishStatus != null;

  // "post_categories" field.
  List<String>? _postCategories;
  List<String> get postCategories => _postCategories ?? const [];
  bool hasPostCategories() => _postCategories != null;

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "post_description" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "post_excerpt" field.
  String? _postExcerpt;
  String get postExcerpt => _postExcerpt ?? '';
  bool hasPostExcerpt() => _postExcerpt != null;

  // "post_likes" field.
  List<DocumentReference>? _postLikes;
  List<DocumentReference> get postLikes => _postLikes ?? const [];
  bool hasPostLikes() => _postLikes != null;

  // "post_num_comments" field.
  int? _postNumComments;
  int get postNumComments => _postNumComments ?? 0;
  bool hasPostNumComments() => _postNumComments != null;

  // "post_num_votes" field.
  int? _postNumVotes;
  int get postNumVotes => _postNumVotes ?? 0;
  bool hasPostNumVotes() => _postNumVotes != null;

  // "post_media" field.
  String? _postMedia;
  String get postMedia => _postMedia ?? '';
  bool hasPostMedia() => _postMedia != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _postType = snapshotData['post_type'] as String?;
    _postPublishStatus = snapshotData['post_publish_status'] as String?;
    _postCategories = getDataList(snapshotData['post_categories']);
    _postTitle = snapshotData['post_title'] as String?;
    _postDescription = snapshotData['post_description'] as String?;
    _postExcerpt = snapshotData['post_excerpt'] as String?;
    _postLikes = getDataList(snapshotData['post_likes']);
    _postNumComments = castToType<int>(snapshotData['post_num_comments']);
    _postNumVotes = castToType<int>(snapshotData['post_num_votes']);
    _postMedia = snapshotData['post_media'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dw_posts');

  static Stream<DwPostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DwPostsRecord.fromSnapshot(s));

  static Future<DwPostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DwPostsRecord.fromSnapshot(s));

  static DwPostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DwPostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DwPostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DwPostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DwPostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DwPostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDwPostsRecordData({
  DateTime? createdAt,
  DateTime? modifiedAt,
  DocumentReference? userRef,
  String? postType,
  String? postPublishStatus,
  String? postTitle,
  String? postDescription,
  String? postExcerpt,
  int? postNumComments,
  int? postNumVotes,
  String? postMedia,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'user_ref': userRef,
      'post_type': postType,
      'post_publish_status': postPublishStatus,
      'post_title': postTitle,
      'post_description': postDescription,
      'post_excerpt': postExcerpt,
      'post_num_comments': postNumComments,
      'post_num_votes': postNumVotes,
      'post_media': postMedia,
    }.withoutNulls,
  );

  return firestoreData;
}

class DwPostsRecordDocumentEquality implements Equality<DwPostsRecord> {
  const DwPostsRecordDocumentEquality();

  @override
  bool equals(DwPostsRecord? e1, DwPostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.userRef == e2?.userRef &&
        e1?.postType == e2?.postType &&
        e1?.postPublishStatus == e2?.postPublishStatus &&
        listEquality.equals(e1?.postCategories, e2?.postCategories) &&
        e1?.postTitle == e2?.postTitle &&
        e1?.postDescription == e2?.postDescription &&
        e1?.postExcerpt == e2?.postExcerpt &&
        listEquality.equals(e1?.postLikes, e2?.postLikes) &&
        e1?.postNumComments == e2?.postNumComments &&
        e1?.postNumVotes == e2?.postNumVotes &&
        e1?.postMedia == e2?.postMedia;
  }

  @override
  int hash(DwPostsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.modifiedAt,
        e?.userRef,
        e?.postType,
        e?.postPublishStatus,
        e?.postCategories,
        e?.postTitle,
        e?.postDescription,
        e?.postExcerpt,
        e?.postLikes,
        e?.postNumComments,
        e?.postNumVotes,
        e?.postMedia
      ]);

  @override
  bool isValidKey(Object? o) => o is DwPostsRecord;
}
