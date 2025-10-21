import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../on_boarding/onboard_screen.dart';  // নিশ্চিত import করো

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToOnboarding();
  }

  void navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(() => OnboardingScreen());  // সরাসরি Widget পাস করো
  }
}
