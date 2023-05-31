import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';


import '../projects/project_tabs.dart/tab_all_projects.dart';
import 'app_project.dart';
import 'components/File_screen.dart';
// import 'components/all_cards.dart';

class AppProjectScreen extends StatefulWidget {
  const AppProjectScreen({super.key});

  @override
  State<AppProjectScreen> createState() => _AppProjectScreenState();
}

class _AppProjectScreenState extends State<AppProjectScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Color.fromARGB(255, 245, 240, 240),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white12,
        leading:const Icon(
          Icons.arrow_back_sharp,
          color: Colors.black,
        ),
        title:const Center(
          child: Text(
            'Project',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: const [
          Icon(
            Icons.more_vert_rounded,
            color: Colors.black,
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Column(
        children: [
           AppProjext(),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color: Colors.white70,
                ),
              ),
              child: ButtonsTabBar(
                labelSpacing: 100,
                backgroundColor: Colors.white,
                unselectedBackgroundColor: Colors.grey[300],
                labelStyle: TextStyle(
                    color: Colors.blue[900], fontWeight: FontWeight.bold),
                unselectedLabelStyle:const TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
                borderWidth: 0,
                elevation: 0.1,
                //  unselectedBorderColor: Colors.blue[600],
                radius: 7,
                contentPadding:const EdgeInsets.symmetric(horizontal: 25),
                //buttonMargin: EdgeInsets.symmetric(horizontal: 20),
                controller: _tabController,
                tabs:const [
                  Tab(
                    text: ' Task-List ',
                  ),
                  Tab(text: '    File    '),
                  Tab(text: 'Completed'),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children:const [
                TabAllProjects(),
                FileScreen()
               
              ],
            ),
          )
        ],
      ),
    );
  }
}







