import 'package:flutter/material.dart';
import 'package:gym/utils/colors.dart';

class CustomButtons extends StatelessWidget {
  final String? buttonName;
  final Function? onPressed;
  final double? width;
  final Color color, textColor;
  const CustomButtons(
      {super.key,
      this.buttonName,
      this.onPressed,
      this.width,
        this.color = kPrimaryColor,
      this.textColor= Colors.white
      });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: width?? size.width *0.85,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            backgroundColor: color
          ),
          onPressed: onPressed as void Function()?,
          child: Text(
            buttonName!,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
