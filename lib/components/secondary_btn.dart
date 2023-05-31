import 'package:flutter/material.dart';

import '../config/colors.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key? key,
    required this.primaryBtnColor,
    required this.primaryTextStyle,
    required this.btnText,
    required this.btnPress,
  }) : super(key: key);
  final Color primaryBtnColor;
  final TextStyle primaryTextStyle;
  final String btnText;
  final Function btnPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: OutlinedButton(
        onPressed: () {
          // Perform action
          btnPress();
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 1.0, color: kcolorBlue),
          backgroundColor: kBgColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          elevation: 8,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          btnText,
          style: primaryTextStyle,
        ),
      ),
    );
  }
}
