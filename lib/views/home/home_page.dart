// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:winter_food/common/custom_appbar.dart';
import 'package:winter_food/common/custom_container.dart';
import 'package:winter_food/constants/constants.dart';
import 'package:winter_food/views/home/widgets/category_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimary,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(130.h), child: const CustomAppBar()),
        body: SafeArea(
            child: CustomContainer(
                containerContent: Column(
          children: [
            CategoryList(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nearby Restaurants',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: Icon(
                      AntDesign.appstore1,
                      color: kSecondary,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ))));
  }
}
