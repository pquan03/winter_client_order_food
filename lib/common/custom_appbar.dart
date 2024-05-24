import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:winter_food/common/sizes.dart';
import 'package:winter_food/controllers/login_controller.dart';
import 'package:winter_food/controllers/user_location_controller.dart';
import 'package:winter_food/models/login_response.dart';
import 'package:winter_food/utils/constants/colors.dart';
import 'package:winter_food/utils/constants/constants.dart';
import 'package:winter_food/utils/constants/sizes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    LoginResponse? user;
    final loginController = Get.put(LoginController());
    user = loginController.getUserInfo();
    final controller = Get.put(UserLocationController());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: WSizes.spaceBtwItems),
      height: 110.h,
      width: width,
      color: TColors.primary,
      child: Container(
        margin: const EdgeInsets.only(
            top: TSizes.defaultSpace, bottom: TSizes.defaultSpace * 0.3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundColor: kSecondary,
                  backgroundImage: NetworkImage(user?.profilePic ??
                      'https://d326fntlu7tb1e.cloudfront.net/uploads/4a4cd06e-94de-4478-8588-66eee01354d4-rice.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h, bottom: 6.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deliver to',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: TColors.secondary),
                      ),
                      Obx(
                        () => SizedBox(
                            width: width * 0.65,
                            child: Text(
                                controller.address.value == ""
                                    ? '203 W 23rd St, New York, NY 10011'
                                    : controller.address.value,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: TColors.textWhite, overflow: TextOverflow.ellipsis))),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Text(getTimeOfDay(),
                style: TextStyle(
                    color: kSecondary,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    shadows: const [
                      BoxShadow(
                          color: kGrayLight,
                          offset: Offset(0, 0),
                          blurRadius: 5,
                          spreadRadius: 0.5)
                    ])),
          ],
        ),
      ),
    );
  }

  String getTimeOfDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 0 && hour < 12) {
      return '🌞';
    } else if (hour >= 12 && hour < 16) {
      return '🌥️';
    } else {
      return '🌙';
    }
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final controller = Get.put(UserLocationController());
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    LatLng latLng = LatLng(position.latitude, position.longitude);

    controller.setPosition(latLng);
    controller.getUserAddress(latLng);
  }
}
