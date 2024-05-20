import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:winter_food/utils/constants/colors.dart';

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
          color: TColors.grey,
        ),
        title: Text(title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16.sp,
                )),
        trailing: title != 'Settings'
            ? Icon(
                Icons.arrow_forward_ios,
                color: TColors.grey,
                size: 16.sp,
              )
            : SvgPicture.asset(
                'assets/icons/usa.svg',
                width: 15.w,
                height: 25.h,
              ));
  }
}
