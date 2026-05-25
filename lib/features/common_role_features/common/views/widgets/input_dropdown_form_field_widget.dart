import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget inputDropdownFormFieldWidget({
  required String title,
  required bool isRequired,
  required String hintText,
  // IconData? prefixIcon,
  // IconData? suffixIcon,
  // VoidCallback? onSuffixTap,
  required String? Function(String?)? inputValidator,
  required List<String> items,
  required Function(String?)? onChanged,
  String? selectedValue,
  // required TextEditingController controller,
  // TextInputType keyboardType = .text,
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

      DropdownButtonFormField(
        validator: (value) => inputValidator!(value),
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.greyIcon, width: 1),
            borderRadius: BorderRadius.circular(6.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.greyIcon, width: 1),
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        style: TextStyle(color: Colors.black, fontSize: 16.sp),
        items: [
          ...items.map((e) => DropdownMenuItem(value: e, child: Text(e))),
        ],
        onChanged: onChanged,
        initialValue: selectedValue,
      ),
      SizedBox(height: 16.h),
    ],
  );
}
