import '/application/backend/d_w_media/components/list_of_media_comp/list_of_media_comp_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/url_text_field/url_text_field_widget.dart';
import '/application/components/icons/icon/icon_widget.dart';
import '/application/components/layouts/icon_grid_with_details/icon_grid_with_details_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_ads_widget.dart' show CreateAdsWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateAdsModel extends FlutterFlowModel<CreateAdsWidget> {
  ///  Local state fields for this component.

  String typeOfAds = '';

  List<AdsFieldsStruct> listInAds = [];
  void addToListInAds(AdsFieldsStruct item) => listInAds.add(item);
  void removeFromListInAds(AdsFieldsStruct item) => listInAds.remove(item);
  void removeAtIndexFromListInAds(int index) => listInAds.removeAt(index);
  void insertAtIndexInListInAds(int index, AdsFieldsStruct item) =>
      listInAds.insert(index, item);
  void updateListInAdsAtIndex(int index, Function(AdsFieldsStruct) updateFn) =>
      listInAds[index] = updateFn(listInAds[index]);

  ///  State fields for stateful widgets in this component.

  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // Model for PrimaryButtonLoading-CreateTextAds.
  late PrimaryButtonLoadingModel primaryButtonLoadingCreateTextAdsModel;
  // Model for InputTextField-AdsName.
  late InputTextFieldModel inputTextFieldAdsNameModel;
  // State field(s) for Switch-AdsStatus widget.
  bool? switchAdsStatusValue;
  // Model for PrimaryButton-AddMoreTextBase.
  late PrimaryButtonModel primaryButtonAddMoreTextBaseModel;
  // Model for Icon component.
  late IconModel iconModel1;
  Color? colorPicked1;
  // State field(s) for CountController-TextSize widget.
  int? countControllerTextSizeValue;
  Color? colorPicked2;
  // State field(s) for CountController-HeightSize widget.
  int? countControllerHeightSizeValue;
  // State field(s) for TextField-AdsText widget.
  FocusNode? textFieldAdsTextFocusNode;
  TextEditingController? textFieldAdsTextController;
  String? Function(BuildContext, String?)? textFieldAdsTextControllerValidator;
  // Model for PrimaryButton-AddMoreImageBase.
  late PrimaryButtonModel primaryButtonAddMoreImageBaseModel;
  // Model for Icon component.
  late IconModel iconModel2;
  // Model for PhotoGridCover component.
  late PhotoGridCoverModel photoGridCoverModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in PhotoGridCover widget.
  String? getImagePath;
  // Model for IconGridWithDetails component.
  late IconGridWithDetailsModel iconGridWithDetailsModel1;
  // Model for IconGridWithDetails component.
  late IconGridWithDetailsModel iconGridWithDetailsModel2;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // State field(s) for Checkbox-Autoplay widget.
  bool? checkboxAutoplayValue;
  // Model for InputTextField-Delay.
  late InputTextFieldModel inputTextFieldDelayModel;
  // State field(s) for Checkbox-Closable widget.
  bool? checkboxClosableValue;
  // State field(s) for DropDown-Location widget.
  String? dropDownLocationValue;
  FormFieldController<String>? dropDownLocationValueController;
  // Model for InputTextField-Internal.
  late InputTextFieldModel inputTextFieldInternalModel;
  // Model for UrlTextField-ExternalLink.
  late UrlTextFieldModel urlTextFieldExternalLinkModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    primaryButtonLoadingCreateTextAdsModel =
        createModel(context, () => PrimaryButtonLoadingModel());
    inputTextFieldAdsNameModel =
        createModel(context, () => InputTextFieldModel());
    primaryButtonAddMoreTextBaseModel =
        createModel(context, () => PrimaryButtonModel());
    iconModel1 = createModel(context, () => IconModel());
    primaryButtonAddMoreImageBaseModel =
        createModel(context, () => PrimaryButtonModel());
    iconModel2 = createModel(context, () => IconModel());
    photoGridCoverModel = createModel(context, () => PhotoGridCoverModel());
    iconGridWithDetailsModel1 =
        createModel(context, () => IconGridWithDetailsModel());
    iconGridWithDetailsModel2 =
        createModel(context, () => IconGridWithDetailsModel());
    inputTextFieldDelayModel =
        createModel(context, () => InputTextFieldModel());
    inputTextFieldInternalModel =
        createModel(context, () => InputTextFieldModel());
    urlTextFieldExternalLinkModel =
        createModel(context, () => UrlTextFieldModel());
  }

  void dispose() {
    modalHeaderModel.dispose();
    primaryButtonLoadingCreateTextAdsModel.dispose();
    inputTextFieldAdsNameModel.dispose();
    primaryButtonAddMoreTextBaseModel.dispose();
    iconModel1.dispose();
    textFieldAdsTextFocusNode?.dispose();
    textFieldAdsTextController?.dispose();

    primaryButtonAddMoreImageBaseModel.dispose();
    iconModel2.dispose();
    photoGridCoverModel.dispose();
    iconGridWithDetailsModel1.dispose();
    iconGridWithDetailsModel2.dispose();
    inputTextFieldDelayModel.dispose();
    inputTextFieldInternalModel.dispose();
    urlTextFieldExternalLinkModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
