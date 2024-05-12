// import 'dart:io';

// import 'package:cymart/utils/app_color_utils.dart';
// import 'package:flutter/material.dart';

// class ImageCard extends StatelessWidget {
//   const ImageCard({
//     super.key,
//     required this.img,
//     required this.onClearPressed,
//   });

//   final String img;
//   final VoidCallback onClearPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ClipRRect(
//           borderRadius: BorderRadius.circular(12),
//           child: Stack(
//             children: [
//               SizedBox(
//                 height: 200,
//                 child: Image.file(File(img)),
//               ),
//               Positioned(
//                 top: 5,
//                 right: 5,
//                 child: InkWell(
//                   onTap: onClearPressed,
//                   child: Container(
//                     decoration: const BoxDecoration(
//                         color: AppColorUtils.textLight, shape: BoxShape.circle),
//                     child: Padding(
//                       padding: const EdgeInsets.all(4.0),
//                       child: Icon(
//                         Icons.cancel,
//                         color: AppColorUtils.redDark,
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           )),
//     );
//   }
// }
