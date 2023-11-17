import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'get_recipient_data_model.dart';
export 'get_recipient_data_model.dart';

class GetRecipientDataWidget extends StatefulWidget {
  const GetRecipientDataWidget({
    Key? key,
    this.countryPara,
    this.accountOwnerPara,
    this.bankNamePara,
    this.accountNumberPara,
    this.accountNamePara,
  }) : super(key: key);

  final String? countryPara;
  final String? accountOwnerPara;
  final String? bankNamePara;
  final String? accountNumberPara;
  final String? accountNamePara;

  @override
  _GetRecipientDataWidgetState createState() => _GetRecipientDataWidgetState();
}

class _GetRecipientDataWidgetState extends State<GetRecipientDataWidget> {
  late GetRecipientDataModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GetRecipientDataModel());

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
      width: 500.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Form(
        key: _model.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ))
              wrapWithModel(
                model: _model.inputTextFieldCountryModel,
                updateCallback: () => setState(() {}),
                child: InputTextFieldWidget(
                  labelPara: 'Country',
                  valuePara: 'NG',
                  readOnlyStatusPara: false,
                  actionPara: () async {},
                ),
              ),
            wrapWithModel(
              model: _model.inputTextFieldAccountOwnerModel,
              updateCallback: () => setState(() {}),
              child: InputTextFieldWidget(
                labelPara: 'Who’s your new recipient?',
                valuePara: widget.accountOwnerPara,
                readOnlyStatusPara: true,
                filledColorPara: FlutterFlowTheme.of(context).lineColor,
                actionPara: () async {},
              ),
            ),
            wrapWithModel(
              model: _model.inputTextFieldBankNameModel,
              updateCallback: () => setState(() {}),
              child: InputTextFieldWidget(
                labelPara: 'Bank name',
                valuePara: widget.bankNamePara,
                readOnlyStatusPara: true,
                filledColorPara: FlutterFlowTheme.of(context).lineColor,
                actionPara: () async {},
              ),
            ),
            wrapWithModel(
              model: _model.inputTextFieldAccountNumberModel,
              updateCallback: () => setState(() {}),
              child: InputTextFieldWidget(
                labelPara: 'Enter account number',
                valuePara: widget.accountNumberPara,
                readOnlyStatusPara: true,
                filledColorPara: FlutterFlowTheme.of(context).lineColor,
                actionPara: () async {},
              ),
            ),
            wrapWithModel(
              model: _model.inputTextFieldAccountNameModel,
              updateCallback: () => setState(() {}),
              child: InputTextFieldWidget(
                labelPara: 'Name on account',
                valuePara: widget.accountNamePara,
                readOnlyStatusPara: true,
                filledColorPara: FlutterFlowTheme.of(context).lineColor,
                actionPara: () async {},
              ),
            ),
          ].divide(SizedBox(height: 15.0)),
        ),
      ),
    );
  }
}
