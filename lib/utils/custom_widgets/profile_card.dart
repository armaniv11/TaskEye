// import 'dart:io';

// import 'package:cymart/utils/image_utils.dart';
// import 'package:flutter/material.dart';

// import 'package:cymart/utils/app_color_utils.dart';
// import 'package:cymart/utils/custom_widgets/custom_card.dart';

// class ProfileCard extends StatelessWidget {
//   const ProfileCard({
//     Key? key,
//     required this.imagePath,
//     this.selectImagePressed,
//     required this.clearImagePressed,
//   }) : super(key: key);

//   final String? imagePath;
//   final VoidCallback? selectImagePressed;
//   final VoidCallback clearImagePressed;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 12, bottom: 18),
//       child: Center(
//         child: SizedBox(
//           width: 120,
//           height: 130,
//           child: Stack(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: CustomCard(
//                   child: Container(
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                         color: AppColorUtils.textLight,
//                         image: imagePath == null
//                             ? const DecorationImage(
//                                 image: AssetImage(
//                                   AppImageUtils.userDemoPic,
//                                 ),
//                                 fit: BoxFit.fill)
//                             : DecorationImage(
//                                 image: FileImage(
//                                   File(imagePath!),
//                                 ),
//                                 fit: BoxFit.fill),
//                         borderRadius: BorderRadius.circular(12)),
//                   ),
//                 ),
//               ),
//               selectImagePressed == null
//                   ? const SizedBox()
//                   : Positioned(
//                       bottom: 10,
//                       right: 10,
//                       child: InkWell(
//                         onTap: selectImagePressed,
//                         child: Container(
//                           decoration: const BoxDecoration(
//                               color: AppColorUtils.textLight,
//                               shape: BoxShape.circle),
//                           child: const Padding(
//                             padding: EdgeInsets.all(4.0),
//                             child: Icon(
//                               Icons.edit,
//                               color: AppColorUtils.iconLight,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//               if (imagePath != null)
//                 Positioned(
//                   top: 00,
//                   right: 10,
//                   child: InkWell(
//                     onTap: clearImagePressed,
//                     child: Container(
//                       decoration: const BoxDecoration(
//                           color: AppColorUtils.textLight,
//                           shape: BoxShape.circle),
//                       child: Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: Icon(
//                           Icons.cancel,
//                           color: AppColorUtils.redDark,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
