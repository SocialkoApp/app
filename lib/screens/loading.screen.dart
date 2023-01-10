import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  static String routeName = '/loading';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Loading'),
    );
  }
}
