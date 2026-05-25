import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget inputFormFieldWidget({
  required String title,
  required bool isRequired,
  bool isObsecure = false,
  required String hintText,
  IconData? prefixIcon,
  IconData? suffixIcon,
  VoidCallback? onSuffixTap,
  required String? Function(String?)? inputValidator,
  required TextEditingController controller,
  TextInputType keyboardType = .text,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RichText(
        text: TextSpan(
          text: title,
          style: TextStyle(
            color: AppColors.greyText,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          children: [
            if (isRequired)
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
      SizedBox(height: 8.h),
      TextFormField(
        obscureText: isObsecure,
        keyboardType: keyboardType,
        controller: controller,
        validator: inputValidator,
        autovalidateMode: .onUserInteraction,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          prefixIconColor: AppColors.greyIcon,
          suffixIcon: suffixIcon != null
              ? GestureDetector(onTap: onSuffixTap, child: Icon(suffixIcon))
              : null,
          suffixIconColor: AppColors.appThemeColor,
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.greyIcon,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.greyIcon, width: 1),
            borderRadius: BorderRadius.circular(6.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.greyIcon, width: 1),
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
      ),
      SizedBox(height: 16.h),
    ],
  );
}
