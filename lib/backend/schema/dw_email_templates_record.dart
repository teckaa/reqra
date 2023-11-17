import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DwEmailTemplatesRecord extends FirestoreRecord {
  DwEmailTemplatesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "brand_name" field.
  String? _brandName;
  String get brandName => _brandName ?? '';
  bool hasBrandName() => _brandName != null;

  // "brand_logo" field.
  String? _brandLogo;
  String get brandLogo => _brandLogo ?? '';
  bool hasBrandLogo() => _brandLogo != null;

  // "from_email" field.
  String? _fromEmail;
  String get fromEmail => _fromEmail ?? '';
  bool hasFromEmail() => _fromEmail != null;

  // "footer_text" field.
  String? _footerText;
  String get footerText => _footerText ?? '';
  bool hasFooterText() => _footerText != null;

  // "additional_text" field.
  String? _additionalText;
  String get additionalText => _additionalText ?? '';
  bool hasAdditionalText() => _additionalText != null;

  // "brand_color" field.
  String? _brandColor;
  String get brandColor => _brandColor ?? '';
  bool hasBrandColor() => _brandColor != null;

  // "background_color" field.
  String? _backgroundColor;
  String get backgroundColor => _backgroundColor ?? '';
  bool hasBackgroundColor() => _backgroundColor != null;

  // "content_background_color" field.
  String? _contentBackgroundColor;
  String get contentBackgroundColor => _contentBackgroundColor ?? '';
  bool hasContentBackgroundColor() => _contentBackgroundColor != null;

  // "content_text_color" field.
  String? _contentTextColor;
  String get contentTextColor => _contentTextColor ?? '';
  bool hasContentTextColor() => _contentTextColor != null;

  void _initializeFields() {
    _brandName = snapshotData['brand_name'] as String?;
    _brandLogo = snapshotData['brand_logo'] as String?;
    _fromEmail = snapshotData['from_email'] as String?;
    _footerText = snapshotData['footer_text'] as String?;
    _additionalText = snapshotData['additional_text'] as String?;
    _brandColor = snapshotData['brand_color'] as String?;
    _backgroundColor = snapshotData['background_color'] as String?;
    _contentBackgroundColor =
        snapshotData['content_background_color'] as String?;
    _contentTextColor = snapshotData['content_text_color'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dw_email_templates');

  static Stream<DwEmailTemplatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DwEmailTemplatesRecord.fromSnapshot(s));

  static Future<DwEmailTemplatesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DwEmailTemplatesRecord.fromSnapshot(s));

  static DwEmailTemplatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DwEmailTemplatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DwEmailTemplatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DwEmailTemplatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DwEmailTemplatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DwEmailTemplatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDwEmailTemplatesRecordData({
  String? brandName,
  String? brandLogo,
  String? fromEmail,
  String? footerText,
  String? additionalText,
  String? brandColor,
  String? backgroundColor,
  String? contentBackgroundColor,
  String? contentTextColor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'brand_name': brandName,
      'brand_logo': brandLogo,
      'from_email': fromEmail,
      'footer_text': footerText,
      'additional_text': additionalText,
      'brand_color': brandColor,
      'background_color': backgroundColor,
      'content_background_color': contentBackgroundColor,
      'content_text_color': contentTextColor,
    }.withoutNulls,
  );

  return firestoreData;
}

class DwEmailTemplatesRecordDocumentEquality
    implements Equality<DwEmailTemplatesRecord> {
  const DwEmailTemplatesRecordDocumentEquality();

  @override
  bool equals(DwEmailTemplatesRecord? e1, DwEmailTemplatesRecord? e2) {
    return e1?.brandName == e2?.brandName &&
        e1?.brandLogo == e2?.brandLogo &&
        e1?.fromEmail == e2?.fromEmail &&
        e1?.footerText == e2?.footerText &&
        e1?.additionalText == e2?.additionalText &&
        e1?.brandColor == e2?.brandColor &&
        e1?.backgroundColor == e2?.backgroundColor &&
        e1?.contentBackgroundColor == e2?.contentBackgroundColor &&
        e1?.contentTextColor == e2?.contentTextColor;
  }

  @override
  int hash(DwEmailTemplatesRecord? e) => const ListEquality().hash([
        e?.brandName,
        e?.brandLogo,
        e?.fromEmail,
        e?.footerText,
        e?.additionalText,
        e?.brandColor,
        e?.backgroundColor,
        e?.contentBackgroundColor,
        e?.contentTextColor
      ]);

  @override
  bool isValidKey(Object? o) => o is DwEmailTemplatesRecord;
}
