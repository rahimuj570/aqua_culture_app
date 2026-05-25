import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget dropdownButtonWidget({
  List<String> items = const [],
  String? selectedValue,
}) {
  return Container(
    height: 38.h,
    padding: .symmetric(horizontal: 4.w),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(100.r),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selectedValue,

        icon: const Icon(Icons.arrow_drop_down),
        isExpanded: true,
        borderRadius: BorderRadius.circular(15),
        dropdownColor: Colors.grey.shade100,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Center(child: Text(value)),
          );
        }).toList(),
        onChanged: (newValue) {
          // setState(() {
          //   selectedValue = newValue!;
          // });
        },
      ),
    ),
  );
}
