import 'dart:io';

import 'package:app/common/widgets/back.widget.dart';
import 'package:app/home/api/models/create_post.dto.dart';
import 'package:app/home/api/models/image.response.dart';
import 'package:app/home/providers/posts.provider.dart';
import 'package:app/profile/widgets/input.widget.dart';
import 'package:app/utils/api/api.client.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CreateImagePost extends ConsumerStatefulWidget {
  const CreateImagePost({super.key});

  static String routeName = '/create-image-post';

  @override
  ConsumerState<CreateImagePost> createState() => _CreateImagePostState();
}

class _CreateImagePostState extends ConsumerState<CreateImagePost> {
  final description = TextEditingController();

  CroppedFile? selectedImage;

  @override
  void initState() {
    super.initState();
  }

  void uploadImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: image!.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Your Profile Picture',
          toolbarColor: AppAssets.colors.darkHighlight,
          toolbarWidgetColor: AppAssets.colors.light,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Crop Your Profile Picture',
        ),
      ],
    );

    setState(() {
      selectedImage = croppedImage;
    });
  }

  void goBack() {
    Navigator.of(context).pop();
  }

  void createPost() async {
    File file = File(selectedImage!.path);

    goBack();
    ref.read(asyncPostsProvider.notifier).createPost(
          'Image',
          description: description.text,
          file: file,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                'Create Image Post',
                style: TextStyle(
                  color: AppAssets.colors.light,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: selectedImage == null
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppAssets.colors.darkHighlight,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        height: MediaQuery.of(context).size.width * 0.9,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Center(
                          child: GestureDetector(
                            onTap: () => uploadImage(),
                            child: Icon(
                              IconlyLight.plus,
                              size: 70.0,
                              color: AppAssets.colors.lightHighlight,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () => uploadImage(),
                        child: Image.asset(selectedImage!.path),
                      ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: AppAssets.styles.inputBoxDecoration,
                  child: MeInput(
                    controller: description,
                    helper: 'Description',
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
