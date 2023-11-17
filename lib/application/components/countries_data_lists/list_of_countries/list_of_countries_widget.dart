import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_of_countries_model.dart';
export 'list_of_countries_model.dart';

class ListOfCountriesWidget extends StatefulWidget {
  const ListOfCountriesWidget({Key? key}) : super(key: key);

  @override
  _ListOfCountriesWidgetState createState() => _ListOfCountriesWidgetState();
}

class _ListOfCountriesWidgetState extends State<ListOfCountriesWidget>
    with TickerProviderStateMixin {
  late ListOfCountriesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfCountriesModel());

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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
        child: Container(
          width: 400.0,
          height: 400.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 2.0,
                color: Color(0x51F1F4F8),
                offset: Offset(0.0, 2.0),
              )
            ],
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).lineColor,
              width: 1.0,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: wrapWithModel(
                  model: _model.searchTextFieldModel,
                  updateCallback: () => setState(() {}),
                  updateOnChange: true,
                  child: SearchTextFieldWidget(
                    hintPara: 'Search',
                    readOnlyStatusPara: false,
                    actionPara: () async {},
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Builder(
                    builder: (context) {
                      final listOfCountries = functions
                          .listCountriesData(_model.searchTextFieldModel
                              .searchTextFieldController.text)
                          .toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listOfCountries.length,
                        itemBuilder: (context, listOfCountriesIndex) {
                          final listOfCountriesItem =
                              listOfCountries[listOfCountriesIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'LIST_OF_COUNTRIES_Container_8ph9757i_ON_');
                              logFirebaseEvent('Container_bottom_sheet');
                              Navigator.pop(context, listOfCountriesItem);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 12.0, 12.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: SvgPicture.network(
                                        getCORSProxyUrl(
                                          valueOrDefault<String>(
                                            'https://flagcdn.com/w80/${valueOrDefault<String>(
                                              functions.allLetterLowerCase(
                                                  getJsonField(
                                                listOfCountriesItem,
                                                r'''$.alpha_2_code''',
                                              ).toString()),
                                              'ng',
                                            )}.png',
                                            'https://flagcdn.com/w80/ng.png',
                                          ),
                                        ),
                                        width: 30.0,
                                        height: 30.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        getJsonField(
                                          listOfCountriesItem,
                                          r'''$.name''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              letterSpacing: 1.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
