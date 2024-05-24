import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:winter_food/common/custom_container.dart';
import 'package:winter_food/utils/constants/constants.dart';
import 'package:winter_food/controllers/login_controller.dart';
import 'package:winter_food/models/login_response.dart';
import 'package:winter_food/utils/constants/sizes.dart';
import 'package:winter_food/views/auth/login_redirect.dart';
import 'package:winter_food/views/auth/verification.dart';
import 'package:winter_food/views/profile/widgets/profile_app_bar.dart';
import 'package:winter_food/views/profile/widgets/profile_tile_seciton.dart';
import 'package:winter_food/views/profile/widgets/user_info.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginResponse? user;
    final controller = Get.put(LoginController());
    final box = GetStorage();
    String? token = box.read('token');
    if (token != null) {
      user = controller.getUserInfo();
    }

    if (token == null) {
      return const LoginRedirect();
    }

    if (user != null && user.verification == false) {
      return const VerificationPage();
    }

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
              user: user!,
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
            const SizedBox(
              height: TSizes.spaceBtwSections,
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
