import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:taskeye/models/channel_model.dart';

class HomepageController extends GetxController {
  List<ChannelModel> channels = [];
  RxBool isLoading = false.obs;
}
