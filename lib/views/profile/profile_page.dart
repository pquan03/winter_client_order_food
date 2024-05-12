import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:winter_food/common/custom_container.dart';
import 'package:winter_food/constants/constants.dart';
import 'package:winter_food/views/profile/widgets/profile_app_bar.dart';
import 'package:winter_food/views/profile/widgets/user_info.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: ProfileAppbar(),
        ),
        body: SafeArea(
            child: CustomContainer(
                containerContent: Column(
          children: [
            UserInfo(
                proflePic: 'assets/images/profile.jpg',
                name: 'John Doe',
                email: 'winter@winter.com'),
            Container(
              height: 220.h,
              color: kLightWhite,
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ProfileTileSection(
                    onTap: () {},
                    title: 'My Orders',
                    icon: Ionicons.fast_food_outline,
                  ),
                  ProfileTileSection(
                    onTap: () {},
                    title: 'My Favourites Places',
                    icon: Ionicons.heart_outline,
                  ),
                  ProfileTileSection(
                    onTap: () {},
                    title: 'Review',
                    icon: Ionicons.chatbubble_outline,
                  ),
                  ProfileTileSection(
                    onTap: () {},
                    title: 'Coupons',
                    icon: MaterialCommunityIcons.tag_outline,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 220.h,
              color: kLightWhite,
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ProfileTileSection(
                    onTap: () {},
                    title: 'Shipping Address',
                    icon: SimpleLineIcons.location_pin,
                  ),
                  ProfileTileSection(
                    onTap: () {},
                    title: 'Service Center',
                    icon: AntDesign.customerservice,
                  ),
                  ProfileTileSection(
                    onTap: () {},
                    title: 'Coupons',
                    icon: MaterialIcons.rss_feed,
                  ),
                  ProfileTileSection(
                    onTap: () {},
                    title: 'Settings',
                    icon: MaterialCommunityIcons.tag_outline,
                  ),
                ],
              ),
            ),
          ],
        ))));
  }
}

class ProfileTileSection extends StatelessWidget {
  const ProfileTileSection({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: kGray,
        ),
        title: Text(
          title,
          style: TextStyle(color: kGray, fontSize: 14.sp),
        ),
        trailing: title != 'Settings'
            ? Icon(
                Icons.arrow_forward_ios,
                color: kGray,
                size: 16.sp,
              )
            : SvgPicture.asset(
                'assets/icons/usa.svg',
                width: 15.w,
                height: 25.h,
              ));
  }
}
