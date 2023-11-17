import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'category_composer_model.dart';
export 'category_composer_model.dart';

class CategoryComposerWidget extends StatefulWidget {
  const CategoryComposerWidget({
    Key? key,
    this.catName,
    this.btnText,
    this.btnAction,
    this.catComponentTitle,
  }) : super(key: key);

  final String? catName;
  final String? btnText;
  final Future<dynamic> Function()? btnAction;
  final String? catComponentTitle;

  @override
  _CategoryComposerWidgetState createState() => _CategoryComposerWidgetState();
}

class _CategoryComposerWidgetState extends State<CategoryComposerWidget> {
  late CategoryComposerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryComposerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 300.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          wrapWithModel(
            model: _model.inputTextFieldCatNameModel,
            updateCallback: () => setState(() {}),
            child: InputTextFieldWidget(
              labelPara: 'Category Name',
              valuePara: widget.catName,
              readOnlyStatusPara: false,
              actionPara: () async {},
            ),
          ),
        ].divide(SizedBox(height: 15.0)),
      ),
    );
  }
}
