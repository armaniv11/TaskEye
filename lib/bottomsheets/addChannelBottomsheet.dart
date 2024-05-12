import 'dart:io';
import 'package:taskeye/utils/app_constants.dart';
import 'package:taskeye/screens/apis/firebaseapi.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:random_string/random_string.dart';
import 'package:taskeye/utils/custom_widgets/custom_textfield.dart';

import '../helper_functions/helper_functions.dart';
import '../models/channel_model.dart';

class AddChannelBottomSheet extends StatefulWidget {
  final ChannelModel? channelModel;
  const AddChannelBottomSheet({Key? key, this.channelModel}) : super(key: key);

  @override
  State<AddChannelBottomSheet> createState() => _AddChannelBottomSheetState();
}

class _AddChannelBottomSheetState extends State<AddChannelBottomSheet> {
  final TextEditingController channelController = TextEditingController();

  bool isPrivate = false;

  bool isLoading = false;

  File? profilePic;
  String networkImage = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(widget.taskModel!.assignTo);
    loadData();
  }

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

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: CustomTextField(
                    fillColor: AppConstants.appBackGroundColor,
                    controller: channelController,
                    width: double.maxFinite,
                    keyboardType: TextInputType.text,
                    // maxlines: 6,
                    isDense: true,
                    hintText: "Channel Name",
                    // headingColor: Colors.yellow,
                    // headingSize: 16,
                    validator: (p0) =>
                        p0!.isEmpty ? "Channel name is required" : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 8),
                  child: Text(
                    "Channel Pic ",
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(fontSize: 16, color: Colors.grey[700]!)),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.circle,
                          color: Colors.grey[200],
                          image: profilePic != null
                              ? DecorationImage(
                                  image: FileImage(profilePic!),
                                  fit: BoxFit.fill)
                              : networkImage == ""
                                  ? const DecorationImage(
                                      image: NetworkImage(
                                          AppConstants.bgUserImageDummy))
                                  : DecorationImage(
                                      image: NetworkImage(networkImage),
                                      fit: BoxFit.fitWidth)),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () async {
                              String img =
                                  await HelperFunction.customGetImage();
                              if (img.isNotEmpty) {
                                setState(() {
                                  profilePic = File(img);
                                });
                              }
                            },
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
                ),
                InkWell(
                  onTap: saveChannel,
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
    setState(() {
      isLoading = true;
    });

    if (profilePic != null) {
      final storageReference = FirebaseStorage.instance
          .ref()
          .child("channelPic/${channelController.text}");

      final uploadTask = storageReference.putFile(profilePic!);
      final downloadUrl = await uploadTask.whenComplete(() => null);
      imgUrl = await downloadUrl.ref.getDownloadURL();
    }

    await FirebaseApi()
        .upsertChannel(ChannelModel(
            channelName: channelController.text,
            isPrivate: isPrivate,
            adminId: GetStorage().read('mob'),
            channelImage: imgUrl ?? networkImage,
            channelId: widget.channelModel?.channelId ?? randomAlphaNumeric(6),
            createdAt: DateTime.now().millisecondsSinceEpoch))
        .then((value) {
      if (value) {
        Navigator.of(context).pop();
        // await CustomFunctions().sendFCM(
        //     title: "New Task",
        //     body: taskController.text.toString(),
        //     fcmToken: tokensMap[selectedNUmber]);

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

    //         assignBy: widget.taskModel != null
    //             ? widget.taskModel!.assignBy
    //             : GetStorage().read('mob'),
    //         taskId: widget.taskModel != null
    //             ? widget.taskModel!.taskId
    //             : randomAlphaNumeric(6),
    //         assignTime: DateTime.now().millisecondsSinceEpoch,
    //         taskStatus: widget.taskModel != null
    //             ? widget.taskModel!.taskStatus
    //             : TaskStatus.process,
    //         completionDate: widget.taskModel != null
    //             ? widget.taskModel!.completionDate
    //             : taskInDateTime!.millisecondsSinceEpoch))
    //     .then((value) async {
    //   if (value) {
    //     Navigator.of(context).pop();
    //     await CustomFunctions().sendFCM(
    //         title: "New Task",
    //         body: taskController.text.toString(),
    //         fcmToken: tokensMap[selectedNUmber]);

    //     return Fluttertoast.showToast(
    //         msg: "Task has been assigned successfully!!",
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.BOTTOM,
    //         timeInSecForIosWeb: 3,
    //         backgroundColor: Colors.green[900],
    //         textColor: Colors.white,
    //         fontSize: 14.0);
    //   }
    // });
    // setState(() {
    //   isLoading = false;
    // });
    // Da
  }
}
