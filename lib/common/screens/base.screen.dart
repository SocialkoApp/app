import 'package:app/cult/screens/cult.screen.dart';
import 'package:app/home/screens/home.screen.dart';
import 'package:app/profile/screens/my_profile.screen.dart';
import 'package:app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseScreen extends ConsumerStatefulWidget {
  const BaseScreen({super.key});

  static String routeName = '/';

  @override
  ConsumerState<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends ConsumerState<BaseScreen> {
  int _selected = 0;

  final List<BottomNavigationBarItem> _items = [
    const BottomNavigationBarItem(
      icon: Icon(IconlyBold.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(IconlyBold.user3),
      label: 'Cult',
    ),
    const BottomNavigationBarItem(
      icon: Icon(IconlyBold.profile),
      label: 'Profile',
    ),
  ];

  void _onSelectItem(int i) {
    setState(() {
      _selected = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomeScreen(),
      const CultScreen(),
      const MyProfileScreen(),
    ];

    return Scaffold(
      body: pages.elementAt(_selected),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: _selected,
        selectedItemColor: AppAssets.colors.primary,
        unselectedItemColor: AppAssets.colors.lightHighlight,
        onTap: _onSelectItem,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppAssets.colors.darkHighlight,
      ),
    );
  }
}
