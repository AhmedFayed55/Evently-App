import 'package:evently_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.isObscure,
    required this.prefixIconImage,
    this.suffixIcon,
    this.keyboard,
    this.validator,
  });

  final String hintText;
  final String prefixIconImage;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool? isObscure;
  final TextInputType? keyboard;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      autovalidateMode: AutovalidateMode.always,
      obscureText: isObscure ?? false,
      keyboardType: keyboard,
      obscuringCharacter: "*",
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSecondary,
            width: 1.4,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.red, width: 1.4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSecondary,
            width: 1.4,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSecondary,
            width: 1.4,
          ),
        ),
        hintStyle: Theme.of(context).textTheme.labelSmall,
        hintText: hintText,
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SvgPicture.asset(prefixIconImage),
        ),
        suffixIcon: suffixIcon,
        prefixIconConstraints: BoxConstraints(maxHeight: 30, maxWidth: 60),
      ),
    );
  }
}
