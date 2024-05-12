import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskeye/utils/app_color_utils.dart';
import 'package:taskeye/utils/custom_widgets/custom_btn.dart';

class CustomDateSelect extends StatelessWidget {
  const CustomDateSelect(
      {super.key,
      required this.child,
      this.selectedDate,
      required this.onDateSelected});
  final Widget child;
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      splashColor: AppColorUtils.btnBgColorMain,
      onTap: () async {
        await showCupertinoModalPopup<void>(
          context: context,
          builder: (_) {
            final size = MediaQuery.of(context).size;
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              height: size.height * 0.40,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: CupertinoDatePicker(
                      initialDateTime: selectedDate,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (value) {
                        onDateSelected(value);
                        // date = value;
                        //   setState(() {});
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      text: "Save",
                      onButtonPressed: Get.back,
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
      child: child,
    );
  }
}
