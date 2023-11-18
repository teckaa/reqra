// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdsFieldsStruct extends FFFirebaseStruct {
  AdsFieldsStruct({
    String? adsImage,
    String? adsLink,
    String? adsExternalLocation,
    String? adsInternalLocation,
    String? adsText,
    Color? adsTextColor,
    Color? adsBgColor,
    int? adsTextSize,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _adsImage = adsImage,
        _adsLink = adsLink,
        _adsExternalLocation = adsExternalLocation,
        _adsInternalLocation = adsInternalLocation,
        _adsText = adsText,
        _adsTextColor = adsTextColor,
        _adsBgColor = adsBgColor,
        _adsTextSize = adsTextSize,
        super(firestoreUtilData);

  // "ads_image" field.
  String? _adsImage;
  String get adsImage => _adsImage ?? '';
  set adsImage(String? val) => _adsImage = val;
  bool hasAdsImage() => _adsImage != null;

  // "ads_link" field.
  String? _adsLink;
  String get adsLink => _adsLink ?? '';
  set adsLink(String? val) => _adsLink = val;
  bool hasAdsLink() => _adsLink != null;

  // "ads_external_location" field.
  String? _adsExternalLocation;
  String get adsExternalLocation => _adsExternalLocation ?? '';
  set adsExternalLocation(String? val) => _adsExternalLocation = val;
  bool hasAdsExternalLocation() => _adsExternalLocation != null;

  // "ads_internal_location" field.
  String? _adsInternalLocation;
  String get adsInternalLocation => _adsInternalLocation ?? '';
  set adsInternalLocation(String? val) => _adsInternalLocation = val;
  bool hasAdsInternalLocation() => _adsInternalLocation != null;

  // "ads_text" field.
  String? _adsText;
  String get adsText => _adsText ?? '';
  set adsText(String? val) => _adsText = val;
  bool hasAdsText() => _adsText != null;

  // "ads_text_color" field.
  Color? _adsTextColor;
  Color? get adsTextColor => _adsTextColor;
  set adsTextColor(Color? val) => _adsTextColor = val;
  bool hasAdsTextColor() => _adsTextColor != null;

  // "ads_bg_color" field.
  Color? _adsBgColor;
  Color? get adsBgColor => _adsBgColor;
  set adsBgColor(Color? val) => _adsBgColor = val;
  bool hasAdsBgColor() => _adsBgColor != null;

  // "ads_text_size" field.
  int? _adsTextSize;
  int get adsTextSize => _adsTextSize ?? 0;
  set adsTextSize(int? val) => _adsTextSize = val;
  void incrementAdsTextSize(int amount) => _adsTextSize = adsTextSize + amount;
  bool hasAdsTextSize() => _adsTextSize != null;

  static AdsFieldsStruct fromMap(Map<String, dynamic> data) => AdsFieldsStruct(
        adsImage: data['ads_image'] as String?,
        adsLink: data['ads_link'] as String?,
        adsExternalLocation: data['ads_external_location'] as String?,
        adsInternalLocation: data['ads_internal_location'] as String?,
        adsText: data['ads_text'] as String?,
        adsTextColor: getSchemaColor(data['ads_text_color']),
        adsBgColor: getSchemaColor(data['ads_bg_color']),
        adsTextSize: castToType<int>(data['ads_text_size']),
      );

  static AdsFieldsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AdsFieldsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'ads_image': _adsImage,
        'ads_link': _adsLink,
        'ads_external_location': _adsExternalLocation,
        'ads_internal_location': _adsInternalLocation,
        'ads_text': _adsText,
        'ads_text_color': _adsTextColor,
        'ads_bg_color': _adsBgColor,
        'ads_text_size': _adsTextSize,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ads_image': serializeParam(
          _adsImage,
          ParamType.String,
        ),
        'ads_link': serializeParam(
          _adsLink,
          ParamType.String,
        ),
        'ads_external_location': serializeParam(
          _adsExternalLocation,
          ParamType.String,
        ),
        'ads_internal_location': serializeParam(
          _adsInternalLocation,
          ParamType.String,
        ),
        'ads_text': serializeParam(
          _adsText,
          ParamType.String,
        ),
        'ads_text_color': serializeParam(
          _adsTextColor,
          ParamType.Color,
        ),
        'ads_bg_color': serializeParam(
          _adsBgColor,
          ParamType.Color,
        ),
        'ads_text_size': serializeParam(
          _adsTextSize,
          ParamType.int,
        ),
      }.withoutNulls;

  static AdsFieldsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AdsFieldsStruct(
        adsImage: deserializeParam(
          data['ads_image'],
          ParamType.String,
          false,
        ),
        adsLink: deserializeParam(
          data['ads_link'],
          ParamType.String,
          false,
        ),
        adsExternalLocation: deserializeParam(
          data['ads_external_location'],
          ParamType.String,
          false,
        ),
        adsInternalLocation: deserializeParam(
          data['ads_internal_location'],
          ParamType.String,
          false,
        ),
        adsText: deserializeParam(
          data['ads_text'],
          ParamType.String,
          false,
        ),
        adsTextColor: deserializeParam(
          data['ads_text_color'],
          ParamType.Color,
          false,
        ),
        adsBgColor: deserializeParam(
          data['ads_bg_color'],
          ParamType.Color,
          false,
        ),
        adsTextSize: deserializeParam(
          data['ads_text_size'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AdsFieldsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AdsFieldsStruct &&
        adsImage == other.adsImage &&
        adsLink == other.adsLink &&
        adsExternalLocation == other.adsExternalLocation &&
        adsInternalLocation == other.adsInternalLocation &&
        adsText == other.adsText &&
        adsTextColor == other.adsTextColor &&
        adsBgColor == other.adsBgColor &&
        adsTextSize == other.adsTextSize;
  }

  @override
  int get hashCode => const ListEquality().hash([
        adsImage,
        adsLink,
        adsExternalLocation,
        adsInternalLocation,
        adsText,
        adsTextColor,
        adsBgColor,
        adsTextSize
      ]);
}

AdsFieldsStruct createAdsFieldsStruct({
  String? adsImage,
  String? adsLink,
  String? adsExternalLocation,
  String? adsInternalLocation,
  String? adsText,
  Color? adsTextColor,
  Color? adsBgColor,
  int? adsTextSize,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AdsFieldsStruct(
      adsImage: adsImage,
      adsLink: adsLink,
      adsExternalLocation: adsExternalLocation,
      adsInternalLocation: adsInternalLocation,
      adsText: adsText,
      adsTextColor: adsTextColor,
      adsBgColor: adsBgColor,
      adsTextSize: adsTextSize,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AdsFieldsStruct? updateAdsFieldsStruct(
  AdsFieldsStruct? adsFields, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    adsFields
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAdsFieldsStructData(
  Map<String, dynamic> firestoreData,
  AdsFieldsStruct? adsFields,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (adsFields == null) {
    return;
  }
  if (adsFields.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && adsFields.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final adsFieldsData = getAdsFieldsFirestoreData(adsFields, forFieldValue);
  final nestedData = adsFieldsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = adsFields.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAdsFieldsFirestoreData(
  AdsFieldsStruct? adsFields, [
  bool forFieldValue = false,
]) {
  if (adsFields == null) {
    return {};
  }
  final firestoreData = mapToFirestore(adsFields.toMap());

  // Add any Firestore field values
  adsFields.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAdsFieldsListFirestoreData(
  List<AdsFieldsStruct>? adsFieldss,
) =>
    adsFieldss?.map((e) => getAdsFieldsFirestoreData(e, true)).toList() ?? [];
