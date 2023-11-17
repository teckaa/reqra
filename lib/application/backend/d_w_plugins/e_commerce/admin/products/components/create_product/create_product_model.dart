import '/application/backend/d_w_plugins/e_commerce/admin/products/components/product_composer/product_composer_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/modals/modal_footer_row/modal_footer_row_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_product_widget.dart' show CreateProductWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateProductModel extends FlutterFlowModel<CreateProductWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ModalHeader component.
  late ModalHeaderModel modalHeaderModel;
  // Model for ProductComposer component.
  late ProductComposerModel productComposerModel;
  // Model for ModalFooterRow component.
  late ModalFooterRowModel modalFooterRowModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    modalHeaderModel = createModel(context, () => ModalHeaderModel());
    productComposerModel = createModel(context, () => ProductComposerModel());
    modalFooterRowModel = createModel(context, () => ModalFooterRowModel());
  }

  void dispose() {
    modalHeaderModel.dispose();
    productComposerModel.dispose();
    modalFooterRowModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
