import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DwPostsCategoriesRecord extends FirestoreRecord {
  DwPostsCategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "cat_name" field.
  String? _catName;
  String get catName => _catName ?? '';
  bool hasCatName() => _catName != null;

  // "cat_slug" field.
  String? _catSlug;
  String get catSlug => _catSlug ?? '';
  bool hasCatSlug() => _catSlug != null;

  // "user_ref" field.
  String? _userRef;
  String get userRef => _userRef ?? '';
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _catName = snapshotData['cat_name'] as String?;
    _catSlug = snapshotData['cat_slug'] as String?;
    _userRef = snapshotData['user_ref'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dw_posts_categories');

  static Stream<DwPostsCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DwPostsCategoriesRecord.fromSnapshot(s));

  static Future<DwPostsCategoriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DwPostsCategoriesRecord.fromSnapshot(s));

  static DwPostsCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DwPostsCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DwPostsCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DwPostsCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DwPostsCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DwPostsCategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDwPostsCategoriesRecordData({
  DateTime? createdAt,
  String? catName,
  String? catSlug,
  String? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'cat_name': catName,
      'cat_slug': catSlug,
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class DwPostsCategoriesRecordDocumentEquality
    implements Equality<DwPostsCategoriesRecord> {
  const DwPostsCategoriesRecordDocumentEquality();

  @override
  bool equals(DwPostsCategoriesRecord? e1, DwPostsCategoriesRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.catName == e2?.catName &&
        e1?.catSlug == e2?.catSlug &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(DwPostsCategoriesRecord? e) => const ListEquality()
      .hash([e?.createdAt, e?.catName, e?.catSlug, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is DwPostsCategoriesRecord;
}
