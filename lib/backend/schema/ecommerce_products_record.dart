import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EcommerceProductsRecord extends FirestoreRecord {
  EcommerceProductsRecord._(
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

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "specifications" field.
  String? _specifications;
  String get specifications => _specifications ?? '';
  bool hasSpecifications() => _specifications != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "on_sale" field.
  double? _onSale;
  double get onSale => _onSale ?? 0.0;
  bool hasOnSale() => _onSale != null;

  // "sale_price" field.
  double? _salePrice;
  double get salePrice => _salePrice ?? 0.0;
  bool hasSalePrice() => _salePrice != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _specifications = snapshotData['specifications'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _onSale = castToType<double>(snapshotData['on_sale']);
    _salePrice = castToType<double>(snapshotData['sale_price']);
    _quantity = castToType<int>(snapshotData['quantity']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ecommerce_products');

  static Stream<EcommerceProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EcommerceProductsRecord.fromSnapshot(s));

  static Future<EcommerceProductsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EcommerceProductsRecord.fromSnapshot(s));

  static EcommerceProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EcommerceProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EcommerceProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EcommerceProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EcommerceProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EcommerceProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEcommerceProductsRecordData({
  DateTime? createdAt,
  DateTime? modifiedAt,
  DocumentReference? userRef,
  String? name,
  String? description,
  String? specifications,
  double? price,
  double? onSale,
  double? salePrice,
  int? quantity,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'user_ref': userRef,
      'name': name,
      'description': description,
      'specifications': specifications,
      'price': price,
      'on_sale': onSale,
      'sale_price': salePrice,
      'quantity': quantity,
    }.withoutNulls,
  );

  return firestoreData;
}

class EcommerceProductsRecordDocumentEquality
    implements Equality<EcommerceProductsRecord> {
  const EcommerceProductsRecordDocumentEquality();

  @override
  bool equals(EcommerceProductsRecord? e1, EcommerceProductsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.modifiedAt == e2?.modifiedAt &&
        e1?.userRef == e2?.userRef &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.specifications == e2?.specifications &&
        e1?.price == e2?.price &&
        e1?.onSale == e2?.onSale &&
        e1?.salePrice == e2?.salePrice &&
        e1?.quantity == e2?.quantity;
  }

  @override
  int hash(EcommerceProductsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.modifiedAt,
        e?.userRef,
        e?.name,
        e?.description,
        e?.specifications,
        e?.price,
        e?.onSale,
        e?.salePrice,
        e?.quantity
      ]);

  @override
  bool isValidKey(Object? o) => o is EcommerceProductsRecord;
}
