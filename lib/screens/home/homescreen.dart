import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_management/config/assets.dart';
import 'package:project_management/screens/home/components/body.dart';

import '../../components/app_drawer.dart';

import '../../config/appstrings.dart';
import '../../config/routes.dart';
import '../../config/size_config.dart';
import '../../config/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String pageId = AppRoutes.home;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tabID = 1;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      drawer: const AppDrawer(),
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: false,
      appBar: _buildAppbar(),
      body: const Body(),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: true,
      leading: IconButton(
        onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        icon: const Icon(
          Icons.menu,
          size: 30,
        ),
      ),
      title: const Text(
        AppStrings.home,
        style: textStyleAppBarTitle,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: CachedNetworkImage(
            imageUrl: AppAssets.avatarUrl,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageBuilder: (context, imageProvider) => CircleAvatar(
              backgroundImage: imageProvider,
              radius: 20,
            ),
          ),
        ),
      ],
    );
  }
}
