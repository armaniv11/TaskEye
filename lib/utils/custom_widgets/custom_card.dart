import 'package:flutter/material.dart';


class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key, this.color, required this.child, this.borderRadius})
      : super(key: key);
  final Color? color;
  final Widget child;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(borderRadius ?? 12),
      color: color ?? Colors.white,
      elevation: 5.0,
      shadowColor: Colors.blueGrey,
      child: child,
    );
  }
}
