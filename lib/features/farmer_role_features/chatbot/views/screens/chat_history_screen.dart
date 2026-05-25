import 'package:aqua_culture_app/features/common_role_features/common/views/widgets/custom_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatHistoryScreen extends StatelessWidget {
  const ChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Chat History'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.r),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            ChatHistoryCardWidget(),
            ChatHistoryCardWidget(),
            ChatHistoryCardWidget(),
          ],
        ),
      ),
    );
  }
}

class ChatHistoryCardWidget extends StatelessWidget {
  const ChatHistoryCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'Give me random names..',
                    style: TextStyle(fontSize: 18.sp, fontWeight: .w500),
                  ),
                  Text(
                    'How about the name "Seraphina Grace"? It exudes elegance and',
                    style: TextStyle(fontSize: 14.sp, fontWeight: .w400),
                  ),
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
          ],
        ),
      ),
    );
  }
}
