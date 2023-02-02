import 'package:app/home/api/map_profile.util.dart';
import 'package:app/home/api/models/post.response.dart';
import 'package:app/home/widgets/feed_text.widget.dart';
import 'package:app/home/widgets/header.widget.dart';
import 'package:app/home/widgets/post/image_post.widget.dart';
import 'package:app/home/widgets/post/text_post.widget.dart';
import 'package:app/profile/api/models/profile.response.dart';
import 'package:app/profile/api/models/profile_picture.response.dart';
import 'package:app/utils/api/api.dart';
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
      posts = mapPosts(p);
    });
  }

  String assignProfilePicture(ProfilePicture? pfp) {
    if (pfp == null) {
      return 'https://cdn.socialko.cc/assets/default_pfp.png';
    }

    return pfp.url;
  }

  Widget separator() {
    return const SizedBox(height: 15.0);
  }

  Widget postBuilder(i) {
    final post = posts[i];

    return post.type == "Image" ? ImagePost(post: post) : TextPost(post: post);
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
            pfp: assignProfilePicture(profile?.profilePicture),
            name: '${profile?.firstName} ${profile?.lastName}',
            cult: '${profile?.cult?.cult?.name}',
            role: '${profile?.cult?.role}',
          ),
          const FeedText(),
          SizedBox(
            height: height * 0.75,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
