import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taskeye/providers/domain/repository_impl/auth_repo_impl.dart';
import 'package:taskeye/utils/route_constants.dart';

class AuthController extends GetxController {
  final AuthRepoImpl authRepoImpl = AuthRepoImpl();
  RxBool isLoading = false.obs;
  RxBool isOTPScreen = false.obs;
  RxString phoneNumber = ''.obs;

  late String verificationId;
  RxString smsCode = "".obs;

  Future<void> sendOtp() async {
    try {
      isLoading.value = true;
      authRepoImpl
          .sendOtp(phoneNumber.value)
          .then((value) => isOTPScreen.value = true);
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyOTP() async {
    try {
      isLoading.value = true;
      await authRepoImpl
          .verifyOTP(smsCode.value)
          .then((value) => Get.offAllNamed(AppRouteConstants.profileRoute));
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //   checkAccountExists(mob) async {
  //   FirebaseFirestore.instance.collection('Users').doc(mob).get().then((value) {
  //     if (value.exists) {
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) => const ChannelHomePage()));
  //     } else {
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) => const AddUpdateUser()));
  //     }
  //     //   Navigator.pushReplacement(
  //     //       context, MaterialPageRoute(builder: (context) => Home()));
  //   });
  // }
}
