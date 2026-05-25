import 'package:aqua_culture_app/features/farmer_role_features/chatbot/views/screens/chat_history_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final bool showTrailing;
  final String? title;

  const CustomAppBarWidget({super.key, this.showTrailing = true, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(),
      ),
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_rounded),
      ),
      centerTitle: true,
      title: Text(
        title ?? '',
        style: TextStyle(fontSize: 20.sp, fontWeight: .bold),
      ),
      actions: showTrailing
          ? [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatHistoryScreen(),
                    ),
                  );
                },
                icon: Icon(MdiIcons.history, size: 26.r),
              ),
            ]
          : [],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
