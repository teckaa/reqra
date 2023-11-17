import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DwMediaRecord extends FirestoreRecord {
  DwMediaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  bool hasUuid() => _uuid != null;

  // "photo_title" field.
  String? _photoTitle;
  String get photoTitle => _photoTitle ?? '';
  bool hasPhotoTitle() => _photoTitle != null;

  // "photo_path" field.
  String? _photoPath;
  String get photoPath => _photoPath ?? '';
  bool hasPhotoPath() => _photoPath != null;

  // "photo_blur_hash" field.
  String? _photoBlurHash;
  String get photoBlurHash => _photoBlurHash ?? '';
  bool hasPhotoBlurHash() => _photoBlurHash != null;

  // "photo_source" field.
  String? _photoSource;
  String get photoSource => _photoSource ?? '';
  bool hasPhotoSource() => _photoSource != null;

  // "photo_credit" field.
  String? _photoCredit;
  String get photoCredit => _photoCredit ?? '';
  bool hasPhotoCredit() => _photoCredit != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _uuid = snapshotData['uuid'] as String?;
    _photoTitle = snapshotData['photo_title'] as String?;
    _photoPath = snapshotData['photo_path'] as String?;
    _photoBlurHash = snapshotData['photo_blur_hash'] as String?;
    _photoSource = snapshotData['photo_source'] as String?;
    _photoCredit = snapshotData['photo_credit'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dw_media');

  static Stream<DwMediaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DwMediaRecord.fromSnapshot(s));

  static Future<DwMediaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DwMediaRecord.fromSnapshot(s));

  static DwMediaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DwMediaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DwMediaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DwMediaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DwMediaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DwMediaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDwMediaRecordData({
  DateTime? createdTime,
  DocumentReference? userRef,
  String? uuid,
  String? photoTitle,
  String? photoPath,
  String? photoBlurHash,
  String? photoSource,
  String? photoCredit,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'user_ref': userRef,
      'uuid': uuid,
      'photo_title': photoTitle,
      'photo_path': photoPath,
      'photo_blur_hash': photoBlurHash,
      'photo_source': photoSource,
      'photo_credit': photoCredit,
    }.withoutNulls,
  );

  return firestoreData;
}

class DwMediaRecordDocumentEquality implements Equality<DwMediaRecord> {
  const DwMediaRecordDocumentEquality();

  @override
  bool equals(DwMediaRecord? e1, DwMediaRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.userRef == e2?.userRef &&
        e1?.uuid == e2?.uuid &&
        e1?.photoTitle == e2?.photoTitle &&
        e1?.photoPath == e2?.photoPath &&
        e1?.photoBlurHash == e2?.photoBlurHash &&
        e1?.photoSource == e2?.photoSource &&
        e1?.photoCredit == e2?.photoCredit;
  }

  @override
  int hash(DwMediaRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.userRef,
        e?.uuid,
        e?.photoTitle,
        e?.photoPath,
        e?.photoBlurHash,
        e?.photoSource,
        e?.photoCredit
      ]);

  @override
  bool isValidKey(Object? o) => o is DwMediaRecord;
}
