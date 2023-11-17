import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DwAppLiveChatApiRecord extends FirestoreRecord {
  DwAppLiveChatApiRecord._(
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

  // "live_chat_name" field.
  String? _liveChatName;
  String get liveChatName => _liveChatName ?? '';
  bool hasLiveChatName() => _liveChatName != null;

  // "live_chat_api" field.
  String? _liveChatApi;
  String get liveChatApi => _liveChatApi ?? '';
  bool hasLiveChatApi() => _liveChatApi != null;

  // "frontend_status" field.
  bool? _frontendStatus;
  bool get frontendStatus => _frontendStatus ?? false;
  bool hasFrontendStatus() => _frontendStatus != null;

  // "web_app_status" field.
  bool? _webAppStatus;
  bool get webAppStatus => _webAppStatus ?? false;
  bool hasWebAppStatus() => _webAppStatus != null;

  // "mobile_app_status" field.
  bool? _mobileAppStatus;
  bool get mobileAppStatus => _mobileAppStatus ?? false;
  bool hasMobileAppStatus() => _mobileAppStatus != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _uuid = snapshotData['uuid'] as String?;
    _liveChatName = snapshotData['live_chat_name'] as String?;
    _liveChatApi = snapshotData['live_chat_api'] as String?;
    _frontendStatus = snapshotData['frontend_status'] as bool?;
    _webAppStatus = snapshotData['web_app_status'] as bool?;
    _mobileAppStatus = snapshotData['mobile_app_status'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dw_app_live_chat_api');

  static Stream<DwAppLiveChatApiRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DwAppLiveChatApiRecord.fromSnapshot(s));

  static Future<DwAppLiveChatApiRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DwAppLiveChatApiRecord.fromSnapshot(s));

  static DwAppLiveChatApiRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DwAppLiveChatApiRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DwAppLiveChatApiRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DwAppLiveChatApiRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DwAppLiveChatApiRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DwAppLiveChatApiRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDwAppLiveChatApiRecordData({
  DateTime? createdAt,
  String? uuid,
  String? liveChatName,
  String? liveChatApi,
  bool? frontendStatus,
  bool? webAppStatus,
  bool? mobileAppStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'uuid': uuid,
      'live_chat_name': liveChatName,
      'live_chat_api': liveChatApi,
      'frontend_status': frontendStatus,
      'web_app_status': webAppStatus,
      'mobile_app_status': mobileAppStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class DwAppLiveChatApiRecordDocumentEquality
    implements Equality<DwAppLiveChatApiRecord> {
  const DwAppLiveChatApiRecordDocumentEquality();

  @override
  bool equals(DwAppLiveChatApiRecord? e1, DwAppLiveChatApiRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.uuid == e2?.uuid &&
        e1?.liveChatName == e2?.liveChatName &&
        e1?.liveChatApi == e2?.liveChatApi &&
        e1?.frontendStatus == e2?.frontendStatus &&
        e1?.webAppStatus == e2?.webAppStatus &&
        e1?.mobileAppStatus == e2?.mobileAppStatus;
  }

  @override
  int hash(DwAppLiveChatApiRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.uuid,
        e?.liveChatName,
        e?.liveChatApi,
        e?.frontendStatus,
        e?.webAppStatus,
        e?.mobileAppStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is DwAppLiveChatApiRecord;
}
