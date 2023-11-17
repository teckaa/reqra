import '/application/backend/d_w_posts/categories/category_composer/category_composer_widget.dart';
import '/application/components/modals/modal_footer_row/modal_footer_row_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'update_product_category_model.dart';
export 'update_product_category_model.dart';

class UpdateProductCategoryWidget extends StatefulWidget {
  const UpdateProductCategoryWidget({
    Key? key,
    this.recordRef,
  }) : super(key: key);

  final DocumentReference? recordRef;

  @override
  _UpdateProductCategoryWidgetState createState() =>
      _UpdateProductCategoryWidgetState();
}

class _UpdateProductCategoryWidgetState
    extends State<UpdateProductCategoryWidget> with TickerProviderStateMixin {
  late UpdateProductCategoryModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 120.ms,
          begin: Offset(0.0, 45.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateProductCategoryModel());

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

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Container(
        width: 350.0,
        constraints: BoxConstraints(
          maxWidth: 500.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 40.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
              spreadRadius: 1.0,
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            wrapWithModel(
              model: _model.modalHeaderModel,
              updateCallback: () => setState(() {}),
              child: ModalHeaderWidget(
                headerTitlePara: 'Update product category',
                headerTitleTextSizePara: 14,
                headerTitleTextColorPara:
                    FlutterFlowTheme.of(context).primaryText,
                headerActionPara: () async {},
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 25.0),
              child: StreamBuilder<EcommerceCategoriesRecord>(
                stream:
                    EcommerceCategoriesRecord.getDocument(widget.recordRef!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: LinearProgressIndicator(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    );
                  }
                  final formUpdateProductCategoryEcommerceCategoriesRecord =
                      snapshot.data!;
                  return Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: wrapWithModel(
                      model: _model.categoryComposerModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: CategoryComposerWidget(
                        catName:
                            formUpdateProductCategoryEcommerceCategoriesRecord
                                .catName,
                        btnText: 'Save changes',
                        catComponentTitle: 'Edit category',
                        btnAction: () async {},
                      ),
                    ),
                  );
                },
              ),
            ),
            wrapWithModel(
              model: _model.modalFooterRowModel,
              updateCallback: () => setState(() {}),
              child: ModalFooterRowWidget(
                cancelTextPara: 'Cancel',
                proceedTextPara: 'Save changes',
                proceedActionPara: () async {
                  logFirebaseEvent('UPDATE_PRODUCT_CATEGORY_Container_c9w955');
                  logFirebaseEvent('ModalFooterRow_validate_form');
                  if (_model.formKey.currentState == null ||
                      !_model.formKey.currentState!.validate()) {
                    return;
                  }
                  logFirebaseEvent('ModalFooterRow_backend_call');

                  await widget.recordRef!
                      .update(createEcommerceCategoriesRecordData(
                    catName: _model.categoryComposerModel
                        .inputTextFieldCatNameModel.textController.text,
                    catSlug: functions.allLetterLowerCase(
                        functions.replaceWhiteSpaceWithDash(_model
                            .categoryComposerModel
                            .inputTextFieldCatNameModel
                            .textController
                            .text)),
                  ));
                  logFirebaseEvent('ModalFooterRow_close_dialog,_drawer,_etc');
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
