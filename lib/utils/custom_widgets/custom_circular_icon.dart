import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCircularIcon extends StatelessWidget {
  const CustomCircularIcon({
    Key? key,
    this.bgColor = Colors.white,
    required this.icon,
    this.size = 14,
    this.iconColor = Colors.grey,
  }) : super(key: key);
  final Color? bgColor;
  final IconData icon;
  final double? size;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Center(
            child: FaIcon(
              icon,
              size: size,
              color: iconColor,
              // size: 40,
              // color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
