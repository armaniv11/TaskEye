import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CustomLodingShimer extends StatelessWidget {
  const CustomLodingShimer({
    Key? key,
    this.width,
  }) : super(key: key);
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade600,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Container(
        height: 180,
        width: width ?? Get.width * 0.9,
        decoration: BoxDecoration(
            color: Colors.grey[800],

            // border: Border.all(),
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
