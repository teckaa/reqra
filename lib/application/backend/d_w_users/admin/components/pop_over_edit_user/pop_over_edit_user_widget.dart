import '/application/backend/d_w_users/admin/components/read_user/read_user_widget.dart';
import '/application/backend/d_w_users/admin/components/update_user/update_user_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/modals/pop_over_menu_item/pop_over_menu_item_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pop_over_edit_user_model.dart';
export 'pop_over_edit_user_model.dart';

class PopOverEditUserWidget extends StatefulWidget {
  const PopOverEditUserWidget({
    Key? key,
    this.userRef,
  }) : super(key: key);

  final DocumentReference? userRef;

  @override
  _PopOverEditUserWidgetState createState() => _PopOverEditUserWidgetState();
}

class _PopOverEditUserWidgetState extends State<PopOverEditUserWidget> {
  late PopOverEditUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopOverEditUserModel());

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
      width: 150.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: FlutterFlowTheme.of(context).accent4,
            offset: Offset(0.0, 2.0),
          )
        ],
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).lineColor,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('POP_OVER_EDIT_USER_PopMenuItem-View_ON_T');
                logFirebaseEvent('PopMenuItem-View_close_dialog,_drawer,_e');
                Navigator.pop(context);
                logFirebaseEvent('PopMenuItem-View_bottom_sheet');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: FlutterFlowTheme.of(context).overlay,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return WebViewAware(
                        child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: ReadUserWidget(
                        userRef: widget.userRef,
                      ),
                    ));
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: wrapWithModel(
                model: _model.popMenuItemViewModel,
                updateCallback: () => setState(() {}),
                child: PopOverMenuItemWidget(
                  itemName: 'Read user details',
                  itemIcon: Icon(
                    FFIcons.kexport3,
                    size: 12.0,
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('POP_OVER_EDIT_USER_PopMenuItem-Edit_ON_T');
                logFirebaseEvent('PopMenuItem-Edit_close_dialog,_drawer,_e');
                Navigator.pop(context);
                logFirebaseEvent('PopMenuItem-Edit_bottom_sheet');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: FlutterFlowTheme.of(context).overlay,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return WebViewAware(
                        child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: UpdateUserWidget(
                        userRef: widget.userRef,
                      ),
                    ));
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: wrapWithModel(
                model: _model.popMenuItemEditModel,
                updateCallback: () => setState(() {}),
                child: PopOverMenuItemWidget(
                  itemName: 'Update user details',
                  itemIcon: Icon(
                    FFIcons.kuserEdit,
                    size: 12.0,
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('POP_OVER_EDIT_USER_PopMenuItem-CreateOrd');
                logFirebaseEvent('PopMenuItem-CreateOrder_close_dialog,_dr');
                Navigator.pop(context);
                logFirebaseEvent('PopMenuItem-CreateOrder_bottom_sheet');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: FlutterFlowTheme.of(context).overlay,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return WebViewAware(
                        child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: ReadUserWidget(
                        userRef: widget.userRef,
                      ),
                    ));
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: wrapWithModel(
                model: _model.popMenuItemCreateOrderModel,
                updateCallback: () => setState(() {}),
                child: PopOverMenuItemWidget(
                  itemName: 'Create order',
                  itemIcon: Icon(
                    FFIcons.kadditem,
                    size: 12.0,
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('POP_OVER_EDIT_USER_PopMenuItem-CreateBen');
                logFirebaseEvent('PopMenuItem-CreateBeneficiary_close_dial');
                Navigator.pop(context);
                logFirebaseEvent('PopMenuItem-CreateBeneficiary_bottom_she');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: FlutterFlowTheme.of(context).overlay,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return WebViewAware(
                        child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: ReadUserWidget(
                        userRef: widget.userRef,
                      ),
                    ));
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: wrapWithModel(
                model: _model.popMenuItemCreateBeneficiaryModel,
                updateCallback: () => setState(() {}),
                child: PopOverMenuItemWidget(
                  itemName: 'Create beneficiary',
                  itemIcon: Icon(
                    FFIcons.ksaveAdd,
                    size: 12.0,
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('POP_OVER_EDIT_USER_PopMenuItem-Suspend_O');
                logFirebaseEvent('PopMenuItem-Suspend_close_dialog,_drawer');
                Navigator.pop(context);
                logFirebaseEvent('PopMenuItem-Suspend_bottom_sheet');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: FlutterFlowTheme.of(context).overlay,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return WebViewAware(
                        child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: ModalConfirmWidget(
                        modalTitle: 'Suspend user',
                        modalDesc:
                            'Are you sure you want to suspend this user?',
                        modalAction: () async {
                          logFirebaseEvent('_backend_call');

                          await widget.userRef!.update(createUsersRecordData(
                            userStatus: 'Suspended',
                          ));
                          logFirebaseEvent('_navigate_to');

                          context.pushNamed('ListOfUsers');
                        },
                      ),
                    ));
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: wrapWithModel(
                model: _model.popMenuItemSuspendModel,
                updateCallback: () => setState(() {}),
                child: PopOverMenuItemWidget(
                  itemName: 'Suspend user',
                  itemIcon: Icon(
                    FFIcons.kuserMinus,
                    size: 12.0,
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('POP_OVER_EDIT_USER_PopMenuItem-Activate_');
                logFirebaseEvent('PopMenuItem-Activate_close_dialog,_drawe');
                Navigator.pop(context);
                logFirebaseEvent('PopMenuItem-Activate_bottom_sheet');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: FlutterFlowTheme.of(context).overlay,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return WebViewAware(
                        child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: ModalConfirmWidget(
                        modalTitle: 'Active user',
                        modalDesc: 'Are you sure you want to active this user?',
                        modalAction: () async {
                          logFirebaseEvent('_backend_call');

                          await widget.userRef!.update(createUsersRecordData(
                            userStatus: 'Active',
                          ));
                          logFirebaseEvent('_navigate_to');

                          context.pushNamed('ListOfUsers');
                        },
                      ),
                    ));
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: wrapWithModel(
                model: _model.popMenuItemActivateModel,
                updateCallback: () => setState(() {}),
                child: PopOverMenuItemWidget(
                  itemName: 'Activate user',
                  itemIcon: Icon(
                    FFIcons.kuserTick,
                    size: 12.0,
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('POP_OVER_EDIT_USER_PopMenuItem-Delete_ON');
                logFirebaseEvent('PopMenuItem-Delete_close_dialog,_drawer,');
                Navigator.pop(context);
                logFirebaseEvent('PopMenuItem-Delete_bottom_sheet');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: FlutterFlowTheme.of(context).overlay,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return WebViewAware(
                        child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: ModalConfirmWidget(
                        modalTitle: 'Delete user',
                        modalDesc: 'Are you sure you want to delete this user?',
                        modalAction: () async {
                          logFirebaseEvent('_auth');
                          logFirebaseEvent('_navigate_to');

                          context.pushNamed('ListOfUsers');
                        },
                      ),
                    ));
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: wrapWithModel(
                model: _model.popMenuItemDeleteModel,
                updateCallback: () => setState(() {}),
                child: PopOverMenuItemWidget(
                  itemName: 'Delete user',
                  itemIcon: Icon(
                    FFIcons.kuserRemove,
                    size: 12.0,
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 10.0)).around(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
