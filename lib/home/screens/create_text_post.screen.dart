import 'package:app/common/widgets/back.widget.dart';
import 'package:app/common/widgets/markdown/editor.dart';
import 'package:app/home/providers/posts.provider.dart';
import 'package:app/profile/widgets/input.widget.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/utils/markdown/format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateTextPost extends ConsumerStatefulWidget {
  const CreateTextPost({super.key});

  static String routeName = '/create-text-post';

  @override
  ConsumerState<CreateTextPost> createState() => _CreateTextPostState();
}

class _CreateTextPostState extends ConsumerState<CreateTextPost> {
  final title = TextEditingController();
  final contentController = TextEditingController();
  String content = 'Content';

  void goBack() {
    Navigator.of(context).pop();
  }

  void createPost() async {
    goBack();
    ref.read(asyncPostsProvider.notifier).createPost(
          'Text',
          description: contentController.text,
          title: title.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppAssets.colors.dark,
      body: SizedBox(
        width: width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 45.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackWidget(),
                  TextButton(
                    onPressed: () => createPost(),
                    child: Text(
                      'Create',
                      style: TextStyle(
                        color: AppAssets.colors.primary,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                'Create Text Post',
                style: TextStyle(
                  color: AppAssets.colors.light,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: AppAssets.styles.inputBoxDecoration,
                  child: MeInput(
                    controller: title,
                    helper: 'Title',
                    maxLength: 100,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: MarkdownTextInput(
                  (String value) => setState(() => content = value),
                  content,
                  actions: MarkdownType.values,
                  controller: contentController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
