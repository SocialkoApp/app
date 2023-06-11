import 'dart:io';
import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/common/widgets/back.widget.dart';
import 'package:app/organization/api/models/update_org.dto.dart';
import 'package:app/organization/providers/org.provider.dart';
import 'package:app/profile/widgets/input.widget.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/utils/org_icon.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class EditOrgScreen extends ConsumerWidget {
  const EditOrgScreen({super.key});

  static String routeName = '/org/edit';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final c = ref.watch(asyncOrgProvider);

    TextEditingController name = TextEditingController();
    TextEditingController description = TextEditingController();

    void changeIcon() async {
      final ImagePicker picker = ImagePicker();

      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: image!.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Your Icon',
            toolbarColor: AppAssets.colors.darkHighlight,
            toolbarWidgetColor: AppAssets.colors.light,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
          ),
          IOSUiSettings(
            title: 'Crop Your Icon',
            aspectRatioLockEnabled: true,
            aspectRatioPickerButtonHidden: true,
          ),
        ],
      );

      File file = File(croppedFile!.path);

      ref.read(asyncOrgProvider.notifier).updateIcon(file);
    }

    void updateOrg() async {
      final body = UpdateOrgDto(
        name: name.text,
        description: description.text,
      );

      await ref.read(asyncOrgProvider.notifier).updateOrg(body);
    }

    return c.when(
      loading: () => const LoadingScreen(),
      error: (err, stack) => ErrorScreen(error: err),
      data: (org) {
        name = TextEditingController(text: org.name);
        description = TextEditingController(text: org.description);

        return Scaffold(
          backgroundColor: AppAssets.colors.dark,
          body: SizedBox(
            width: width,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 45.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const BackWidget(),
                        TextButton(
                          onPressed: () => {
                            updateOrg(),
                            Navigator.of(context).pop(),
                          },
                          child: Text(
                            'done',
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(height * 0.4),
                      child: Image.network(
                        assignOrgIcon(org.icon),
                        height: height * 0.2,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    TextButton(
                      onPressed: () => changeIcon(),
                      child: const Text(
                        'edit organization icon',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    MeInput(controller: name, helper: 'name'),
                    const SizedBox(height: 10.0),
                    MeInput(
                      controller: description,
                      helper: 'description',
                      maxLength: 200,
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
