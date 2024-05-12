import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:winter_food/constants/constants.dart';
import 'package:winter_food/views/auth/login.dart';

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kOffWhite,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Get.offAll(() => const LoginPage());
        },
        child: Icon(AntDesign.logout, size: 18.h),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Row(children: [
            SvgPicture.asset(
              'assets/icons/usa.svg',
              width: 15.h,
              height: 25.h,
            ),
            SizedBox(width: 5.w),
            Container(
              height: 25.h,
              width: 1.w,
              color: kGrayLight,
            ),
            SizedBox(width: 5.w),
            Text(
              'EN',
              style: TextStyle(
                color: kGray,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            )
          ]),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
            onTap: () {},
            child: Icon(
              AntDesign.setting,
              size: 18.h,
            )),
        SizedBox(width: 10.w),
      ],
    );
  }
}
