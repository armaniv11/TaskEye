import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taskeye/firebase_options.dart';
import 'package:taskeye/routes/routes.dart';
import 'package:taskeye/utils/app_constants.dart';
import 'package:taskeye/utils/app_color_utils.dart';
import 'package:taskeye/utils/route_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await GetStorage.init();
  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await setupFlutterNotifications();
  // showFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  if (kDebugMode) {
    print('Handling a background message ${message.messageId}');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //  JwtController jwtController = Get.find<JwtController>();

    final box = GetStorage();
    bool isFirstTime = (box.read('firstTime') ?? true);
    box.write('firstTime', false);

    return GetMaterialApp(
      smartManagement: SmartManagement.keepFactory,
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      navigatorObservers: <NavigatorObserver>[observer],
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: "CircularSpotifyText",
        scaffoldBackgroundColor: AppColorUtils.bgColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColorUtils.bgColor,
          elevation: 0.0,
          titleSpacing: 8.0,
          // iconTheme: IconThemeData(
          //   color: AppColorUtils.blackColor,
          //   size: 28,
          // ),
        ),
      ),
      fallbackLocale: const Locale('en', 'US'),
      locale: Get.deviceLocale,
      // navigatorObservers: <NavigatorObserver>[observer],
      // unknownRoute: GetPage(
      //   name: '/page-not-found',
      //   page: () => const PageNotFoundScreen(),
      // ),
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      // initialBinding: DataBinding(),

      getPages: Routes.routes,
      initialRoute: AppRouteConstants.splashRoute,
      transitionDuration: const Duration(milliseconds: 500),

      // customTransition: CustomTransition.,
      defaultTransition: Transition.fadeIn,
    );
  }
}
