import 'package:aqua/app/modules/forgot/views/backto_login.dart';
import 'package:aqua/app/modules/forgot/views/otpverification_screen.dart';
import 'package:aqua/app/modules/forgot/views/resetpass_view.dart';
import 'package:get/get.dart';
import '../modules/forgot/bindings/forgot_binding.dart';
import '../modules/forgot/views/forgot_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/auth_screen.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.AUTHSCREEN,
      page: () => const AuthScreen(),
    ),
    GetPage(
      name: _Paths.FORGOT,
      page: () => const ForgotView(),
      binding: ForgotBinding(),
    ),
    GetPage(
      name: _Paths.OTPSCREEN,
      page: () => const OtpverificationScreen(),
      binding: ForgotBinding(),
    ),
    GetPage(
      name: _Paths.RESETPASS,
      page: () => const ResetpassView(),
    ),
    GetPage(
      name: _Paths.BACKLOGIN,
      page: () => const BacktoLogin(),
    ),
  ];
}
