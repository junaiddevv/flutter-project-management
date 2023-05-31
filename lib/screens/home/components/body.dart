import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_management/config/appstrings.dart';
import 'package:project_management/config/assets.dart';

import 'package:project_management/config/colors.dart';
import 'package:project_management/config/size_config.dart';

import 'package:project_management/config/styles.dart';
import 'package:project_management/screens/home/components/task_list.dart';
import 'package:project_management/screens/projects/project_screen.dart';

import '../../../components/stacked_images.dart';


import '../../app_projects/tabbar.dart';
import 'home_containers.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<Map<String, dynamic>> taskData = [
    {
      'title': 'Dashboard Design',
      'isChecked': true,
      'color': kcolorBlue,
      'percent': 0.8,
    },
    {
      'title': 'Mobile App Design',
      'isChecked': true,
      'color': kcolorGreen,
      'percent': 0.5,
    },
    {
      'title': 'Wireframe Design',
      'isChecked': false,
      'color': kcolorBlueLight,
      'percent': 0.3,
    },
    {
      'title': 'Mobile App Design',
      'isChecked': false,
      'color': kcolorBlue,
      'percent': 0.1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          _buildHeader(),
          _buildSubHeader(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.addTask,
                style: headingStyleLargeTwo,
              ),
              Text(
                AppStrings.allTask,
                style: headingStyleSmall,
              )
            ],
          ),
          SizedBox(height: getProportionateScreenWidth(12)),
          _buildTasks(),
        ]),
      ),
    );
  }

//HomeHeader
  Widget _buildHeader() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        AppStrings.today,
        style: headingStyleXL,
      ),
      const SizedBox(
        height: 3,
      ),
      Row(
        children: [
          const Icon(
            Icons.calendar_today,
            color: kcolorBlue,
          ),
          Text(
            AppStrings.date,
            style: headingStyleSmall.copyWith(
                color: ktextColorBlack.withOpacity(0.7)),
          )
        ],
      ),
    ]);
  }

//Sub Header
  Widget _buildSubHeader() {
    return Column(children: [
      SizedBox(height: getProportionateScreenWidth(24)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CustomContainer(
              backgroundColor: kcolorBlue,
              icon: Icons.refresh_rounded,
              text: AppStrings.ongoing,
              onPressed: () {
                // Handle container click
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProjectsScreen()));
              },
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(12)),
          Expanded(
            child: CustomContainer(
              backgroundColor: kcolorGreen,
              icon: Icons.access_time_outlined,
              text: AppStrings.inProgress,
              onPressed: () {
                 Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return const AppProjectScreen();
                          },
                      )
                      );
               
              },
            ),
          ),
          
        ],
      ),
      SizedBox(height: getProportionateScreenWidth(12)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CustomContainer(
              backgroundColor: kcolorBlueLight,
              icon: Icons.task_outlined,
              text: AppStrings.completed,
              onPressed: () {
                // Handle container click
              },
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(12)),
          Expanded(
            child: CustomContainer(
              backgroundColor: kcolorVilot,
              icon: Icons.cancel_presentation_outlined,
              text: AppStrings.cancel,
              onPressed: () {
                // Handle container click
              },
            ),
          ),
        ],
      ),
      SizedBox(height: getProportionateScreenWidth(24)),
    ]);
  }

//Tasks Lists
  Widget _buildTasks() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: taskData.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), color: kColorWhite),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: TasksList(
                isChecked: taskData[index]['isChecked'],
                labelText: taskData[index]['title'],
                secondChild: buildStackedImages(),
                trailingArrow: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ktextColorGrey,
                    size: 20,
                  ),
                ),
                onChanged: (bool? value) {
                  // Handle checkbox state change
                  setState(() {
                    taskData[index]['isChecked'] = value;
                  });
                },
                progressColor: taskData[index]['color'],
                percent: taskData[index]['percent'],
              ),
            ),
          ),
        );
      },
    );
  }

//Stacked Images
  Widget buildStackedImages({
    TextDirection direction = TextDirection.rtl,
  }) {
    const double size = 48;
    const double xShift = 12;
    final urlImages = [
      AppAssets.imagUrl1,
      AppAssets.imagUrl2,
      AppAssets.imagUrl3,
      AppAssets.imagUrl4,
    ];

    final items = urlImages.map((urlImage) => buildImage(urlImage)).toList();

    return StackedWidgets(
      direction: direction,
      items: items,
      size: size,
      xShift: xShift,
    );
  }

  Widget buildImage(String urlImage) {
    const double borderSize = 2;

    return ClipOval(
      child: Container(
        padding: const EdgeInsets.all(borderSize),
        color: Colors.white,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: urlImage,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
