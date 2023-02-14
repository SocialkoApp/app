import 'dart:io';

import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/common/widgets/back.widget.dart';
import 'package:app/profile/providers/me.provider.dart';
import 'package:app/utils/api/api.dart';
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

    void changeProfilePicture() async {
      final ImagePicker picker = ImagePicker();

      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      CroppedFile? croppedFile = await ImageCropper().cropImage(
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

      File file = File(croppedFile!.path);

      ref.read(asyncMeProvider.notifier).updateProfilePicture(file);
    }

    return profile.when(
      loading: () => const LoadingScreen(),
      error: (err, stack) => ErrorScreen(error: err),
      data: (p) => Scaffold(
        backgroundColor: AppAssets.colors.dark,
        body: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 45.0),
                const BackWidget(),
                const SizedBox(height: 20.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(height * 0.4),
                  child: Image.network(
                    assignProfilePicture(p.profilePicture),
                    height: height * 0.2,
                  ),
                ),
                TextButton(
                  onPressed: () => changeProfilePicture(),
                  child: const Text(
                    'Edit Profile Picture',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  '${p.firstName} ${p.lastName}',
                  style: TextStyle(
                    color: AppAssets.colors.light,
                    fontWeight: FontWeight.bold,
                    fontSize: 36.0,
                  ),
                ),
                Text(
                  '@${p.user.username}',
                  style: TextStyle(
                    color: AppAssets.colors.light,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  p.bio!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppAssets.colors.lightHighlight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
