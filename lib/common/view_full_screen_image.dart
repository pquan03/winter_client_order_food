import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PreviewImage extends StatelessWidget {
  const PreviewImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Image.network(
        imageUrl,
        fit: BoxFit.contain,
      ),
    );
  }
}
