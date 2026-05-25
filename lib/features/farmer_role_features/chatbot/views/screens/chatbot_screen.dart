import 'package:aqua_culture_app/app/constants/app_colors.dart';
import 'package:aqua_culture_app/features/common_role_features/common/views/widgets/custom_app_bar_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBarWidget(title: 'Chat with AI'),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.r),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Center(child: Image.asset('assets/images/chatbot.png')),
                  Container(
                    width: double.maxFinite,
                    padding: .all(16.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(.circular(12.r)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.auto_awesome,
                              size: 24.r,
                              color: AppColors.green,
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              'Hello, How can I help you? ',
                              style: TextStyle(
                                color: AppColors.greyText,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Wrap(
                          spacing: 20.w,
                          children: [
                            Chip(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.r),
                                ),
                              ),
                              label: Text('Pond A'),
                              backgroundColor: AppColors.scafoldColor,
                            ),
                            Chip(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.r),
                                ),
                              ),
                              label: Text('Pond A'),
                              backgroundColor: AppColors.scafoldColor,
                            ),
                            Chip(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.r),
                                ),
                              ),
                              label: Text('Pond A'),
                              backgroundColor: AppColors.scafoldColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 40.h,
              right: 20.w,
              left: 20.w,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Type your message',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: .circular(100.r),
                        ),
                        suffix: GestureDetector(
                          onTap: () {
                            print('micccccccccc');
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                child: SafeArea(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 70.0.r,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(height: 30.h),
                                        Text(
                                          'You can ask me everything about names',
                                          textAlign: .center,
                                          style: TextStyle(fontSize: 18.sp),
                                        ),
                                        SizedBox(height: 26.h),
                                        IconButton(
                                          style: IconButton.styleFrom(
                                            shape: CircleBorder(
                                              side: BorderSide(
                                                color: AppColors.green,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                          icon: Icon(
                                            MdiIcons.microphone,
                                            size: 42.r,
                                            color: AppColors.green,
                                          ),
                                        ),
                                        SizedBox(height: 30.h),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Icon(MdiIcons.microphoneOutline, size: 24.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  IconButton(
                    style: IconButton.styleFrom(
                      padding: .zero,
                      backgroundColor: AppColors.appThemeColor,
                    ),
                    onPressed: () {},
                    icon: Icon(MdiIcons.send, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
