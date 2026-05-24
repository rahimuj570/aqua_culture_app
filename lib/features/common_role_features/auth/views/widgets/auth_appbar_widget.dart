import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Row(
          children: [
            Icon(Icons.arrow_back_ios, size: 20.r, color: Colors.black),

            Text(
              'Back',
              style: TextStyle(color: Colors.black, fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
