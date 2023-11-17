import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dropdown_basic_model.dart';
export 'dropdown_basic_model.dart';

class DropdownBasicWidget extends StatefulWidget {
  const DropdownBasicWidget({
    Key? key,
    String? labelPara,
    String? hintPara,
    this.listLabelPara,
    this.listValuePara,
    this.optionValuePara,
    this.dropdownIcon,
    this.searchablePara,
    this.actionPara,
    bool? disableDropdownPara,
  })  : this.labelPara = labelPara ?? 'Label here',
        this.hintPara = hintPara ?? 'Hint here',
        this.disableDropdownPara = disableDropdownPara ?? false,
        super(key: key);

  final String labelPara;
  final String hintPara;
  final List<String>? listLabelPara;
  final List<String>? listValuePara;
  final String? optionValuePara;
  final Widget? dropdownIcon;
  final String? searchablePara;
  final Future<dynamic> Function()? actionPara;
  final bool disableDropdownPara;

  @override
  _DropdownBasicWidgetState createState() => _DropdownBasicWidgetState();
}

class _DropdownBasicWidgetState extends State<DropdownBasicWidget> {
  late DropdownBasicModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownBasicModel());

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelPara != null && widget.labelPara != '')
            Text(
              valueOrDefault<String>(
                widget.labelPara,
                'Label here',
              ),
              style: FlutterFlowTheme.of(context).labelSmall,
            ),
          FlutterFlowDropDown<String>(
            controller: _model.dropDownValueController ??=
                FormFieldController<String>(
              _model.dropDownValue ??= widget.optionValuePara,
            ),
            options: List<String>.from(widget.listValuePara!),
            optionLabels: widget.listLabelPara!,
            onChanged: (val) async {
              setState(() => _model.dropDownValue = val);
              logFirebaseEvent('DROPDOWN_BASIC_DropDown_2kc3cuiu_ON_FORM');
              logFirebaseEvent('DropDown_execute_callback');
              await widget.actionPara?.call();
            },
            height: 42.0,
            textStyle: FlutterFlowTheme.of(context).bodyMedium,
            hintText: widget.hintPara,
            icon: Icon(
              FFIcons.karrowDown1,
              size: 18.0,
            ),
            elevation: 2.0,
            borderColor: FlutterFlowTheme.of(context).lineColor,
            borderWidth: 1.0,
            borderRadius: 8.0,
            margin: EdgeInsetsDirectional.fromSTEB(10.0, 4.0, 10.0, 4.0),
            hidesUnderline: true,
            disabled: widget.disableDropdownPara,
            isSearchable: false,
            isMultiSelect: false,
          ),
        ].divide(SizedBox(height: 5.0)),
      ),
    );
  }
}
