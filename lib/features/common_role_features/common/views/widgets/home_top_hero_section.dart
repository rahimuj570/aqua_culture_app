import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget homeTopHeroSection({required String image, required String name}) =>
    SafeArea(
      child: Row(
        crossAxisAlignment: .center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            height: 46.h,
            width: 46.w,
            child: Image.network(
              image,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.person),
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'Welcome back,',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Spacer(),
          Badge(
            offset: Offset(-6, 8),
            label: Text('2'),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications, size: 26.r, color: Colors.white),
            ),
          ),
        ],
      ),
    );
