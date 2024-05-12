// import 'package:cymart/utils/constants/app_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:get/utils.dart';

// class CustomText extends StatelessWidget {
//   const CustomText(
//       {super.key,
//       required this.text,
//       this.textStyle,
//       this.maxLines,
//       this.softwrap,
//       this.textAlign,
//       this.textOverflow});
//   final dynamic text;
//   final TextStyle? textStyle;
//   final int? maxLines;
//   final TextOverflow? textOverflow;
//   final bool? softwrap;
//   final TextAlign? textAlign;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text == null ? "" : AppConstants().getName(text),
//       textAlign: textAlign,
//       style: textStyle ?? context.textTheme.titleMedium,
//       maxLines: maxLines,
//       overflow: textOverflow ?? TextOverflow.ellipsis,
//       softWrap: true,
//     );
//   }
// }
