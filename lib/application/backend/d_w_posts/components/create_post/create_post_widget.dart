import '/application/backend/d_w_posts/components/post_composer/post_composer_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_post_model.dart';
export 'create_post_model.dart';

class CreatePostWidget extends StatefulWidget {
  const CreatePostWidget({Key? key}) : super(key: key);

  @override
  _CreatePostWidgetState createState() => _CreatePostWidgetState();
}

class _CreatePostWidgetState extends State<CreatePostWidget> {
  late CreatePostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatePostModel());

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

    return AuthUserStreamWidget(
      builder: (context) => wrapWithModel(
        model: _model.postComposerModel,
        updateCallback: () => setState(() {}),
        child: PostComposerWidget(
          postType: 'post',
          postStatus: 'published',
          authorPhoto: currentUserPhoto,
          authorFullname: currentUserDisplayName,
          photoDateTime: '${dateTimeFormat(
            'yMMMd',
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          )},${dateTimeFormat(
            'jm',
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          )}',
          componentTitle: 'Create Post',
          postCat: List.generate(random_data.randomInteger(1, 1),
              (index) => random_data.randomName(true, false)),
          postButton: () async {
            logFirebaseEvent('CREATE_POST_Container_4ud9oasv_CALLBACK');
            logFirebaseEvent('PostComposer_backend_call');

            await DwPostsRecord.collection.doc().set({
              ...createDwPostsRecordData(
                createdAt: getCurrentTimestamp,
                modifiedAt: getCurrentTimestamp,
                userRef: currentUserReference,
                postType: 'post',
                postPublishStatus: 'published',
                postTitle:
                    _model.postComposerModel.textFieldTitleController.text,
                postDescription:
                    _model.postComposerModel.textFieldPostDescController.text,
                postExcerpt: _model.postComposerModel.inputTextAreaExcerptModel
                    .textController.text,
                postMedia: _model.postComposerModel.getImagePathFromState,
              ),
              ...mapToFirestore(
                {
                  'post_categories':
                      _model.postComposerModel.choiceChipsCategoriesValues,
                },
              ),
            });
            logFirebaseEvent('PostComposer_bottom_sheet');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
