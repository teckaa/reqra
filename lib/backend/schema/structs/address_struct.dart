// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressStruct extends FFFirebaseStruct {
  AddressStruct({
    String? apartmentNumber,
    String? street,
    String? city,
    String? state,
    String? zipcode,
    String? country,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _apartmentNumber = apartmentNumber,
        _street = street,
        _city = city,
        _state = state,
        _zipcode = zipcode,
        _country = country,
        super(firestoreUtilData);

  // "apartment_number" field.
  String? _apartmentNumber;
  String get apartmentNumber => _apartmentNumber ?? '';
  set apartmentNumber(String? val) => _apartmentNumber = val;
  bool hasApartmentNumber() => _apartmentNumber != null;

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  set street(String? val) => _street = val;
  bool hasStreet() => _street != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;
  bool hasState() => _state != null;

  // "zipcode" field.
  String? _zipcode;
  String get zipcode => _zipcode ?? '';
  set zipcode(String? val) => _zipcode = val;
  bool hasZipcode() => _zipcode != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;
  bool hasCountry() => _country != null;

  static AddressStruct fromMap(Map<String, dynamic> data) => AddressStruct(
        apartmentNumber: data['apartment_number'] as String?,
        street: data['street'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        zipcode: data['zipcode'] as String?,
        country: data['country'] as String?,
      );

  static AddressStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AddressStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'apartment_number': _apartmentNumber,
        'street': _street,
        'city': _city,
        'state': _state,
        'zipcode': _zipcode,
        'country': _country,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'apartment_number': serializeParam(
          _apartmentNumber,
          ParamType.String,
        ),
        'street': serializeParam(
          _street,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'zipcode': serializeParam(
          _zipcode,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
      }.withoutNulls;

  static AddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressStruct(
        apartmentNumber: deserializeParam(
          data['apartment_number'],
          ParamType.String,
          false,
        ),
        street: deserializeParam(
          data['street'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        zipcode: deserializeParam(
          data['zipcode'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressStruct &&
        apartmentNumber == other.apartmentNumber &&
        street == other.street &&
        city == other.city &&
        state == other.state &&
        zipcode == other.zipcode &&
        country == other.country;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([apartmentNumber, street, city, state, zipcode, country]);
}

AddressStruct createAddressStruct({
  String? apartmentNumber,
  String? street,
  String? city,
  String? state,
  String? zipcode,
  String? country,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressStruct(
      apartmentNumber: apartmentNumber,
      street: street,
      city: city,
      state: state,
      zipcode: zipcode,
      country: country,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressStruct? updateAddressStruct(
  AddressStruct? address, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    address
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressStructData(
  Map<String, dynamic> firestoreData,
  AddressStruct? address,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (address == null) {
    return;
  }
  if (address.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && address.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressData = getAddressFirestoreData(address, forFieldValue);
  final nestedData = addressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = address.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressFirestoreData(
  AddressStruct? address, [
  bool forFieldValue = false,
]) {
  if (address == null) {
    return {};
  }
  final firestoreData = mapToFirestore(address.toMap());

  // Add any Firestore field values
  address.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressListFirestoreData(
  List<AddressStruct>? addresss,
) =>
    addresss?.map((e) => getAddressFirestoreData(e, true)).toList() ?? [];
