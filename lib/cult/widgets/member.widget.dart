import 'package:app/cult/api/models/member_model.dart';
import 'package:app/profile/screens/profile.screen.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/utils/pfp.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class MemberWidget extends StatelessWidget {
  const MemberWidget({
    super.key,
    required this.member,
    required this.isRuler,
    required this.removeUser,
  });

  final MemberModel member;
  final bool isRuler;
  final Function() removeUser;

  @override
  Widget build(BuildContext context) {
    String subtitle() {
      return '@${member.member.user.username} • [${member.role}]';
    }

    void openProfile(String username) {
      Navigator.pushNamed(
        context,
        ProfileScreen.routeName,
        arguments: ProfileArgs(username),
      );
    }

    return GestureDetector(
      onTap: () => openProfile(member.member.user.username),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network(
                  assignProfilePicture(member.member.profilePicture),
                  width: 55.0,
                  height: 55.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${member.member.firstName} ${member.member.lastName}',
                    style: TextStyle(
                      fontSize: 14,
                      color: member.role == "Ruler"
                          ? AppAssets.colors.red
                          : AppAssets.colors.light,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle(),
                    style: TextStyle(
                      fontSize: 12,
                      color: AppAssets.colors.lightHighlight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (member.role == "Ruler")
            IconButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppAssets.colors.darkHighlight,
                  content: Center(
                    heightFactor: 1,
                    child: Text(
                      'This user is the ruler',
                      style: TextStyle(color: AppAssets.colors.light),
                    ),
                  ),
                ),
              ),
              icon: Icon(
                IconlyBold.star,
                color: AppAssets.colors.lightHighlight,
              ),
            ),
          if (isRuler && member.role != "Ruler")
            IconButton(
              onPressed: removeUser,
              icon: Icon(
                Icons.close,
                color: AppAssets.colors.lightHighlight,
              ),
            ),
        ],
      ),
    );
  }
}
