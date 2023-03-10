import 'package:ando_kitchen_order/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

enum TextFieldType { date, text, dropdown }

class AndoTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String fieldName;
  final bool isAutoFocus;
  final String? subTitle;
  final List<TextInputFormatter>? formatters;
  final TextEditingController controller;
  final TextInputType? inputType;
  final String? hintText;
  final bool obscureText;
  final Function()? onTap;
  final bool readOnly;
  final Widget? suffixIcon;
  final TextFieldType textFieldType;
  final Function(String)? onChanged;
  final Function(DateTime selectedDate)? selectedDate;
  final AutovalidateMode autovalidateMode;
  const AndoTextField({
    Key? key,
    this.fieldName = "",
    this.isAutoFocus = false,
    this.obscureText = false,
    this.validator,
    this.selectedDate,
    required this.controller,
    this.hintText,
    this.onTap,
    this.readOnly = false,
    this.suffixIcon,
    this.inputType,
    this.formatters,
    this.onChanged,
    this.textFieldType = TextFieldType.text,
    this.subTitle,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> showPassword = ValueNotifier(true);
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.r),
      borderSide: const BorderSide(color: AndoColors.neutral50),
    );
    return Padding(
        padding: EdgeInsets.only(bottom: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(fieldName,
              style: AndoTextStyle.textMRegular(color: AndoColors.neutral90)),
          ValueListenableBuilder(
              valueListenable: showPassword,
              builder: (BuildContext context, bool show, Widget? child) {
                return TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: onChanged,
                  autovalidateMode: autovalidateMode,
                  readOnly:
                      textFieldType == TextFieldType.dropdown ? true : readOnly,
                  inputFormatters: formatters,
                  controller: controller,
                  validator: validator,
                  keyboardType: inputType,
                  obscureText: obscureText && showPassword.value,
                  onTap: onTap,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    fillColor: Colors.white,
                    filled: true,
                    prefixIconConstraints: BoxConstraints(
                      maxHeight: 25.h,
                      minHeight: 10.h,
                      minWidth: 25.w,
                    ),
                    suffixIconConstraints: BoxConstraints(
                      maxHeight: 25.h,
                      minHeight: 25.h,
                      minWidth: 25.w,
                    ),
                    suffixIcon: obscureText == false
                        ? suffixIcon
                        : GestureDetector(
                            onTap: () {
                              showPassword.value = !showPassword.value;
                            },
                            child: const Padding(
                              padding:
                                  EdgeInsets.only(right: 14, top: 7, bottom: 7),

                              ///Todo - add the obscure icon and non-obscure
                            ),
                          ),
                    hintText: hintText ?? fieldName,
                    enabledBorder: outlineInputBorder,
                    hintStyle:
                        AndoTextStyle.textLRegular(color: AndoColors.neutral90),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14.0, vertical: 13),
                    border: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                  ),
                );
              }),
        ]));
  }
}
