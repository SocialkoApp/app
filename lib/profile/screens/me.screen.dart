import 'dart:io';
import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/common/widgets/back.widget.dart';
import 'package:app/profile/api/models/update_profile.dto.dart';
import 'package:app/profile/providers/me.provider.dart';
import 'package:app/profile/widgets/input.widget.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/utils/pfp.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class MeScreen extends ConsumerWidget {
  const MeScreen({super.key});

  static String routeName = '/me';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final profile = ref.watch(asyncMeProvider);

    TextEditingController firstName = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController bio = TextEditingController();

    void changeProfilePicture() async {
      final ImagePicker picker = ImagePicker();

      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: image!.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'crop your profile picture',
            toolbarColor: AppAssets.colors.darkHighlight,
            toolbarWidgetColor: AppAssets.colors.light,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
          ),
          IOSUiSettings(
            title: 'crop your profile picture',
            aspectRatioLockEnabled: true,
            aspectRatioPickerButtonHidden: true,
          ),
        ],
      );

      File file = File(croppedFile!.path);

      ref.read(asyncMeProvider.notifier).updateProfilePicture(file);
    }

    void updateProfile() async {
      final body = UpdateProfileDto(
        firstName: firstName.text,
        lastName: lastName.text,
        bio: bio.text,
      );

      await ref.read(asyncMeProvider.notifier).updateProfile(body);
    }

    return profile.when(
      loading: () => const LoadingScreen(),
      error: (err, stack) => ErrorScreen(error: err),
      data: (p) {
        firstName = TextEditingController(text: p.firstName);
        lastName = TextEditingController(text: p.lastName);
        bio = TextEditingController(text: p.bio);

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
                            updateProfile(),
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
                        assignProfilePicture(p.profilePicture),
                        height: height * 0.2,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Text(
                      '@${p.user.username}',
                      style: TextStyle(
                        color: AppAssets.colors.light,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () => changeProfilePicture(),
                      child: const Text(
                        'edit profile picture',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    MeInput(controller: firstName, helper: 'first name'),
                    const SizedBox(height: 10.0),
                    MeInput(controller: lastName, helper: 'last name'),
                    const SizedBox(height: 20.0),
                    MeInput(
                      controller: bio,
                      helper: 'bio',
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
