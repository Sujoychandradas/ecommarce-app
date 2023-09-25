import 'package:ecommarce_app/bussiness_logics/bindings/authbinding.dart';
import 'package:ecommarce_app/ui/views/auth/login.dart';
import 'package:ecommarce_app/ui/views/not_found.dart';
import 'package:get/get.dart';

import '../views/auth/forget_password.dart';
import '../views/auth/registration.dart';
import '../views/bottom_nav_controller.dart';
import '../views/onboarding.dart';
import '../views/splash.dart';
import '../views/terms_condition.dart';

const String splash = '/splash-screen';
const String unknown = '/not-found';
const String intro = '/intro';
const String login = '/login';
const String registration = '/registration';
const String forgetPass = '/forgetPass';
const String terms = '/terms';
const String bottomNav = '/bottomNav';
// const String details = '/details';

List<GetPage> getPages = [
  GetPage(
    name: unknown,
    page: () => const Unknown(),
  ),
  GetPage(
    name: splash,
    page: () => Splash(),
    // binding: SplashBinding(),
  ),
  GetPage(
    name: intro,
    page: () => const Onboarding(),
  ),
  GetPage(name: login, page: () => Login(), binding: AuthBinding()),
  GetPage(
      name: registration, page: () => Registration(), binding: AuthBinding()),
  GetPage(
    name: forgetPass,
    page: () => ForgetPassword(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: terms,
    page: () => TermCondition(),
  ),
  GetPage(
    name: bottomNav,
    page: () => BottomNavController(),
  ),
  // GetPage(
  //   name: details,
  //   page: () => DetailsScreen(
  //     data: Get.arguments,
  //   ),
  // ),
];
