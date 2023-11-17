import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/buttons/primary_rounded_button_loading/primary_rounded_button_loading_widget.dart';
import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/application/components/shimmers/shimmer_lists_of_cards/shimmer_lists_of_cards_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'create_media_widget.dart' show CreateMediaWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class CreateMediaModel extends FlutterFlowModel<CreateMediaWidget> {
  ///  Local state fields for this component.

  bool? previewStockPhoto = false;

  String? photoPhotoUrl;

  String? photoSource = '';

  String? photoCredit = '';

  String? photoColor = '';

  int? photoListIndex = 0;

  int? photoListLast = 5;

  ///  State fields for stateful widgets in this component.

  // Model for PrimaryRoundedButton component.
  late PrimaryRoundedButtonModel primaryRoundedButtonModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for ShimmerCard component.
  late ShimmerCardModel shimmerCardModel;
  // Model for PrimaryRoundedButtonLoading component.
  late PrimaryRoundedButtonLoadingModel primaryRoundedButtonLoadingModel1;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Model for PrimaryRoundedButtonLoading component.
  late PrimaryRoundedButtonLoadingModel primaryRoundedButtonLoadingModel2;
  // Model for SearchTextField-Pexels.
  late SearchTextFieldModel searchTextFieldPexelsModel;
  // Stores action output result for [Backend Call - API (PexelsAPI)] action in SearchTextField-Pexels widget.
  ApiCallResponse? apiResultmzr;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    primaryRoundedButtonModel =
        createModel(context, () => PrimaryRoundedButtonModel());
    shimmerCardModel = createModel(context, () => ShimmerCardModel());
    primaryRoundedButtonLoadingModel1 =
        createModel(context, () => PrimaryRoundedButtonLoadingModel());
    primaryRoundedButtonLoadingModel2 =
        createModel(context, () => PrimaryRoundedButtonLoadingModel());
    searchTextFieldPexelsModel =
        createModel(context, () => SearchTextFieldModel());
  }

  void dispose() {
    primaryRoundedButtonModel.dispose();
    tabBarController?.dispose();
    shimmerCardModel.dispose();
    primaryRoundedButtonLoadingModel1.dispose();
    primaryRoundedButtonLoadingModel2.dispose();
    searchTextFieldPexelsModel.dispose();
  }

  /// Action blocks are added here.

  Future clearPhotoData(BuildContext context) async {
    logFirebaseEvent('ClearPhotoData_update_component_state');
    previewStockPhoto = false;
    photoPhotoUrl = null;
    photoSource = '';
    photoCredit = '';
    photoColor = '';
  }

  /// Additional helper methods are added here.
}
