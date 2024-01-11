import 'package:flutter/material.dart';
import 'package:gym/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final Widget? label;
  final bool obscured;
  final String? helperText;
  final formkey;
  final bool? enabled;
  final Color? fillColor;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final Function(String val)? onChanged;
  final String? Function(String? val)? validator;
  final TextInputType? inputType;
  final bool showSuffix;
  final Function()? toggleVisibility;
  const CustomTextField(
      {super.key,
      this.hintText,
      this.labelText,
      this.obscured =false,
      this.formkey,
      this.fillColor,
      this.prefixIcon,
      this.controller,
      this.textInputAction =TextInputAction.next,
      this.onChanged,
      this.validator,
      this.inputType,
      this.showSuffix =false,
        this.enabled =true, this.helperText, this.toggleVisibility, this.label,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onFieldSubmitted: (value){},
      validator: validator ??
            (value) {
          if (value == null || value.isEmpty) {
            return 'Please fill field';
          }
          return null;
        },
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor.withOpacity(0.4))),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor.withOpacity(0.4))
        ),
        enabled: enabled ?? false,
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        label: label,
        suffixIcon: showSuffix
          ? IconButton(onPressed: toggleVisibility
            , icon: Icon(
              obscured? Icons.visibility_off
                  :Icons.visibility,
              color: kPrimaryColor,
            ))
            : const SizedBox()
      ),
    );
  }
}
