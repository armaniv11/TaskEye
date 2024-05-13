import 'package:get/get.dart';
import 'package:taskeye/controllers/homepage_controller.dart';
import 'package:taskeye/controllers/profile_controller.dart';

class HomepageBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => HomepageController());
    Get.put(() => HomepageController());
  }
}
