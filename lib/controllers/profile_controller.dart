import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskeye/controllers/storage_controller.dart';
import 'package:taskeye/models/user_model.dart';
import 'package:taskeye/screens/apis/firebaseapi.dart';
import 'package:taskeye/utils/route_constants.dart';
import 'package:taskeye/utils/storage_constants.dart';
import 'package:uuid/uuid.dart';

class ProfileController extends GetxController {
  final phoneController = TextEditingController();
  final whatsappController = TextEditingController();

  final nameController = TextEditingController();
  final StorageController box = StorageController();

  RxBool isLoading = false.obs;
  final formKeyProfile = GlobalKey<FormState>();

  @override
  void onReady() {
    super.onReady();
    phoneController.text = box.getData(StorageConstants.mob) ?? "";
  }

  Future<void> saveProfile() async {
    if (!formKeyProfile.currentState!.validate()) return;

    UserModel userModel = UserModel(
        fullname: nameController.text,
        mob: phoneController.text,
        whatsapp: whatsappController.text,
        uid: const Uuid().v1());
    await FirebaseApi.upsertUser(userModel).then((val) async {
      await box.saveData(StorageConstants.selfProfile, userModel.toJson());
      Get.offAllNamed(AppRouteConstants.homepageRoute);
    });
  }
}
