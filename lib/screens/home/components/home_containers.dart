import 'package:flutter/material.dart';

import '../../../config/size_config.dart';

class CustomContainer extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const CustomContainer({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: getProportionateScreenWidth(12)),
            Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(height: getProportionateScreenWidth(18)),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
             SizedBox(height: getProportionateScreenWidth(12)),
          ],
        ),
      ),
    );
  }
}
