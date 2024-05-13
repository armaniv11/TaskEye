import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:random_string/random_string.dart';
import 'package:taskeye/controllers/storage_controller.dart';
import 'package:taskeye/helper_functions/helper_functions.dart';
import 'package:taskeye/models/channel_model.dart';
import 'package:taskeye/screens/apis/firebaseapi.dart';
import 'package:taskeye/utils/storage_constants.dart';

class UpsertChannelController extends GetxController {
  final TextEditingController channelController = TextEditingController();
  bool isLoading = false;
  bool isPrivate = false;
  late RxnString profilePic;
  String? networkImage;
  final StorageController storageController = StorageController();
  ChannelModel? selectedChannel;

  UpsertChannelController(final ChannelModel? channelModel) {
    selectedChannel = channelModel;
  }

  void saveChannel() async {
    if (channelController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Channel Name cannot be empty!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 14.0);
      return;
    }
    String? imgUrl;

    if (profilePic.value != null) {
      final storageReference = FirebaseStorage.instance
          .ref()
          .child("channelPic/${channelController.text}");

      final uploadTask = storageReference.putFile(File(profilePic.value!));
      final downloadUrl = await uploadTask.whenComplete(() => null);
      imgUrl = await downloadUrl.ref.getDownloadURL();
    }

    await FirebaseApi()
        .upsertChannel(ChannelModel(
            channelName: channelController.text,
            isPrivate: isPrivate,
            adminId: storageController.getData(StorageConstants.mob)!,
            channelImage: imgUrl ?? networkImage,
            channelId: selectedChannel?.channelId ?? randomAlphaNumeric(6),
            createdAt: DateTime.now().millisecondsSinceEpoch))
        .then((value) {
      if (value) {
        // Navigator.of(context).pop();
        // await CustomFunctions().sendFCM(
        //     title: "New Task",
        //     body: taskController.text.toString(),
        //     fcmToken: tokensMap[selectedNUmber]);
        Get.back();

        return Fluttertoast.showToast(
            msg: "Channel has been created successfully!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green[900],
            textColor: Colors.white,
            fontSize: 14.0);
      }
    });
  }

  Future<void> setChannelImage() async {
    {
      String img = await HelperFunction.customGetImage();
      if (img.isNotEmpty) {
        profilePic.value = img;
        update();
      }
    }
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // print(widget.taskModel!.assignTo);
  //   loadData();
  // }

  void loadData() async {
    // loadMembers().then((value) {
    //   if (widget.taskModel != null) {
    //     taskController.text = widget.taskModel!.task;
    //     taskCompletionDate =
    //         CustomFunctions().formatTimestamp(widget.taskModel!.completionDate);
    //     _selectedMember = mobMap[widget.taskModel!.assignTo];
    //   }
    // });
  }

  Future loadMembers() async {
    // final allusers = await FirebaseApi.getusers();
    // for (var user in allusers) {
    //   membersMenu.add(user.fullname);
    //   membersMap[user.fullname] = user.mob;
    //   mobMap[user.mob] = user.fullname;
    //   tokensMap[user.mob] = user.fcmToken;
    // }
    // setState(() {
    //   isLoading = false;
    // });
  }
}
