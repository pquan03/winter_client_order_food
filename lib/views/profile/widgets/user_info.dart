import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:winter_food/constants/constants.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.proflePic,
    required this.name,
    required this.email,
  });

  final String proflePic;
  final String name;
  final String email;

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
            backgroundImage: AssetImage(proflePic),
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
                  Text(name,
                      style: TextStyle(
                          color: kGray,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold)),
                  // Email
                  Text(email,
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