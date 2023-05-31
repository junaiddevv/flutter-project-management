import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// import 'package:project_management/screens/chat/chatscreen.dart';

import 'package:project_management/screens/home/homescreen.dart';
import 'package:project_management/screens/projects/project_screen.dart';
import 'package:project_management/screens/search/searchscren.dart';
import 'package:project_management/screens/settings/settingsscreen.dart';

import 'config/assets.dart';
import 'config/colors.dart';

class BottomMenuTabs extends StatefulWidget {
  const BottomMenuTabs({Key? key}) : super(key: key);

  static const String pageId = "Tabs";

  @override
  State<BottomMenuTabs> createState() => _BottomMenuTabsState();
}

class _BottomMenuTabsState extends State<BottomMenuTabs> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              // alignment: Alignment.center,
              child: (TabBar(
                labelColor: kcolorBlue,
                indicatorColor: Colors.transparent,
                unselectedLabelColor: Colors.transparent,
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                labelStyle: const TextStyle(
                  fontSize: 12,
                ),
                onTap: (int index) {
                  if (index != 2) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }
                },
                tabs: [
                  Tab(
                    icon: _currentIndex == 0
                        ? SvgPicture.asset(
                            AppAssets.menuHome,
                            colorFilter: const ColorFilter.mode(
                              kcolorBlue,
                              BlendMode.srcIn,
                            ),
                          )
                        : SvgPicture.asset(
                            AppAssets.menuHome,
                            colorFilter: const ColorFilter.mode(
                              kMenuInacativeColor,
                              BlendMode.srcIn,
                            ),
                          ),
                  ),
                  Tab(
                    icon: _currentIndex == 1
                        ? SvgPicture.asset(
                            AppAssets.menuSearch,
                            colorFilter: const ColorFilter.mode(
                              kcolorBlue,
                              BlendMode.srcIn,
                            ),
                          )
                        : SvgPicture.asset(
                            AppAssets.menuSearch,
                            colorFilter: const ColorFilter.mode(
                              kMenuInacativeColor,
                              BlendMode.srcIn,
                            ),
                          ),
                  ),
                  const SizedBox(
                    // Custom widget for spacing in center
                    width:
                        48, // Adjust the width according to your desired spacing
                  ),
                  Tab(
                    icon: _currentIndex == 3
                        ? SvgPicture.asset(
                            AppAssets.menuCard,
                            colorFilter: const ColorFilter.mode(
                              kcolorBlue,
                              BlendMode.srcIn,
                            ),
                          )
                        : SvgPicture.asset(
                            AppAssets.menuCard,
                            colorFilter: const ColorFilter.mode(
                              kMenuInacativeColor,
                              BlendMode.srcIn,
                            ),
                          ),
                  ),
                  Tab(
                    icon: _currentIndex == 4
                        ? SvgPicture.asset(
                            AppAssets.menuSettings,
                            colorFilter: const ColorFilter.mode(
                              kcolorBlue,
                              BlendMode.srcIn,
                            ),
                          )
                        : SvgPicture.asset(
                            AppAssets.menuSettings,
                            colorFilter: const ColorFilter.mode(
                              kMenuInacativeColor,
                              BlendMode.srcIn,
                            ),
                          ),
                  ),
                ],
              )),
            ),
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const HomeScreen(),
            const SearchScreen(),
            const ProjectsScreen(),
            Container(),
            const SettingsScreen(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          foregroundColor: kcolorBlue,
          backgroundColor: kcolorBlue,
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: kColorWhite,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
