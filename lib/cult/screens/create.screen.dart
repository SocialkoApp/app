import 'dart:io';

import 'package:app/common/widgets/back.widget.dart';
import 'package:app/profile/providers/me.provider.dart';
import 'package:app/profile/widgets/input.widget.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CreateCultScreen extends ConsumerStatefulWidget {
  const CreateCultScreen({super.key});

  static String routeName = '/create-cult';

  @override
  ConsumerState<CreateCultScreen> createState() => _CreateCultScreenState();
}

class _CreateCultScreenState extends ConsumerState<CreateCultScreen> {
  final name = TextEditingController();
  final description = TextEditingController();

  File file = File('assets/logo.png');

  @override
  void initState() {
    super.initState();
  }

  void selectIcon() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image!.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'choose an icon',
          toolbarColor: AppAssets.colors.darkHighlight,
          toolbarWidgetColor: AppAssets.colors.light,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'choose an icon',
          aspectRatioLockEnabled: true,
          aspectRatioPickerButtonHidden: true,
        ),
      ],
    );

    setState(() => file = File(croppedFile!.path));
  }

  void createCult() async {
    await ref
        .read(asyncMeProvider.notifier)
        .createCult(name.text, description.text, file);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
                        createCult(),
                        Navigator.of(context).pop(),
                      },
                      child: Text(
                        'create',
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
                  child: Image.asset(
                    file.path,
                    height: height * 0.2,
                  ),
                ),
                const SizedBox(height: 15.0),
                TextButton(
                  onPressed: () => selectIcon(),
                  child: const Text(
                    'set organization icon',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                MeInput(
                  controller: name,
                  helper: 'name',
                  maxLength: 16,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[A-Za-z0-9_.-]'),
                    ),
                  ],
                ),
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
  }
}
