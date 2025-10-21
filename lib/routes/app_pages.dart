import 'package:get/get.dart';
import '../modules/assignment1/auth/forgot_password/forgot_pass.dart';
import '../modules/assignment1/auth/forgot_password/otp.dart';
import '../modules/assignment1/auth/forgot_password/reset_password.dart';
import '../modules/assignment1/auth/login/login.dart';
import '../modules/assignment1/auth/regestration/reg.dart';
import '../modules/assignment1/language/language.dart';
import '../modules/assignment1/map/map.dart';
import '../modules/assignment1/splash_screen/splash_screen.dart';
import '../modules/assignment1/splash_screen/splash_binding.dart';
import '../modules/assignment1/on_boarding/onboard_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => OnboardingScreen(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => RegistrationScreen(),
    ),
    GetPage(
      name: AppRoutes.FORGOT_PASSWORD,
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.RESET_PASSWORD,
      page: () => ResetPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.OTP_VERIFICATION,
      page: () => OtpVerificationScreen(email: '',),
    ),
    GetPage(
      name: AppRoutes.ENABLE_LOCATION,
      page: () => EnableLocationScreen(),
    ),
    GetPage(
      name: AppRoutes.LANGUAGE_SELECTION,
      page: () => LanguageSelectionScreen(),
    ),
  ];
}
