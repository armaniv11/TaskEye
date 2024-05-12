import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taskeye/controllers/storage_controller.dart';
import 'package:taskeye/providers/domain/repository/auth_repo.dart';
import 'package:taskeye/utils/app_constants.dart';
import 'package:taskeye/utils/storage_constants.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;
  String? phoneNo;
  final StorageController storageController = StorageController();

  @override
  Future<void> sendOtp(phoneNo) async {
    this.phoneNo = phoneNo;
    print("phoneNumber is $phoneNo");
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (phoneAuthCredential) async {},
        verificationFailed: (verificationFailed) {
          print("failed");

          throw verificationFailed;
        },
        codeSent: (verificationId, resendingToken) async {
          print("Code Sent");

          this.verificationId = verificationId;
          print(verificationId);
        },
        codeAutoRetrievalTimeout: (verificationId) async {
          // throw verificationId;
        });
  }

  @override
  Future<void> verifyOTP(String otp) async {
    print(verificationId);
    print(otp);

    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId!, smsCode: otp);
    await _auth.signInWithCredential(phoneAuthCredential).then((value) async {
      final User user = _auth.currentUser!;
      print(user.uid);
      print(user.phoneNumber);
      print("checking");
      storageController.saveData(StorageConstants.isLoggedIn, true);
      storageController.saveData(StorageConstants.userId, user.uid);
      storageController.saveData(StorageConstants.mob, user.phoneNumber);
    }).onError((error, stackTrace) => throw error!);

    // await databaseService.createProfile(widget.phoneNo).then((value) {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => IntroPage()));
    // });
    // Get.offAllNamed(AppRouteConstants.homepage);
    // HelperFunctions.saveUserLoggedInStatus(
    //     isLoggedIn: true, userid: user.uid);

    // setState(() {
    //   isLoading = false;
    // });
    if (kDebugMode) {
      print("verifying");
    }
  }
}
