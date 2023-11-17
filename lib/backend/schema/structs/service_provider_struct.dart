// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceProviderStruct extends FFFirebaseStruct {
  ServiceProviderStruct({
    bool? providerStatus,
    String? providerServiceType,
    String? providerName,
    String? providerLogo,
    String? providerDefaultCommission,
    String? providerBillerCode,
    String? providerBillerName,
    String? providerItemCode,
    String? providerShortName,
    String? providerProductName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _providerStatus = providerStatus,
        _providerServiceType = providerServiceType,
        _providerName = providerName,
        _providerLogo = providerLogo,
        _providerDefaultCommission = providerDefaultCommission,
        _providerBillerCode = providerBillerCode,
        _providerBillerName = providerBillerName,
        _providerItemCode = providerItemCode,
        _providerShortName = providerShortName,
        _providerProductName = providerProductName,
        super(firestoreUtilData);

  // "provider_status" field.
  bool? _providerStatus;
  bool get providerStatus => _providerStatus ?? false;
  set providerStatus(bool? val) => _providerStatus = val;
  bool hasProviderStatus() => _providerStatus != null;

  // "provider_service_type" field.
  String? _providerServiceType;
  String get providerServiceType => _providerServiceType ?? '';
  set providerServiceType(String? val) => _providerServiceType = val;
  bool hasProviderServiceType() => _providerServiceType != null;

  // "provider_name" field.
  String? _providerName;
  String get providerName => _providerName ?? '';
  set providerName(String? val) => _providerName = val;
  bool hasProviderName() => _providerName != null;

  // "provider_logo" field.
  String? _providerLogo;
  String get providerLogo => _providerLogo ?? '';
  set providerLogo(String? val) => _providerLogo = val;
  bool hasProviderLogo() => _providerLogo != null;

  // "provider_default_commission" field.
  String? _providerDefaultCommission;
  String get providerDefaultCommission => _providerDefaultCommission ?? '';
  set providerDefaultCommission(String? val) =>
      _providerDefaultCommission = val;
  bool hasProviderDefaultCommission() => _providerDefaultCommission != null;

  // "provider_biller_code" field.
  String? _providerBillerCode;
  String get providerBillerCode => _providerBillerCode ?? '';
  set providerBillerCode(String? val) => _providerBillerCode = val;
  bool hasProviderBillerCode() => _providerBillerCode != null;

  // "provider_biller_name" field.
  String? _providerBillerName;
  String get providerBillerName => _providerBillerName ?? '';
  set providerBillerName(String? val) => _providerBillerName = val;
  bool hasProviderBillerName() => _providerBillerName != null;

  // "provider_item_code" field.
  String? _providerItemCode;
  String get providerItemCode => _providerItemCode ?? '';
  set providerItemCode(String? val) => _providerItemCode = val;
  bool hasProviderItemCode() => _providerItemCode != null;

  // "provider_short_name" field.
  String? _providerShortName;
  String get providerShortName => _providerShortName ?? '';
  set providerShortName(String? val) => _providerShortName = val;
  bool hasProviderShortName() => _providerShortName != null;

  // "provider_product_name" field.
  String? _providerProductName;
  String get providerProductName => _providerProductName ?? '';
  set providerProductName(String? val) => _providerProductName = val;
  bool hasProviderProductName() => _providerProductName != null;

  static ServiceProviderStruct fromMap(Map<String, dynamic> data) =>
      ServiceProviderStruct(
        providerStatus: data['provider_status'] as bool?,
        providerServiceType: data['provider_service_type'] as String?,
        providerName: data['provider_name'] as String?,
        providerLogo: data['provider_logo'] as String?,
        providerDefaultCommission:
            data['provider_default_commission'] as String?,
        providerBillerCode: data['provider_biller_code'] as String?,
        providerBillerName: data['provider_biller_name'] as String?,
        providerItemCode: data['provider_item_code'] as String?,
        providerShortName: data['provider_short_name'] as String?,
        providerProductName: data['provider_product_name'] as String?,
      );

  static ServiceProviderStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ServiceProviderStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'provider_status': _providerStatus,
        'provider_service_type': _providerServiceType,
        'provider_name': _providerName,
        'provider_logo': _providerLogo,
        'provider_default_commission': _providerDefaultCommission,
        'provider_biller_code': _providerBillerCode,
        'provider_biller_name': _providerBillerName,
        'provider_item_code': _providerItemCode,
        'provider_short_name': _providerShortName,
        'provider_product_name': _providerProductName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'provider_status': serializeParam(
          _providerStatus,
          ParamType.bool,
        ),
        'provider_service_type': serializeParam(
          _providerServiceType,
          ParamType.String,
        ),
        'provider_name': serializeParam(
          _providerName,
          ParamType.String,
        ),
        'provider_logo': serializeParam(
          _providerLogo,
          ParamType.String,
        ),
        'provider_default_commission': serializeParam(
          _providerDefaultCommission,
          ParamType.String,
        ),
        'provider_biller_code': serializeParam(
          _providerBillerCode,
          ParamType.String,
        ),
        'provider_biller_name': serializeParam(
          _providerBillerName,
          ParamType.String,
        ),
        'provider_item_code': serializeParam(
          _providerItemCode,
          ParamType.String,
        ),
        'provider_short_name': serializeParam(
          _providerShortName,
          ParamType.String,
        ),
        'provider_product_name': serializeParam(
          _providerProductName,
          ParamType.String,
        ),
      }.withoutNulls;

  static ServiceProviderStruct fromSerializableMap(Map<String, dynamic> data) =>
      ServiceProviderStruct(
        providerStatus: deserializeParam(
          data['provider_status'],
          ParamType.bool,
          false,
        ),
        providerServiceType: deserializeParam(
          data['provider_service_type'],
          ParamType.String,
          false,
        ),
        providerName: deserializeParam(
          data['provider_name'],
          ParamType.String,
          false,
        ),
        providerLogo: deserializeParam(
          data['provider_logo'],
          ParamType.String,
          false,
        ),
        providerDefaultCommission: deserializeParam(
          data['provider_default_commission'],
          ParamType.String,
          false,
        ),
        providerBillerCode: deserializeParam(
          data['provider_biller_code'],
          ParamType.String,
          false,
        ),
        providerBillerName: deserializeParam(
          data['provider_biller_name'],
          ParamType.String,
          false,
        ),
        providerItemCode: deserializeParam(
          data['provider_item_code'],
          ParamType.String,
          false,
        ),
        providerShortName: deserializeParam(
          data['provider_short_name'],
          ParamType.String,
          false,
        ),
        providerProductName: deserializeParam(
          data['provider_product_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ServiceProviderStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ServiceProviderStruct &&
        providerStatus == other.providerStatus &&
        providerServiceType == other.providerServiceType &&
        providerName == other.providerName &&
        providerLogo == other.providerLogo &&
        providerDefaultCommission == other.providerDefaultCommission &&
        providerBillerCode == other.providerBillerCode &&
        providerBillerName == other.providerBillerName &&
        providerItemCode == other.providerItemCode &&
        providerShortName == other.providerShortName &&
        providerProductName == other.providerProductName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        providerStatus,
        providerServiceType,
        providerName,
        providerLogo,
        providerDefaultCommission,
        providerBillerCode,
        providerBillerName,
        providerItemCode,
        providerShortName,
        providerProductName
      ]);
}

ServiceProviderStruct createServiceProviderStruct({
  bool? providerStatus,
  String? providerServiceType,
  String? providerName,
  String? providerLogo,
  String? providerDefaultCommission,
  String? providerBillerCode,
  String? providerBillerName,
  String? providerItemCode,
  String? providerShortName,
  String? providerProductName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ServiceProviderStruct(
      providerStatus: providerStatus,
      providerServiceType: providerServiceType,
      providerName: providerName,
      providerLogo: providerLogo,
      providerDefaultCommission: providerDefaultCommission,
      providerBillerCode: providerBillerCode,
      providerBillerName: providerBillerName,
      providerItemCode: providerItemCode,
      providerShortName: providerShortName,
      providerProductName: providerProductName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ServiceProviderStruct? updateServiceProviderStruct(
  ServiceProviderStruct? serviceProvider, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    serviceProvider
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addServiceProviderStructData(
  Map<String, dynamic> firestoreData,
  ServiceProviderStruct? serviceProvider,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (serviceProvider == null) {
    return;
  }
  if (serviceProvider.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && serviceProvider.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final serviceProviderData =
      getServiceProviderFirestoreData(serviceProvider, forFieldValue);
  final nestedData =
      serviceProviderData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = serviceProvider.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getServiceProviderFirestoreData(
  ServiceProviderStruct? serviceProvider, [
  bool forFieldValue = false,
]) {
  if (serviceProvider == null) {
    return {};
  }
  final firestoreData = mapToFirestore(serviceProvider.toMap());

  // Add any Firestore field values
  serviceProvider.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getServiceProviderListFirestoreData(
  List<ServiceProviderStruct>? serviceProviders,
) =>
    serviceProviders
        ?.map((e) => getServiceProviderFirestoreData(e, true))
        .toList() ??
    [];
