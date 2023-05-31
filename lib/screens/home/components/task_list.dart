import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../config/colors.dart';
import '../../../config/size_config.dart';

class TasksList extends StatelessWidget {
  final bool isChecked;
  final String labelText;
  final Widget secondChild;
  final Widget trailingArrow;
  final ValueChanged<bool?>? onChanged;
  final Color progressColor;
  final double percent;

  const TasksList({
    super.key,
    required this.isChecked,
    required this.labelText,
    required this.secondChild,
    required this.trailingArrow,
    required this.progressColor,
    required this.percent,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.3,
          child: Checkbox(
            side: const BorderSide(width: 2.0, color: ktextColorLightGrey),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            value: isChecked,
            onChanged: onChanged,
            activeColor: kcolorGreen,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(12)),
              Text(
                labelText,
                style: TextStyle(
                  fontSize: 16,
                  color: isChecked == true ? ktextColorBlack : ktextColorGrey,
                  fontWeight: FontWeight.bold,
                  decoration: isChecked == true
                      ? TextDecoration.none
                      : TextDecoration.lineThrough,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                  secondChild,
                  Padding(
                    padding: const EdgeInsets.only(bottom:12.0),
                    child: trailingArrow,
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(8)),
              LinearPercentIndicator(
                lineHeight: 8.0,
                percent: percent,
                animationDuration: 1200,
                animation: true,
                animateFromLastPercent: true,
                backgroundColor: ktextColorLightGrey.withOpacity(0.5),
                progressColor: progressColor,
                barRadius: const Radius.circular(12),
              ),
              SizedBox(height: getProportionateScreenHeight(8)),
            ],
          ),
        ),
      ],
    );
  }
}
