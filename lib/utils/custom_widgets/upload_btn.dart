import 'package:flutter/material.dart';

class SecondaryBtn extends StatelessWidget {
  const SecondaryBtn(
      {super.key,
      required this.title,
      this.onButtonPressed,
      this.bgColor,
      this.icon,
      this.textStyle,
      this.textColor = Colors.black});
  final dynamic title;
  final VoidCallback? onButtonPressed;
  final Color? bgColor;
  final Color textColor;
  final Widget? icon;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        if (onButtonPressed != null) onButtonPressed!();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => bgColor ?? Colors.green.shade800)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          if (icon != null)
            const SizedBox(
              width: 4,
            ),
          Text(
            title,
            style: textStyle ??
                TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
