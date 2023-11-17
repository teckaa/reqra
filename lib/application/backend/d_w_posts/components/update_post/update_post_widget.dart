import '/application/backend/d_w_posts/components/post_composer/post_composer_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'update_post_model.dart';
export 'update_post_model.dart';

class UpdatePostWidget extends StatefulWidget {
  const UpdatePostWidget({
    Key? key,
    this.recordRef,
  }) : super(key: key);

  final DocumentReference? recordRef;

  @override
  _UpdatePostWidgetState createState() => _UpdatePostWidgetState();
}

class _UpdatePostWidgetState extends State<UpdatePostWidget> {
  late UpdatePostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdatePostModel());

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

    return StreamBuilder<DwPostsRecord>(
      stream: DwPostsRecord.getDocument(widget.recordRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: Container(
              width: 1100.0,
              child: ShimmerCardWidget(
                heightPara: 700,
              ),
            ),
          );
        }
        final containerPostRefDwPostsRecord = snapshot.data!;
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(),
          child: StreamBuilder<UsersRecord>(
            stream:
                UsersRecord.getDocument(containerPostRefDwPostsRecord.userRef!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: Container(
                    width: 1100.0,
                    child: ShimmerCardWidget(
                      heightPara: 700,
                    ),
                  ),
                );
              }
              final containerUserRefUsersRecord = snapshot.data!;
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: wrapWithModel(
                  model: _model.postComposerModel,
                  updateCallback: () => setState(() {}),
                  child: PostComposerWidget(
                    postType: 'post',
                    postTitle: containerPostRefDwPostsRecord.postTitle,
                    postDesc: containerPostRefDwPostsRecord.postDescription,
                    postPhoto: containerPostRefDwPostsRecord.postMedia,
                    authorPhoto: containerUserRefUsersRecord.photoUrl,
                    authorFullname: containerUserRefUsersRecord.displayName,
                    photoDateTime: '${dateTimeFormat(
                      'yMMMd',
                      containerPostRefDwPostsRecord.createdAt,
                      locale: FFLocalizations.of(context).languageCode,
                    )},${dateTimeFormat(
                      'jm',
                      containerPostRefDwPostsRecord.createdAt,
                      locale: FFLocalizations.of(context).languageCode,
                    )}',
                    componentTitle: 'Update Post',
                    postCat: containerPostRefDwPostsRecord.postCategories,
                    postButton: () async {
                      logFirebaseEvent(
                          'UPDATE_POST_Container_534kpz5n_CALLBACK');
                      logFirebaseEvent('PostComposer_backend_call');

                      await containerPostRefDwPostsRecord.reference.update({
                        ...createDwPostsRecordData(
                          postTitle: _model
                              .postComposerModel.textFieldTitleController.text,
                          postDescription: _model.postComposerModel
                              .textFieldPostDescController.text,
                          postExcerpt: _model.postComposerModel
                              .inputTextAreaExcerptModel.textController.text,
                          postMedia:
                              _model.postComposerModel.getImagePathFromState,
                        ),
                        ...mapToFirestore(
                          {
                            'post_categories': _model
                                .postComposerModel.choiceChipsCategoriesValues,
                          },
                        ),
                      });
                      logFirebaseEvent('PostComposer_bottom_sheet');
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
