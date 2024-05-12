import 'package:get/get.dart';
import 'package:taskeye/controllers/auth_controller.dart';
import 'package:taskeye/controllers/profile_controller.dart';
// import 'package:aloysius_student_app/views/dashboard_screen/dashboard_main.dart';
// import 'package:aloysius_student_app/views/fee_report/fee_report_main.dart';

class ProfleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
