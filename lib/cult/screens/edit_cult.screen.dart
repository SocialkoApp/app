import 'dart:io';
import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/common/widgets/back.widget.dart';
import 'package:app/cult/api/models/update_cult.dto.dart';
import 'package:app/cult/providers/cult.provider.dart';
import 'package:app/profile/widgets/input.widget.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/utils/cult_icon.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class EditCultScreen extends ConsumerWidget {
  const EditCultScreen({super.key});

  static String routeName = '/edit_cult';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final c = ref.watch(asyncCultProvider);

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

      ref.read(asyncCultProvider.notifier).updateIcon(file);
    }

    void updateCult() async {
      final body = UpdateCultDto(
        name: name.text,
        description: description.text,
      );

      await ref.read(asyncCultProvider.notifier).updateCult(body);
    }

    return c.when(
      loading: () => const LoadingScreen(),
      error: (err, stack) => ErrorScreen(error: err),
      data: (cult) {
        name = TextEditingController(text: cult.name);
        description = TextEditingController(text: cult.description);

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
                            updateCult(),
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
                        assignCultIcon(cult.icon),
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
