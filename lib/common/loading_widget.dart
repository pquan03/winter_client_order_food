import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:winter_food/constants/constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: EdgeInsets.only(bottom: 200),
        child: LottieBuilder.asset('assets/anime/delivery.json'),
      ),
    );
  }
}
