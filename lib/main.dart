import 'package:flutter/material.dart';
import 'package:project_management/config/appstrings.dart';
import 'package:project_management/screens/search/searchscren.dart';

import 'config/colors.dart';
import 'screens/home/homescreen.dart';
import 'tabs.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: 'Test commit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: kcolorBlue,
            scaffoldBackgroundColor: kBgColor).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        )
            ),
        home: const BottomMenuTabs(),
        routes: {
          BottomMenuTabs.pageId: (context) => const BottomMenuTabs(),
          HomeScreen.pageId: (context) => const HomeScreen(),
          SearchScreen.pageId: (context) => const SearchScreen(),
        },
      ),
    );
  }
}
