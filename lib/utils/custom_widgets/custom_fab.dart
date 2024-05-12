import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskeye/utils/app_color_utils.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({
    Key? key,
    this.widget,
    this.icon,
    required this.text,
    this.padding,
    required this.onPressed,
  }) : super(key: key);
  final Widget? widget;
  final Icon? icon;
  final dynamic text;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        backgroundColor: Colors.transparent,
        extendedPadding: EdgeInsets.zero,
        elevation: 8,
        onPressed: onPressed,
        label: Container(
          padding: padding ?? EdgeInsets.zero,
          // height: 60,
          width: Get.width,
          decoration: BoxDecoration(
              color: AppColorUtils.btnBgColorMain,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: widget ??
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: Text(
                      text ?? "Add Product",
                      style: context.textTheme.titleMedium!
                          .copyWith(color: AppColorUtils.textLight),
                    )),
                    if (icon != null) icon!
                  ],
                ),
          ),
        ));
  }
}
