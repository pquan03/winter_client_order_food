import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCustom extends StatelessWidget {
  const ShimmerCustom({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.grey[300]!,
          Colors.grey[100]!,
          Colors.grey[300]!,
        ],
        stops: const [0.1, 0.5, 0.9],
      ),
      child: child,
    );
  }
}
