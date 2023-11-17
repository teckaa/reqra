import '/application/backend/d_w_media/components/create_media/create_media_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/empty/empty_table/empty_table_widget.dart';
import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/icons/close_icon/close_icon_widget.dart';
import '/application/components/shimmers/shimmer_lists_of_cards/shimmer_lists_of_cards_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'list_of_media_comp_model.dart';
export 'list_of_media_comp_model.dart';

class ListOfMediaCompWidget extends StatefulWidget {
  const ListOfMediaCompWidget({Key? key}) : super(key: key);

  @override
  _ListOfMediaCompWidgetState createState() => _ListOfMediaCompWidgetState();
}

class _ListOfMediaCompWidgetState extends State<ListOfMediaCompWidget> {
  late ListOfMediaCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfMediaCompModel());

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
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 450.0,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 300.0,
                            decoration: BoxDecoration(),
                            child: wrapWithModel(
                              model: _model.searchTextFieldModel,
                              updateCallback: () => setState(() {}),
                              child: SearchTextFieldWidget(
                                hintPara: 'Search',
                                readOnlyStatusPara: false,
                                actionPara: () async {},
                              ),
                            ),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.primaryButtonModel,
                          updateCallback: () => setState(() {}),
                          child: PrimaryButtonWidget(
                            buttonText: 'Add new',
                            buttonTextColor: FlutterFlowTheme.of(context).white,
                            disableStatusPara: false,
                            buttonAction: () async {
                              logFirebaseEvent(
                                  'LIST_OF_MEDIA_Container_0ltisrd4_CALLBAC');
                              logFirebaseEvent('PrimaryButton_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor:
                                    FlutterFlowTheme.of(context).overlay,
                                useSafeArea: true,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                      child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: CreateMediaWidget(),
                                  ));
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                          ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'LIST_OF_MEDIA_Container_1gijahhh_ON_TAP');
                      logFirebaseEvent('CloseIcon_bottom_sheet');
                      Navigator.pop(context);
                    },
                    child: wrapWithModel(
                      model: _model.closeIconModel,
                      updateCallback: () => setState(() {}),
                      child: CloseIconWidget(
                        closeIcon: Icon(
                          FFIcons.kcloseSquare,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.00, -1.00),
                  child:
                      PagedGridView<DocumentSnapshot<Object?>?, DwMediaRecord>(
                    pagingController: _model.setGridViewController(
                      DwMediaRecord.collection
                          .orderBy('created_time', descending: true),
                    ),
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: valueOrDefault<int>(
                        () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 2;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 3;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 3;
                          } else {
                            return 3;
                          }
                        }(),
                        3,
                      ),
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: 1.0,
                    ),
                    scrollDirection: Axis.vertical,
                    builderDelegate: PagedChildBuilderDelegate<DwMediaRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) =>
                          ShimmerListsOfCardsWidget(
                        itemNo: 3,
                      ),
                      // Customize what your widget looks like when it's loading another page.
                      newPageProgressIndicatorBuilder: (_) =>
                          ShimmerListsOfCardsWidget(
                        itemNo: 3,
                      ),
                      noItemsFoundIndicatorBuilder: (_) => EmptyTableWidget(
                        titlePara: 'No Media yet',
                        descPara:
                            'Begin by uploading your image here. You can reuse your image after it has been uploaded.',
                        buttonTextPara: 'Start Uploading',
                        buttonActionPara: () async {
                          logFirebaseEvent(
                              'LIST_OF_MEDIA_GridView_70a6ayw8_CALLBACK');
                          logFirebaseEvent('GridView_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: FlutterFlowTheme.of(context).overlay,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                  child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: CreateMediaWidget(),
                              ));
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                      itemBuilder: (context, _, gridViewIndex) {
                        final gridViewDwMediaRecord = _model
                            .gridViewPagingController!.itemList![gridViewIndex];
                        return Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).lineColor,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'LIST_OF_MEDIA_Image_dxl4lttp_ON_TAP');
                              logFirebaseEvent('Image_dismiss_dialog');
                              Navigator.pop(
                                  context, gridViewDwMediaRecord.photoPath);
                            },
                            child: Hero(
                              tag: gridViewDwMediaRecord.photoPath,
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 500),
                                  fadeOutDuration: Duration(milliseconds: 500),
                                  imageUrl: getCORSProxyUrl(
                                    gridViewDwMediaRecord.photoPath,
                                  ),
                                  width: double.infinity,
                                  height: 200.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
