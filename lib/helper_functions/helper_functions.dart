import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperFunction {
  static Future<String> customGetImage() async {
    ImagePicker picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    if (pickedFile != null) {
      return pickedFile.path;
    }
    return '';
  }

  void openwhatsapp(context, String mob) async {
    final String whatsapp;
    mob.length == 10 ? whatsapp = "+91$mob" : whatsapp = mob;

    print(whatsapp.length);

    // whatsapp = "$mob";
    final whatsappURlAndroid =
        "whatsapp://send?phone=" + whatsapp + "&text=hello";
    // final whatappURLIOS = "https://wa.me/$whatsapp?text=${Uri.parse("hi!!")}";

    // android , web
    if (await canLaunch(whatsappURlAndroid)) {
      await launch(whatsappURlAndroid);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("whatsapp not installed!!")));
    }
  }

  void openmessage(context, String mob) async {
    final mobileno = "+91${mob.substring(mob.length - 10)}";
    final msg = 'sms:$mobileno?body=hello';
    if (await canLaunch(msg)) {
      await launch(msg);
    }
  }
}
