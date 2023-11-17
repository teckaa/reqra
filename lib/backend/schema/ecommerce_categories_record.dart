import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EcommerceCategoriesRecord extends FirestoreRecord {
  EcommerceCategoriesRecord._(
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

  // "cat_photo" field.
  String? _catPhoto;
  String get catPhoto => _catPhoto ?? '';
  bool hasCatPhoto() => _catPhoto != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _catName = snapshotData['cat_name'] as String?;
    _catSlug = snapshotData['cat_slug'] as String?;
    _catPhoto = snapshotData['cat_photo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ecommerce_categories');

  static Stream<EcommerceCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EcommerceCategoriesRecord.fromSnapshot(s));

  static Future<EcommerceCategoriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EcommerceCategoriesRecord.fromSnapshot(s));

  static EcommerceCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EcommerceCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EcommerceCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EcommerceCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EcommerceCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EcommerceCategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEcommerceCategoriesRecordData({
  DateTime? createdAt,
  String? catName,
  String? catSlug,
  String? catPhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'cat_name': catName,
      'cat_slug': catSlug,
      'cat_photo': catPhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class EcommerceCategoriesRecordDocumentEquality
    implements Equality<EcommerceCategoriesRecord> {
  const EcommerceCategoriesRecordDocumentEquality();

  @override
  bool equals(EcommerceCategoriesRecord? e1, EcommerceCategoriesRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.catName == e2?.catName &&
        e1?.catSlug == e2?.catSlug &&
        e1?.catPhoto == e2?.catPhoto;
  }

  @override
  int hash(EcommerceCategoriesRecord? e) => const ListEquality()
      .hash([e?.createdAt, e?.catName, e?.catSlug, e?.catPhoto]);

  @override
  bool isValidKey(Object? o) => o is EcommerceCategoriesRecord;
}
