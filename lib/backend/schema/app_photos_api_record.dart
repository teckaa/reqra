import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppPhotosApiRecord extends FirestoreRecord {
  AppPhotosApiRecord._(
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

  // "pexels_api" field.
  String? _pexelsApi;
  String get pexelsApi => _pexelsApi ?? '';
  bool hasPexelsApi() => _pexelsApi != null;

  // "pexels_status" field.
  bool? _pexelsStatus;
  bool get pexelsStatus => _pexelsStatus ?? false;
  bool hasPexelsStatus() => _pexelsStatus != null;

  // "pixabay_api" field.
  String? _pixabayApi;
  String get pixabayApi => _pixabayApi ?? '';
  bool hasPixabayApi() => _pixabayApi != null;

  // "pixabay_status" field.
  bool? _pixabayStatus;
  bool get pixabayStatus => _pixabayStatus ?? false;
  bool hasPixabayStatus() => _pixabayStatus != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _uuid = snapshotData['uuid'] as String?;
    _pexelsApi = snapshotData['pexels_api'] as String?;
    _pexelsStatus = snapshotData['pexels_status'] as bool?;
    _pixabayApi = snapshotData['pixabay_api'] as String?;
    _pixabayStatus = snapshotData['pixabay_status'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('app_photos_api');

  static Stream<AppPhotosApiRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppPhotosApiRecord.fromSnapshot(s));

  static Future<AppPhotosApiRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppPhotosApiRecord.fromSnapshot(s));

  static AppPhotosApiRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppPhotosApiRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppPhotosApiRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppPhotosApiRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppPhotosApiRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppPhotosApiRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppPhotosApiRecordData({
  DateTime? createdAt,
  String? uuid,
  String? pexelsApi,
  bool? pexelsStatus,
  String? pixabayApi,
  bool? pixabayStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'uuid': uuid,
      'pexels_api': pexelsApi,
      'pexels_status': pexelsStatus,
      'pixabay_api': pixabayApi,
      'pixabay_status': pixabayStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppPhotosApiRecordDocumentEquality
    implements Equality<AppPhotosApiRecord> {
  const AppPhotosApiRecordDocumentEquality();

  @override
  bool equals(AppPhotosApiRecord? e1, AppPhotosApiRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.uuid == e2?.uuid &&
        e1?.pexelsApi == e2?.pexelsApi &&
        e1?.pexelsStatus == e2?.pexelsStatus &&
        e1?.pixabayApi == e2?.pixabayApi &&
        e1?.pixabayStatus == e2?.pixabayStatus;
  }

  @override
  int hash(AppPhotosApiRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.uuid,
        e?.pexelsApi,
        e?.pexelsStatus,
        e?.pixabayApi,
        e?.pixabayStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is AppPhotosApiRecord;
}
