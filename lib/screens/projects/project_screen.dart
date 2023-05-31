// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_management/config/appstrings.dart';

import 'package:project_management/config/colors.dart';

import 'package:project_management/config/routes.dart';
import 'package:project_management/screens/projects/project_tabs.dart/tab_all_projects.dart';



// import '../../components/stacked_images.dart';
// import '../../config/assets.dart';
import '../../config/styles.dart';
// import '../app_projects/components/list.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});
  static const String pageId = AppRoutes.projects;

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen>
    with SingleTickerProviderStateMixin {
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
  // final List<Map<String, dynamic>> taskData = [
  //   {
  //     'title': 'App Project',
  //     'team': 'Team',
  //     'description': 'Digital Product Design',
  //     'isChecked': true,
  //     'color': kcolorBlue,
  //     'percent': 0.8,
  //     'date': 'Apr 21, 2022',
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: ktextColorBlack),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          AppStrings.projects,
          style: textStyleAppBarTitle,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: () {
              // Handle action icon button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
    //         ListView.builder(
    //   shrinkWrap: true,
    //   itemCount: taskData.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Padding(
    //       padding: const EdgeInsets.symmetric(vertical: 8),
    //       child: Container(
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(5.0), color: kColorWhite),
    //         child: Padding(
    //           padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    //           child: ListAllProjects(
    //             isChecked: taskData[index]['isChecked'],
    //             projectTitle: taskData[index]['title'],
    //             team: taskData[index]['team'],
    //             description: taskData[index]['description'],
    //             formattedDate: taskData[index]['date'],
    //             totalTasks: '${index + 5} Tasks',
    //             // stackedImages: buildStackedImages(),
    //             stackedImages: buildStackedImages(),
    //             trailingArrow: IconButton(
    //               onPressed: () {
                    
    //               },
    //               icon: const Icon(
    //                 Icons.arrow_forward_ios_rounded,
    //                 color: ktextColorGrey,
    //               ),
    //             ),
    //             onChanged: (bool? value) {
    //               // Handle checkbox state change
    //               setState(() {
    //                 taskData[index]['isChecked'] = value;
    //               });
    //             },
    //             progressColor: taskData[index]['color'],
    //             percent: taskData[index]['percent'],
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // ),
            // give the tab bar a height [can change hheight to preferred height]
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                color: ktextColorGrey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4),
                child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                    color: kBgColor,
                  ),
                  labelColor: kcolorBlue,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(text: AppStrings.ongoing),
                    Tab(text: AppStrings.all),
                    Tab(text: AppStrings.completed),
                  ],
                ),
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  TabAllProjects(),
                  TabAllProjects(),
                  TabAllProjects(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Widget buildStackedImages({
  //   TextDirection direction = TextDirection.rtl,
  // }) {
  //   const double size = 48;
  //   const double xShift = 12;
  //   final urlImages = [
  //     AppAssets.imagUrl1,
  //     AppAssets.imagUrl2,
  //     AppAssets.imagUrl3,
  //     AppAssets.imagUrl4,
  //   ];

  //   final items = urlImages.map((urlImage) => buildImage(urlImage)).toList();

  //   return StackedWidgets(
  //     direction: direction,
  //     items: [
  //       ...items,
  //       Container(
  //         width: 25, //you can also add padding if required
  //         decoration: const BoxDecoration(
  //           shape: BoxShape.circle,
  //           color: ktextColorGrey,
  //         ),
  //         child: const Center(
  //           child: Icon(
  //             Icons.add,
  //             color: kColorWhite,
  //           ),
  //         ),
  //       ),
  //     ],
  //     size: size,
  //     xShift: xShift,
  //   );
  // }

  // Widget buildImage(String urlImage) {
  //   const double borderSize = 2;

  //   return ClipOval(
  //     child: Container(
  //       padding: const EdgeInsets.all(borderSize),
  //       color: Colors.white,
  //       child: ClipOval(
  //         child: CachedNetworkImage(
  //           imageUrl: urlImage,
  //           placeholder: (context, url) =>
  //               const Center(child: CircularProgressIndicator()),
  //           errorWidget: (context, url, error) => const Icon(Icons.error),
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}


