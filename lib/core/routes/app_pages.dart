import 'package:get/get.dart';
import 'package:mobile_test_task/core/routes/app_routes.dart';
import 'package:mobile_test_task/view/screens/delete_user_screen.dart';
import 'package:mobile_test_task/view/screens/register_screen.dart';

import '../../view/binding/chane_password_binding.dart';
import '../../view/binding/delete_user_binding.dart';
import '../../view/binding/home_binding.dart';
import '../../view/binding/login_binding.dart';
import '../../view/binding/register_binding.dart';
import '../../view/binding/update_information_binding.dart';
import '../../view/screens/change_password_screen.dart';
import '../../view/screens/home_screen.dart';
import '../../view/screens/landing_screen.dart';
import '../../view/screens/login_screen.dart';
import '../../view/screens/update_information_screen.dart';


class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Paths.landingScreen,
      page: () => const LandingScreen(),
    ),
    GetPage(
      name: Paths.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Paths.registerScreen,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Paths.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Paths.updateInformationScreen,
      page: () => const UpdateInformationScreen(),
      binding: UpdateInformationBinding(),
    ),
    GetPage(
      name: Paths.changePasswordScreen,
      page: () => const ChangePasswordScreen(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: Paths.deleteUserScreen,
      page: () => const DeleteUserScreen(),
      binding: DeleteUserBinding(),
    ),
  ];
}
