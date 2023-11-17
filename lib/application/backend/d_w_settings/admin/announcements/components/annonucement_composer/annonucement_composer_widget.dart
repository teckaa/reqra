import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'annonucement_composer_model.dart';
export 'annonucement_composer_model.dart';

class AnnonucementComposerWidget extends StatefulWidget {
  const AnnonucementComposerWidget({
    Key? key,
    this.titlePara,
    this.descPara,
    this.saveActionPara,
    this.pagePara,
  }) : super(key: key);

  final String? titlePara;
  final String? descPara;
  final Future<dynamic> Function()? saveActionPara;
  final String? pagePara;

  @override
  _AnnonucementComposerWidgetState createState() =>
      _AnnonucementComposerWidgetState();
}

class _AnnonucementComposerWidgetState
    extends State<AnnonucementComposerWidget> {
  late AnnonucementComposerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnnonucementComposerModel());

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
      width: 400.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          wrapWithModel(
            model: _model.inputTextFieldTitleModel,
            updateCallback: () => setState(() {}),
            child: InputTextFieldWidget(
              labelPara: 'Announcement Title',
              hintPara: 'Report Information',
              valuePara: widget.titlePara,
              readOnlyStatusPara: false,
              actionPara: () async {},
            ),
          ),
          wrapWithModel(
            model: _model.inputTextAreaDescModel,
            updateCallback: () => setState(() {}),
            child: InputTextAreaWidget(
              labelPara: 'Announcement Message',
              hintPara: 'Write your Announcement',
              valuePara: widget.descPara,
              readOnlyStatusPara: false,
              actionPara: () async {},
            ),
          ),
        ].divide(SizedBox(height: 20.0)),
      ),
    );
  }
}
