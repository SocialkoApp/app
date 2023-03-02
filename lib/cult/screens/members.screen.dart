import 'package:app/common/screens/error.screen.dart';
import 'package:app/common/screens/loading.screen.dart';
import 'package:app/common/widgets/back.widget.dart';
import 'package:app/cult/providers/cult.provider.dart';
import 'package:app/cult/widgets/member.widget.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class MembersScreen extends ConsumerWidget {
  const MembersScreen({super.key});

  static String routeName = '/cult/members';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final addUserController = TextEditingController();

    final c = ref.watch(asyncCultProvider);

    Widget separator() {
      return const SizedBox(height: 15.0);
    }

    void removeUser(String username, String firstName, String lastName) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Remove $firstName $lastName from cult?'),
          content: Text(
            'Are you sure you want to remove $firstName $lastName from this cult? All their posts will be removed and their profile picture reset.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Don\'t remove'),
            ),
            TextButton(
              onPressed: () => {
                Navigator.of(context).pop(),
                ref.read(asyncCultProvider.notifier).removeUser(username)
              },
              child: Text(
                'Remove',
                style: TextStyle(
                  color: AppAssets.colors.red,
                ),
              ),
            ),
          ],
        ),
      );
    }

    void addUser() {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            'Add New User',
            style: TextStyle(
              color: AppAssets.colors.light,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: TextField(
            controller: addUserController,
            decoration: InputDecoration(
              label: Text(
                'Username',
                style: TextStyle(color: AppAssets.colors.light),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppAssets.colors.dark,
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => {
                Navigator.of(context).pop(),
                ref
                    .read(asyncCultProvider.notifier)
                    .addUser(addUserController.text)
              },
              child: const Text('Add'),
            ),
          ],
        ),
      );
    }

    return c.when(
      loading: () => const LoadingScreen(),
      error: (err, stack) => ErrorScreen(error: err),
      data: (cult) => Scaffold(
        backgroundColor: AppAssets.colors.dark,
        body: SizedBox(
          width: width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 45.0),
                  const BackWidget(),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    height: height * 0.8,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.separated(
                        itemBuilder: (context, i) {
                          final member = cult.members![i];

                          return MemberWidget(
                            member: member,
                            isRuler: cult.role == "Ruler",
                            removeUser: () => removeUser(
                              member.member.user.username,
                              member.member.firstName,
                              member.member.lastName,
                            ),
                          );
                        },
                        separatorBuilder: (c, i) => separator(),
                        itemCount: cult.members!.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => addUser(),
          child: Icon(
            IconlyBold.addUser,
            color: AppAssets.colors.light,
          ),
        ),
      ),
    );
  }
}
