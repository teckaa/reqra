import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DwAppAdsRecord extends FirestoreRecord {
  DwAppAdsRecord._(
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

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  bool hasUuid() => _uuid != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "ads_name" field.
  String? _adsName;
  String get adsName => _adsName ?? '';
  bool hasAdsName() => _adsName != null;

  // "ads_position" field.
  String? _adsPosition;
  String get adsPosition => _adsPosition ?? '';
  bool hasAdsPosition() => _adsPosition != null;

  // "ads_schedule_date" field.
  DateTime? _adsScheduleDate;
  DateTime? get adsScheduleDate => _adsScheduleDate;
  bool hasAdsScheduleDate() => _adsScheduleDate != null;

  // "ads_expiration_date" field.
  DateTime? _adsExpirationDate;
  DateTime? get adsExpirationDate => _adsExpirationDate;
  bool hasAdsExpirationDate() => _adsExpirationDate != null;

  // "ads_banner" field.
  List<AdsFieldsStruct>? _adsBanner;
  List<AdsFieldsStruct> get adsBanner => _adsBanner ?? const [];
  bool hasAdsBanner() => _adsBanner != null;

  // "ads_status" field.
  bool? _adsStatus;
  bool get adsStatus => _adsStatus ?? false;
  bool hasAdsStatus() => _adsStatus != null;

  // "ads_type" field.
  String? _adsType;
  String get adsType => _adsType ?? '';
  bool hasAdsType() => _adsType != null;

  // "ads_autoplay_status" field.
  bool? _adsAutoplayStatus;
  bool get adsAutoplayStatus => _adsAutoplayStatus ?? false;
  bool hasAdsAutoplayStatus() => _adsAutoplayStatus != null;

  // "ads_animation_delay" field.
  int? _adsAnimationDelay;
  int get adsAnimationDelay => _adsAnimationDelay ?? 0;
  bool hasAdsAnimationDelay() => _adsAnimationDelay != null;

  // "ads_is_closable" field.
  bool? _adsIsClosable;
  bool get adsIsClosable => _adsIsClosable ?? false;
  bool hasAdsIsClosable() => _adsIsClosable != null;

  // "ads_page" field.
  List<String>? _adsPage;
  List<String> get adsPage => _adsPage ?? const [];
  bool hasAdsPage() => _adsPage != null;

  // "ads_responsive" field.
  List<String>? _adsResponsive;
  List<String> get adsResponsive => _adsResponsive ?? const [];
  bool hasAdsResponsive() => _adsResponsive != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _uuid = snapshotData['uuid'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _adsName = snapshotData['ads_name'] as String?;
    _adsPosition = snapshotData['ads_position'] as String?;
    _adsScheduleDate = snapshotData['ads_schedule_date'] as DateTime?;
    _adsExpirationDate = snapshotData['ads_expiration_date'] as DateTime?;
    _adsBanner = getStructList(
      snapshotData['ads_banner'],
      AdsFieldsStruct.fromMap,
    );
    _adsStatus = snapshotData['ads_status'] as bool?;
    _adsType = snapshotData['ads_type'] as String?;
    _adsAutoplayStatus = snapshotData['ads_autoplay_status'] as bool?;
    _adsAnimationDelay = castToType<int>(snapshotData['ads_animation_delay']);
    _adsIsClosable = snapshotData['ads_is_closable'] as bool?;
    _adsPage = getDataList(snapshotData['ads_page']);
    _adsResponsive = getDataList(snapshotData['ads_responsive']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dw_app_ads');

  static Stream<DwAppAdsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DwAppAdsRecord.fromSnapshot(s));

  static Future<DwAppAdsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DwAppAdsRecord.fromSnapshot(s));

  static DwAppAdsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DwAppAdsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DwAppAdsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DwAppAdsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DwAppAdsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DwAppAdsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDwAppAdsRecordData({
  DateTime? createdAt,
  DateTime? modifiedAt,
  String? uuid,
  DocumentReference? userRef,
  String? adsName,
  String? adsPosition,
  DateTime? adsScheduleDate,
  DateTime? adsExpirationDate,
  bool? adsStatus,
  String? adsType,
  bool? adsAutoplayStatus,
  int? adsAnimationDelay,
  bool? adsIsClosable,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'uuid': uuid,
      'user_ref': userRef,
      'ads_name': adsName,
      'ads_position': adsPosition,
      'ads_schedule_date': adsScheduleDate,
      'ads_expiration_date': adsExpirationDate,
      'ads_status': adsStatus,
      'ads_type': adsType,
      'ads_autoplay_status': adsAutoplayStatus,
      'ads_animation_delay': adsAnimationDelay,
      'ads_is_closable': adsIsClosable,
    }.withoutNulls,
  );

  return firestoreData;
}

class DwAppAdsRecordDocumentEquality implements Equality<DwAppAdsRecord> {
  const DwAppAdsRecordDocumentEquality();

  @override
  bool equals(DwAppAdsRecord? e1, DwAppAdsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.uuid == e2?.uuid &&
        e1?.userRef == e2?.userRef &&
        e1?.adsName == e2?.adsName &&
        e1?.adsPosition == e2?.adsPosition &&
        e1?.adsScheduleDate == e2?.adsScheduleDate &&
        e1?.adsExpirationDate == e2?.adsExpirationDate &&
        listEquality.equals(e1?.adsBanner, e2?.adsBanner) &&
        e1?.adsStatus == e2?.adsStatus &&
        e1?.adsType == e2?.adsType &&
        e1?.adsAutoplayStatus == e2?.adsAutoplayStatus &&
        e1?.adsAnimationDelay == e2?.adsAnimationDelay &&
        e1?.adsIsClosable == e2?.adsIsClosable &&
        listEquality.equals(e1?.adsPage, e2?.adsPage) &&
        listEquality.equals(e1?.adsResponsive, e2?.adsResponsive);
  }

  @override
  int hash(DwAppAdsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.modifiedAt,
        e?.uuid,
        e?.userRef,
        e?.adsName,
        e?.adsPosition,
        e?.adsScheduleDate,
        e?.adsExpirationDate,
        e?.adsBanner,
        e?.adsStatus,
        e?.adsType,
        e?.adsAutoplayStatus,
        e?.adsAnimationDelay,
        e?.adsIsClosable,
        e?.adsPage,
        e?.adsResponsive
      ]);

  @override
  bool isValidKey(Object? o) => o is DwAppAdsRecord;
}
