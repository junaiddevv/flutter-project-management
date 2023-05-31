import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:project_management/config/styles.dart';

import '../../../../config/colors.dart';
import '../../../../config/size_config.dart';

class ListAllProjects extends StatelessWidget {
  final bool isChecked;
  final String projectTitle, team, description;
  final Widget stackedImages;
  final Widget trailingArrow;
  final ValueChanged<bool?>? onChanged;
  final Color progressColor;
  final double percent;
  final String formattedDate, totalTasks;

  const ListAllProjects({
    super.key,
    required this.isChecked,
    required this.projectTitle,
    required this.team,
    required this.description,
    required this.stackedImages,
    required this.trailingArrow,
    required this.progressColor,
    required this.percent,
    required this.formattedDate,
    required this.totalTasks,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(12)),
              Text(
                projectTitle,
                style: headingStyleLarge,
              ),
              SizedBox(height: getProportionateScreenHeight(8)),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: ktextColorBlack.withOpacity(0.7),
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(16)),
              Text(
                team,
                style: const TextStyle(
                  fontSize: 16,
                  color: ktextColorBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(8)),
              stackedImages,
              SizedBox(height: getProportionateScreenHeight(8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          baseline: TextBaseline.alphabetic,
                          child: Padding(
                            padding: EdgeInsets.only(right: 4.0),
                            child: Icon(
                              Icons.calendar_month_rounded,
                              color: ktextColorGrey,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: formattedDate,
                          style: headingStyleSmall,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.scale(
                        scale: 1.0,
                        child: Checkbox(
                          side: const BorderSide(
                              width: 2.0, color: ktextColorLightGrey),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          value: isChecked,
                          onChanged: onChanged,
                          activeColor: kcolorGreen,
                        ),
                      ),
                      Text(
                        totalTasks,
                        style: headingStyleSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        CircularPercentIndicator(
          lineWidth: 8.0,
          animationDuration: 1200,
          animation: true,
          animateFromLastPercent: true,
          percent: percent,
          backgroundColor: ktextColorLightGrey.withOpacity(0.5),
          progressColor: progressColor,
          radius: 60,
          center: Text('${percent * 100}%',style: headingStyleLarge,),
        ),
      ],
    );
  }
}
