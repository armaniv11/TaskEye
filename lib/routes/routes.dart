import 'package:get/get.dart';
import 'package:taskeye/providers/bindings/auth_binding.dart';
import 'package:taskeye/providers/bindings/profile_binding.dart';
import 'package:taskeye/screens/auth/register_page_phone.dart';
import 'package:taskeye/screens/users/add_update_users.dart';
import 'package:taskeye/splashScreen.dart';
import 'package:taskeye/utils/route_constants.dart';

class Routes {
  static final routes = [
    GetPage(
      name: AppRouteConstants.splashRoute,
      page: () => const Splash(),
      // binding: DataBinding(),
    ),
    GetPage(
      name: AppRouteConstants.signInRoute,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: AppRouteConstants.profileRoute,
        page: () => const ProfileScreen(),
        binding: ProfleBinding()
        // binding: DataBinding(),
        ),
    // GetPage(
    //   name: AppRouteConstants.homepageRoute,
    //   page: () => const HomePage(),
    //   // binding: DataBinding(),
    // ),
  ];
}
