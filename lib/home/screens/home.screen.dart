import 'package:app/home/api/models/post.response.dart';
import 'package:app/home/widgets/feed_text.widget.dart';
import 'package:app/home/widgets/header.widget.dart';
import 'package:app/profile/api/models/profile.response.dart';
import 'package:app/utils/api/api.dart';
import 'package:app/auth/screens/loading.screen.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProfileResponse? profile;
  List<PostResponse> posts = [];

  @override
  void initState() {
    super.initState();
    getProfileInfo();
    getPosts();
  }

  void getProfileInfo() async {
    ProfileResponse p = ProfileResponse.fromJson(
      await API.profile.get.me(),
    );

    setState(() {
      profile = p;
    });
  }

  void getPosts() async {
    final p = await API.home.posts.get();

    setState(() {
      posts = p.map((e) => PostResponse.fromJson(e)).toList();
    });
  }

  void logout() {
    API.auth.deleteToken();
    Navigator.of(context).pushReplacementNamed(
      LoadingScreen.routeName,
    );
  }

  String assignProfilePicture() {
    if (profile == null || profile!.profilePicture == null) {
      return 'https://cdn.socialko.cc/assets/default_pfp.png';
    }

    return profile!.profilePicture!.url;
  }

  Widget separator() {
    return const SizedBox(height: 10.0);
  }

  Widget postBuilder(i) {
    final post = posts[i];

    return Text(
      '${post.type} ${post.author.user.username}',
      style: TextStyle(
        color: AppAssets.colors.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppAssets.colors.dark,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40.0),
          Header(
            pfp: assignProfilePicture(),
            name: '${profile?.firstName} ${profile?.lastName}',
            cult: '${profile?.cult?.cult.name}',
            role: '${profile?.cult?.role}',
          ),
          const FeedText(),
          SizedBox(
            height: height * 0.7,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, i) => postBuilder(i),
                separatorBuilder: (c, i) => separator(),
                itemCount: posts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
