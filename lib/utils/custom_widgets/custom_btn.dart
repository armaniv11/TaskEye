import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

import 'package:taskeye/utils/app_color_utils.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.onButtonPressed,
      this.bgColor,
      this.padding,
      this.textStyle,
      this.borderRadius,
      this.isLoading = false,
      this.leadingWidget,
      this.trailingWidget});
  final dynamic text;
  final VoidCallback? onButtonPressed;
  final Color? bgColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      // margin: const EdgeInsets.only(bottom: 12),
      padding: padding ??
          const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 24,
          ),
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        color: bgColor ?? AppColorUtils.btnBgColorMain,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(borderRadius ?? 12),
        ),
      ),
      onPressed: onButtonPressed,
      child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: AppColorUtils.textLight,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (leadingWidget != null) leadingWidget!,
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              leadingWidget == null && trailingWidget == null
                                  ? 0
                                  : 12),
                      child: Text(
                        text,
                        style: textStyle ??
                            const TextStyle(
                                fontSize: 18,
                                color: AppColorUtils.textLight,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                    if (trailingWidget != null) trailingWidget!
                  ],
                )),
    );
  }
}
