import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:taskeye/controllers/auth_controller.dart';
import 'package:taskeye/custom_classes/custom_button.dart';
import 'package:taskeye/screens/auth/confirm_otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskeye/utils/app_constants.dart';
import 'package:taskeye/utils/image_constants.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        child: Obx(() => controller.isOTPScreen.value
            ? const ConfirmOtpPage()
            : const RegisterPagePhone()),
      ),
    );
  }
}

class RegisterPagePhone extends GetView<AuthController> {
  const RegisterPagePhone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget title = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          ImageConstants.logo,
          height: size.height / 4,
          width: size.width / 2,
        ),
        Center(
          child: Text('Welcome To',
              style: GoogleFonts.pacifico(color: Colors.grey, fontSize: 24)),
        ),
        const Text(
          AppConstants.appName,
          style: TextStyle(
              color: Colors.grey,
              fontSize: 44.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
              shadows: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                )
              ]),
        ),
      ],
    );

    return Scaffold(
      // backgroundColor: Colors.yellow,
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.s
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.1,
                ),
                title,
                SizedBox(
                  height: size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IntlPhoneField(
                      autofocus: true,
                      invalidNumberMessage: 'Invalid Phone Number!',
                      textAlignVertical: TextAlignVertical.center,
                      style: const TextStyle(fontSize: 25),
                      onChanged: (phone) {
                        controller.phoneNumber.value = phone.completeNumber;
                        print(phone.completeNumber);
                        print(controller.phoneNumber.value);
                      },
                      initialCountryCode: 'IN',
                      flagsButtonPadding: const EdgeInsets.only(right: 10),
                      showDropdownIcon: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        // filled: true,
                        // fillColor: AppColorUtils.textLight.withOpacity(0.7)
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    buttonText: "Confirm and Proceed",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
