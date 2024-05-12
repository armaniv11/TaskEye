import 'package:get/get.dart';
import 'package:taskeye/controllers/profile_controller.dart';
import 'package:taskeye/custom_classes/custom_button.dart';
import 'package:taskeye/custom_classes/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:taskeye/utils/app_constants.dart';
import 'package:taskeye/utils/custom_widgets/custom_textfield.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ModalProgressHUD(
          inAsyncCall: controller.isLoading.value,
          child: Scaffold(
            backgroundColor: AppConstants.appBackGroundColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: AppConstants.appBackGroundColor,
              // shadowColor: Colors.yellow,
              title: Text("Profile"),
              centerTitle: true,
            ),
            body: Form(
              key: controller.formKeyProfile,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        fillColor: AppConstants.appBackGroundColor,
                        controller: controller.phoneController,
                        width: double.maxFinite,
                        keyboardType: TextInputType.phone,
                        hintText: "Mobile Number",
                        isEnabled: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        fillColor: AppConstants.appBackGroundColor,
                        controller: controller.whatsappController,
                        width: double.maxFinite,
                        keyboardType: TextInputType.phone,
                        hintText: "Whatsapp Number",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        fillColor: AppConstants.appBackGroundColor,
                        controller: controller.nameController,
                        width: double.maxFinite,
                        keyboardType: TextInputType.name,
                        validator: (p0) => p0!.isEmpty ? "Name required" : null,
                        hintText: "Full Name",
                      ),
                    ),
                    // Spacer(),
                    InkWell(
                        onTap: controller.saveProfile,
                        child: CustomButton(
                            bgColor: Colors.yellow[800], buttonText: "Save"))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
