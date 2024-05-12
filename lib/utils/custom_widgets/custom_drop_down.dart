import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:taskeye/utils/app_color_utils.dart';
import 'package:taskeye/utils/custom_widgets/custom_card.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    this.dropDownHint,
    this.items,
    required this.onSelected,
    required this.selected,
    this.textColor,
    this.bgColor,
    this.isExpanded = false,
    // this.padding = 12,
    this.borderColor,
    this.textStyle,
    this.dropdownItems,
    this.suffixIcon,
    // this.searchMatchFn,
    this.borderRadius,
    // this.isDropdownWidth = true,
    this.labelText = '',
    this.searchHint,
    this.validator,
  }) : super(key: key);
  final String? dropDownHint;
  final List<String>? items;
  final dynamic selected;
  final Widget? suffixIcon;
  final Color? bgColor;
  final ValueChanged<String> onSelected;
  final Color? textColor;
  final bool isExpanded;
  // final double padding;
  final Color? borderColor;
  final TextStyle? textStyle;
  final List<DropdownMenuItem<String>>? dropdownItems;
  // final bool Function(DropdownMenuItem<dynamic>, String)? searchMatchFn;
  final String? searchHint;
  final double? borderRadius;
  final String labelText; //hintText
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: DropdownButtonFormField2<String>(
        hint: Text(
          dropDownHint ?? "",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColorUtils.textHint),
        ),
        decoration: InputDecoration(
            // labelText: selectedOne != null ? dropDownHint : null,
            fillColor: Colors.white,
            filled: true,
            label: Text(labelText),
            floatingLabelAlignment: FloatingLabelAlignment.center,
            isDense: false,
            contentPadding: const EdgeInsets.only(
              left: 8,
              right: 6,
              bottom: 2,
            ),
            alignLabelWithHint: false,
            suffixIcon: suffixIcon,

            // prefix: labelText.isEmpty ? null : Text(labelText),
            disabledBorder: borderStyle(),
            errorBorder: borderStyle(color: AppColorUtils.redDark),
            enabledBorder: borderStyle(),
            focusedBorder: borderStyle()),

        // buttonStyleData: ButtonStyleData(
        //   // height: 48,
        //   decoration: BoxDecoration(
        //       color: bgColor ?? AppColorUtils.dropdownBgColor,
        //       border: Border.all(
        //           color: borderColor ?? AppColorUtils.dropdownBorderColor),
        //       borderRadius: BorderRadius.circular(borderRadius ?? 12)),
        // ),

        isDense: false,
        // underline: const SizedBox(),
        onChanged: (dynamic val) {
          onSelected(val);
        },
        isExpanded: isExpanded,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        // iconEnabledColor: AppColorUtils.greyColor,
        style: textStyle ?? Theme.of(context).textTheme.bodyMedium!,
        value: selected,
        validator: validator,
        dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            // width: isDropdownWidth == true ? width : null,
            padding: null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
            ),
            elevation: 8,
            // offset: const Offset(0, -10),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all(6),
              thumbVisibility: MaterialStateProperty.all(true),
            )),

        items: dropdownItems ??
            items?.map((String item) {
              return DropdownMenuItem(
                value: item,
                child:
                    Text(item, style: Theme.of(context).textTheme.titleSmall!),
              );
            }).toList(),
      ),
    );
  }

  OutlineInputBorder borderStyle({Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        borderSide: BorderSide(
            width: 1, color: borderColor ?? color ?? AppColorUtils.textLight));
  }
}
