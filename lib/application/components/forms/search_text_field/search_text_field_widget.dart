import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_text_field_model.dart';
export 'search_text_field_model.dart';

class SearchTextFieldWidget extends StatefulWidget {
  const SearchTextFieldWidget({
    Key? key,
    this.hintPara,
    this.valuePara,
    this.actionPara,
    this.borderColor,
    bool? readOnlyStatusPara,
    Color? filledColorPara,
  })  : this.readOnlyStatusPara = readOnlyStatusPara ?? false,
        this.filledColorPara = filledColorPara ?? Colors.transparent,
        super(key: key);

  final String? hintPara;
  final String? valuePara;
  final Future<dynamic> Function()? actionPara;
  final Color? borderColor;
  final bool readOnlyStatusPara;
  final Color filledColorPara;

  @override
  _SearchTextFieldWidgetState createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  late SearchTextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchTextFieldModel());

    _model.searchTextFieldController ??=
        TextEditingController(text: widget.valuePara);
    _model.searchTextFieldFocusNode ??= FocusNode();

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
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: 200.0,
              child: TextFormField(
                controller: _model.searchTextFieldController,
                focusNode: _model.searchTextFieldFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.searchTextFieldController',
                  Duration(milliseconds: 0),
                  () async {
                    logFirebaseEvent(
                        'SEARCH_TEXT_FIELD_SearchTextField_ON_TEX');
                    logFirebaseEvent('SearchTextField_execute_callback');
                    await widget.actionPara?.call();
                  },
                ),
                readOnly: widget.readOnlyStatusPara,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: widget.hintPara,
                  hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodySmallFamily,
                        color: FlutterFlowTheme.of(context).textfieldHint,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodySmallFamily),
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).lineColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryText,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: widget.filledColorPara,
                  prefixIcon: Icon(
                    FFIcons.ksearchStatus1,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 18.0,
                  ),
                  suffixIcon: _model.searchTextFieldController!.text.isNotEmpty
                      ? InkWell(
                          onTap: () async {
                            _model.searchTextFieldController?.clear();
                            logFirebaseEvent(
                                'SEARCH_TEXT_FIELD_SearchTextField_ON_TEX');
                            logFirebaseEvent(
                                'SearchTextField_execute_callback');
                            await widget.actionPara?.call();
                            setState(() {});
                          },
                          child: Icon(
                            Icons.clear,
                            color: FlutterFlowTheme.of(context).textfieldHint,
                            size: 20.0,
                          ),
                        )
                      : null,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: FlutterFlowTheme.of(context).primaryText,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
                validator: _model.searchTextFieldControllerValidator
                    .asValidator(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
