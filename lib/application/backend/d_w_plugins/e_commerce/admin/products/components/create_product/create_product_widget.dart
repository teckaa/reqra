import '/application/backend/d_w_plugins/e_commerce/admin/products/components/product_composer/product_composer_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/modals/modal_footer_row/modal_footer_row_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'create_product_model.dart';
export 'create_product_model.dart';

class CreateProductWidget extends StatefulWidget {
  const CreateProductWidget({Key? key}) : super(key: key);

  @override
  _CreateProductWidgetState createState() => _CreateProductWidgetState();
}

class _CreateProductWidgetState extends State<CreateProductWidget> {
  late CreateProductModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateProductModel());

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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 1000.0,
            height: MediaQuery.sizeOf(context).height * 0.9,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Builder(
                  builder: (context) => wrapWithModel(
                    model: _model.modalHeaderModel,
                    updateCallback: () => setState(() {}),
                    child: ModalHeaderWidget(
                      headerTitlePara: 'New Product',
                      headerActionPara: () async {
                        logFirebaseEvent(
                            'CREATE_PRODUCT_Container_ctk3d2kz_CALLBA');
                        logFirebaseEvent('ModalHeader_alert_dialog');
                        await showAlignedDialog(
                          context: context,
                          isGlobal: true,
                          avoidOverflow: false,
                          targetAnchor: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          followerAnchor: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          builder: (dialogContext) {
                            return Material(
                              color: Colors.transparent,
                              child: WebViewAware(
                                  child: ModalConfirmWidget(
                                modalTitle: 'Leave Editor?',
                                modalDesc: 'You will lose any unsaved changes.',
                                modalAction: () async {
                                  logFirebaseEvent(
                                      '_close_dialog,_drawer,_etc');
                                  Navigator.pop(context);
                                  logFirebaseEvent('_bottom_sheet');
                                  Navigator.pop(context);
                                },
                              )),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          wrapWithModel(
                            model: _model.productComposerModel,
                            updateCallback: () => setState(() {}),
                            child: ProductComposerWidget(
                              postButton: () async {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.modalFooterRowModel,
                  updateCallback: () => setState(() {}),
                  child: ModalFooterRowWidget(
                    cancelTextPara: 'Cancel',
                    proceedTextPara: 'Save',
                    proceedActionPara: () async {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
