import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskeye/utils/app_color_utils.dart';
import 'package:taskeye/utils/custom_widgets/custom_card.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      required this.hintText,
      this.isEnabled = true,
      this.hintStyle,
      this.maxLines = 1,
      this.prefixIcon,
      this.suffix,
      this.formatters,
      this.textAlign = TextAlign.left,
      this.borderColor,
      this.maxLength,
      this.decoration,
      this.validator,
      this.width,
      this.height,
      this.onChanged,
      this.isFilled = true,
      this.textStyle,
      this.isDense = true,
      this.suffixIcon,
      this.onSubmitted,
      this.autoValidateMode = AutovalidateMode.disabled,
      this.isObscured = false,
      this.borderRadius = 12,
      this.enableInteractiveSelection = true,
      this.isSearchField = false,
      this.isLabelShown = false,
      this.keyboardType,
      this.textAlignVertical,
      this.parentDecoration,
      this.fillColor,
      this.errorStyle});
  final bool isSearchField;
  final Widget? prefixIcon;
  final Widget? suffix;
  final TextEditingController? controller;
  final dynamic hintText;
  final bool? isEnabled;
  final double? width;
  final double? height;
  final TextStyle? hintStyle;
  final int? maxLines;
  final List<TextInputFormatter>? formatters;
  final TextAlign? textAlign;
  final int? maxLength;
  final Color? borderColor;
  final InputDecoration? decoration;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final bool? isFilled;
  final TextStyle? textStyle;
  final bool? isDense;
  final Widget? suffixIcon;
  final VoidCallback? onSubmitted;
  final AutovalidateMode? autoValidateMode;
  final bool? isObscured;
  final double? borderRadius;
  final bool? enableInteractiveSelection;
  final bool? isLabelShown;
  final TextInputType? keyboardType;
  final TextAlignVertical? textAlignVertical;
  final Decoration? parentDecoration;
  final Color? fillColor;

  final TextStyle? errorStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: TextFormField(
        textAlignVertical: textAlignVertical,
        enableInteractiveSelection: enableInteractiveSelection,
        autovalidateMode: autoValidateMode,
        onChanged: onChanged,
        validator: validator,
        controller: controller ?? TextEditingController(),
        obscureText: isObscured ?? false,
        maxLength: maxLength,
        keyboardType: keyboardType ?? TextInputType.name,
        onFieldSubmitted: (val) {
          if (onSubmitted != null) onSubmitted!();
        },
        enabled: isEnabled,
        textAlign: textAlign ?? TextAlign.start,
        style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
        maxLines: maxLines,
        inputFormatters: formatters,
        decoration: decoration ??
            InputDecoration(
                hintText: hintText,
                label: isLabelShown ?? false ? Text(hintText ?? "") : null,
                // label: Text(hintText),
                hintStyle: hintStyle ??
                    Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColorUtils.textDark.withOpacity(0.7)),
                counterText: "",
                filled: isFilled,
                fillColor: isEnabled!
                    ? fillColor ?? AppColorUtils.textLight
                    : AppColorUtils.textLight,
                border: borderStyle(),
                isDense: isDense,
                prefixIcon:
                    isSearchField ? const Icon(Icons.search_sharp) : prefixIcon,
                suffix: suffix,
                suffixIcon: suffixIcon,
                errorStyle: errorStyle,
                disabledBorder: borderStyle(),
                enabledBorder: borderStyle(),
                focusedBorder: borderStyle()),
      ),
    );
  }

  OutlineInputBorder borderStyle() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        borderSide: const BorderSide(width: 1, color: Colors.transparent));
  }
}
