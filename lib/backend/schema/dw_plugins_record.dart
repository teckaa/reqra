import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DwPluginsRecord extends FirestoreRecord {
  DwPluginsRecord._(
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

  // "plugin_name" field.
  String? _pluginName;
  String get pluginName => _pluginName ?? '';
  bool hasPluginName() => _pluginName != null;

  // "plugin_desc" field.
  String? _pluginDesc;
  String get pluginDesc => _pluginDesc ?? '';
  bool hasPluginDesc() => _pluginDesc != null;

  // "plugin_photo" field.
  String? _pluginPhoto;
  String get pluginPhoto => _pluginPhoto ?? '';
  bool hasPluginPhoto() => _pluginPhoto != null;

  // "plugin_status" field.
  bool? _pluginStatus;
  bool get pluginStatus => _pluginStatus ?? false;
  bool hasPluginStatus() => _pluginStatus != null;

  // "plugin_security_transaction_status" field.
  bool? _pluginSecurityTransactionStatus;
  bool get pluginSecurityTransactionStatus =>
      _pluginSecurityTransactionStatus ?? false;
  bool hasPluginSecurityTransactionStatus() =>
      _pluginSecurityTransactionStatus != null;

  // "plugin_security_transaction_message" field.
  String? _pluginSecurityTransactionMessage;
  String get pluginSecurityTransactionMessage =>
      _pluginSecurityTransactionMessage ?? '';
  bool hasPluginSecurityTransactionMessage() =>
      _pluginSecurityTransactionMessage != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _pluginName = snapshotData['plugin_name'] as String?;
    _pluginDesc = snapshotData['plugin_desc'] as String?;
    _pluginPhoto = snapshotData['plugin_photo'] as String?;
    _pluginStatus = snapshotData['plugin_status'] as bool?;
    _pluginSecurityTransactionStatus =
        snapshotData['plugin_security_transaction_status'] as bool?;
    _pluginSecurityTransactionMessage =
        snapshotData['plugin_security_transaction_message'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dw_plugins');

  static Stream<DwPluginsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DwPluginsRecord.fromSnapshot(s));

  static Future<DwPluginsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DwPluginsRecord.fromSnapshot(s));

  static DwPluginsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DwPluginsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DwPluginsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DwPluginsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DwPluginsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DwPluginsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDwPluginsRecordData({
  DateTime? createdAt,
  DocumentReference? userRef,
  String? pluginName,
  String? pluginDesc,
  String? pluginPhoto,
  bool? pluginStatus,
  bool? pluginSecurityTransactionStatus,
  String? pluginSecurityTransactionMessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'user_ref': userRef,
      'plugin_name': pluginName,
      'plugin_desc': pluginDesc,
      'plugin_photo': pluginPhoto,
      'plugin_status': pluginStatus,
      'plugin_security_transaction_status': pluginSecurityTransactionStatus,
      'plugin_security_transaction_message': pluginSecurityTransactionMessage,
    }.withoutNulls,
  );

  return firestoreData;
}

class DwPluginsRecordDocumentEquality implements Equality<DwPluginsRecord> {
  const DwPluginsRecordDocumentEquality();

  @override
  bool equals(DwPluginsRecord? e1, DwPluginsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.pluginName == e2?.pluginName &&
        e1?.pluginDesc == e2?.pluginDesc &&
        e1?.pluginPhoto == e2?.pluginPhoto &&
        e1?.pluginStatus == e2?.pluginStatus &&
        e1?.pluginSecurityTransactionStatus ==
            e2?.pluginSecurityTransactionStatus &&
        e1?.pluginSecurityTransactionMessage ==
            e2?.pluginSecurityTransactionMessage;
  }

  @override
  int hash(DwPluginsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.userRef,
        e?.pluginName,
        e?.pluginDesc,
        e?.pluginPhoto,
        e?.pluginStatus,
        e?.pluginSecurityTransactionStatus,
        e?.pluginSecurityTransactionMessage
      ]);

  @override
  bool isValidKey(Object? o) => o is DwPluginsRecord;
}
