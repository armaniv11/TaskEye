import 'dart:io';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:taskeye/controllers/upsert_channel_controller.dart';
import 'package:taskeye/utils/app_color_utils.dart';
import 'package:taskeye/utils/app_constants.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:taskeye/utils/custom_widgets/custom_textfield.dart';

import '../helper_functions/helper_functions.dart';
import '../models/channel_model.dart';

class AddChannelBottomSheet extends StatelessWidget {
  final ChannelModel? channelModel;
  const AddChannelBottomSheet({super.key, this.channelModel});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpsertChannelController(channelModel));
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        child: SingleChildScrollView(
          child: Container(
            // height: 100,
            padding: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
                color: AppConstants.appBackGroundColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24))),
            child: Column(
              children: [
                Text(
                  "Add Channel",
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 20, color: Colors.grey[900]!)),
                ),
                SizedBox(
                  height: 28,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Divider(
                //     color: AppColorUtils.btnBgColorMain,
                //     thickness: 4,
                //   ),
                // ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: CustomTextField(
                    fillColor: AppConstants.appBackGroundColor,
                    controller: controller.channelController,
                    width: double.maxFinite,
                    keyboardType: TextInputType.text,
                    borderColor: Colors.white,
                    // maxlines: 6,
                    isDense: true,
                    isLabelShown: true,
                    hintText: "Channel Name Here ",
                    labelText: "Channel Name",
                    validator: (p0) =>
                        p0!.isEmpty ? "Channel name is required" : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 8),
                  child: Text(
                    "Channel Pic.",
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(fontSize: 16, color: Colors.grey[700]!)),
                  ),
                ),
                GetBuilder<UpsertChannelController>(
                  builder: (cont) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              shape: BoxShape.circle,
                              color: Colors.grey[200],
                              image: controller.profilePic.value != null
                                  ? DecorationImage(
                                      image: FileImage(
                                          File(controller.profilePic.value!)),
                                      fit: BoxFit.fill)
                                  : cont.networkImage == null
                                      ? const DecorationImage(
                                          image: NetworkImage(
                                              AppConstants.bgUserImageDummy))
                                      : DecorationImage(
                                          image:
                                              NetworkImage(cont.networkImage!),
                                          fit: BoxFit.fitWidth)),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: controller.setChannelImage,
                                child: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.indigo,
                                  ),
                                ),
                              )),
                        ),
                      ),
                    );
                  },
                ),
                InkWell(
                  onTap: controller.saveChannel,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      shadowColor: Colors.yellow,
                      elevation: 8,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue[900]),
                        child: Center(
                            child: Text("Create",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18))),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
