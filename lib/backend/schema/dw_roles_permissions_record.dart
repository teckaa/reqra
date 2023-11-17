import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DwRolesPermissionsRecord extends FirestoreRecord {
  DwRolesPermissionsRecord._(
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

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  bool hasUuid() => _uuid != null;

  // "permission_name" field.
  String? _permissionName;
  String get permissionName => _permissionName ?? '';
  bool hasPermissionName() => _permissionName != null;

  // "permission_desc" field.
  String? _permissionDesc;
  String get permissionDesc => _permissionDesc ?? '';
  bool hasPermissionDesc() => _permissionDesc != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _uuid = snapshotData['uuid'] as String?;
    _permissionName = snapshotData['permission_name'] as String?;
    _permissionDesc = snapshotData['permission_desc'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dw_roles_permissions');

  static Stream<DwRolesPermissionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DwRolesPermissionsRecord.fromSnapshot(s));

  static Future<DwRolesPermissionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DwRolesPermissionsRecord.fromSnapshot(s));

  static DwRolesPermissionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DwRolesPermissionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DwRolesPermissionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DwRolesPermissionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DwRolesPermissionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DwRolesPermissionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDwRolesPermissionsRecordData({
  DateTime? createdAt,
  DocumentReference? userRef,
  String? uuid,
  String? permissionName,
  String? permissionDesc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'user_ref': userRef,
      'uuid': uuid,
      'permission_name': permissionName,
      'permission_desc': permissionDesc,
    }.withoutNulls,
  );

  return firestoreData;
}

class DwRolesPermissionsRecordDocumentEquality
    implements Equality<DwRolesPermissionsRecord> {
  const DwRolesPermissionsRecordDocumentEquality();

  @override
  bool equals(DwRolesPermissionsRecord? e1, DwRolesPermissionsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.uuid == e2?.uuid &&
        e1?.permissionName == e2?.permissionName &&
        e1?.permissionDesc == e2?.permissionDesc;
  }

  @override
  int hash(DwRolesPermissionsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.userRef,
        e?.uuid,
        e?.permissionName,
        e?.permissionDesc
      ]);

  @override
  bool isValidKey(Object? o) => o is DwRolesPermissionsRecord;
}
