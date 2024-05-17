import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:winter_food/constants/constants.dart';
import 'package:winter_food/models/login_response.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.user,
  });

  final LoginResponse user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      height: height * 0.08,
      color: kOffWhite,
      width: width,
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundColor: kGrayLight,
            backgroundImage: NetworkImage(user.profilePic!),
          ),
          SizedBox(width: 10.w),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(user.username ?? 'winter',
                      style: TextStyle(
                          color: kGray,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold)),
                  // Email
                  Text(user.email ?? 'winter@winter.com',
                      style: TextStyle(
                        color: kGray,
                        fontSize: 14.sp,
                      )),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Feather.edit_2,
                  color: kGray,
                  size: 20.sp,
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
