import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DwAppStoreLinksRecord extends FirestoreRecord {
  DwAppStoreLinksRecord._(
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

  // "app_store_name" field.
  String? _appStoreName;
  String get appStoreName => _appStoreName ?? '';
  bool hasAppStoreName() => _appStoreName != null;

  // "app_store_desc" field.
  String? _appStoreDesc;
  String get appStoreDesc => _appStoreDesc ?? '';
  bool hasAppStoreDesc() => _appStoreDesc != null;

  // "app_store_image" field.
  String? _appStoreImage;
  String get appStoreImage => _appStoreImage ?? '';
  bool hasAppStoreImage() => _appStoreImage != null;

  // "app_store_link" field.
  String? _appStoreLink;
  String get appStoreLink => _appStoreLink ?? '';
  bool hasAppStoreLink() => _appStoreLink != null;

  // "app_store_status" field.
  bool? _appStoreStatus;
  bool get appStoreStatus => _appStoreStatus ?? false;
  bool hasAppStoreStatus() => _appStoreStatus != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _uuid = snapshotData['uuid'] as String?;
    _appStoreName = snapshotData['app_store_name'] as String?;
    _appStoreDesc = snapshotData['app_store_desc'] as String?;
    _appStoreImage = snapshotData['app_store_image'] as String?;
    _appStoreLink = snapshotData['app_store_link'] as String?;
    _appStoreStatus = snapshotData['app_store_status'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dw_app_store_links');

  static Stream<DwAppStoreLinksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DwAppStoreLinksRecord.fromSnapshot(s));

  static Future<DwAppStoreLinksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DwAppStoreLinksRecord.fromSnapshot(s));

  static DwAppStoreLinksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DwAppStoreLinksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DwAppStoreLinksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DwAppStoreLinksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DwAppStoreLinksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DwAppStoreLinksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDwAppStoreLinksRecordData({
  DateTime? createdAt,
  String? uuid,
  String? appStoreName,
  String? appStoreDesc,
  String? appStoreImage,
  String? appStoreLink,
  bool? appStoreStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'uuid': uuid,
      'app_store_name': appStoreName,
      'app_store_desc': appStoreDesc,
      'app_store_image': appStoreImage,
      'app_store_link': appStoreLink,
      'app_store_status': appStoreStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class DwAppStoreLinksRecordDocumentEquality
    implements Equality<DwAppStoreLinksRecord> {
  const DwAppStoreLinksRecordDocumentEquality();

  @override
  bool equals(DwAppStoreLinksRecord? e1, DwAppStoreLinksRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.uuid == e2?.uuid &&
        e1?.appStoreName == e2?.appStoreName &&
        e1?.appStoreDesc == e2?.appStoreDesc &&
        e1?.appStoreImage == e2?.appStoreImage &&
        e1?.appStoreLink == e2?.appStoreLink &&
        e1?.appStoreStatus == e2?.appStoreStatus;
  }

  @override
  int hash(DwAppStoreLinksRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.uuid,
        e?.appStoreName,
        e?.appStoreDesc,
        e?.appStoreImage,
        e?.appStoreLink,
        e?.appStoreStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is DwAppStoreLinksRecord;
}
