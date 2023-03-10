import 'package:ando_kitchen_order/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum AndoButtonType { full, border, text }

class AndoButton extends StatelessWidget {
  final bool isLoading;
  final String title;
  final Function() onTap;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final AndoButtonType buttonType;
  final Widget? prefixIcon;
  const AndoButton(
      {Key? key,
      this.isLoading = false,
      required this.title,
      required this.onTap,
      this.width = double.infinity,
      this.height = 56,
      this.fontSize = 14,
      this.prefixIcon,
      this.backgroundColor = AndoColors.primaryMain,
      this.textColor = Colors.white,
      this.buttonType = AndoButtonType.full})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width.w,
      elevation: 0,
      color: buttonType == AndoButtonType.text
          ? null
          : buttonType == AndoButtonType.border
              ? Colors.white
              : backgroundColor,
      shape: RoundedRectangleBorder(
          side: buttonType == AndoButtonType.full ||
                  buttonType == AndoButtonType.text
              ? BorderSide.none
              : const BorderSide(color: AndoColors.primaryMain),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      height: height.h,
      onPressed: onTap,
      child: isLoading
          ? SizedBox(
              height: 10.h,
              width: 10.w,
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                prefixIcon != null
                    ? Container(
                        padding: EdgeInsets.only(right: 8.w),
                        child: prefixIcon,
                      )
                    : Container(),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: buttonType == AndoButtonType.border
                        ? Colors.black
                        : textColor,
                  ),
                ),
              ],
            ),
    );
  }
}
