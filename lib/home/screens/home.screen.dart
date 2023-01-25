import 'package:app/home/widgets/header.widget.dart';
import 'package:app/profile/api/models/profile.response.dart';
import 'package:app/utils/api/api.dart';
import 'package:app/auth/screens/loading.screen.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String pfp = 'https://cdn.aikenahac.com/profile_aiken.jpeg';
  String name = '';
  String cult = '';
  String role = '';

  @override
  void initState() {
    getProfileInfo();

    super.initState();
  }

  void getProfileInfo() async {
    ProfileResponse profile = ProfileResponse.fromJson(
      await API.profile.get.me(),
    );

    setState(() {
      if (profile.profilePicture != null) {
        pfp = profile.profilePicture!.url;
      }

      name = '${profile.firstName} ${profile.lastName}';

      if (profile.cult != null) {
        cult = profile.cult!.cult.name;
        role = profile.cult!.role;
      } else {
        cult = 'You\'re not in a cult';
      }
    });

    print(profile.firstName);
  }

  void logout() {
    API.auth.deleteToken();
    Navigator.of(context).pushReplacementNamed(
      LoadingScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.colors.dark,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40.0),
          Header(pfp: pfp, name: name, cult: cult, role: role),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Feed',
              style: TextStyle(
                fontSize: 22.0,
                color: AppAssets.colors.light,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
