import '/application/backend/d_w_media/components/list_of_media_comp/list_of_media_comp_widget.dart';
import '/application/backend/d_w_posts/categories/create_category/create_category_widget.dart';
import '/application/backend/d_w_posts/categories/list_of_categories/list_of_categories_widget.dart';
import '/application/components/forms/amount_text_field/amount_text_field_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/number_text_field/number_text_field_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'product_composer_widget.dart' show ProductComposerWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProductComposerModel extends FlutterFlowModel<ProductComposerWidget> {
  ///  Local state fields for this component.

  String? getImagepath;

  ///  State fields for stateful widgets in this component.

  // Model for InputTextField-ProductName.
  late InputTextFieldModel inputTextFieldProductNameModel;
  // State field(s) for TextField-PostDesc widget.
  FocusNode? textFieldPostDescFocusNode;
  TextEditingController? textFieldPostDescController;
  String? Function(BuildContext, String?)? textFieldPostDescControllerValidator;
  // Model for AmountTextField-Price.
  late AmountTextFieldModel amountTextFieldPriceModel;
  // Model for AmountTextField-OnSale.
  late AmountTextFieldModel amountTextFieldOnSaleModel;
  // Model for NumberTextField-Stock.
  late NumberTextFieldModel numberTextFieldStockModel;
  // Model for InputTextField-SKU.
  late InputTextFieldModel inputTextFieldSKUModel;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    inputTextFieldProductNameModel =
        createModel(context, () => InputTextFieldModel());
    amountTextFieldPriceModel =
        createModel(context, () => AmountTextFieldModel());
    amountTextFieldOnSaleModel =
        createModel(context, () => AmountTextFieldModel());
    numberTextFieldStockModel =
        createModel(context, () => NumberTextFieldModel());
    inputTextFieldSKUModel = createModel(context, () => InputTextFieldModel());
  }

  void dispose() {
    inputTextFieldProductNameModel.dispose();
    textFieldPostDescFocusNode?.dispose();
    textFieldPostDescController?.dispose();

    amountTextFieldPriceModel.dispose();
    amountTextFieldOnSaleModel.dispose();
    numberTextFieldStockModel.dispose();
    inputTextFieldSKUModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
