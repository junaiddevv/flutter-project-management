import 'package:flutter/material.dart';

import 'package:project_management/config/routes.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const String pageId = AppRoutes.settings;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(child: Text('jch',style: TextStyle(color: Colors.black),))
    );
  }
}
