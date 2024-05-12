import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void showActionDialog(context,
    {final String? title,
    final String? subtitle,
    final String? confirmBtnText,
    final String? cancelBtnText,
    final VoidCallback? onConfirmPressed,
    final VoidCallback? onCancelPressed}) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      // Add a title to the dialog with the 'Logout?' text, using the textTheme to apply styles
      title: Text(
        title ?? 'Logout?',
        // style: textTheme.titleMedium!.copyWith(
        //   color: Theme.of(context).colorScheme.primary,
        //   fontWeight: FontWeight.bold,
        // ),
      ),

      content: Text(
        subtitle ?? 'Are you sure want to logout?',
        // style: textTheme.titleSmall!,
      ),
      // Add two actions to the dialog: Cancel and Logout
      actions: [
        CupertinoDialogAction(
          onPressed: onCancelPressed ?? Get.back,
          child: Text(
            cancelBtnText ?? 'Cancel',
            // style: textTheme.labelLarge!,
          ),
        ),
        CupertinoDialogAction(
          onPressed: onConfirmPressed,
          child: Text(
            confirmBtnText ?? 'Logout',
            // style: textTheme.labelLarge!.copyWith(
            //   color: Theme.of(context).colorScheme.primary,
            // ),
          ),
        ),
      ],
    ),
  );
}
