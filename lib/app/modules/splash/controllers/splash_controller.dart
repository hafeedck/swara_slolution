import 'package:get/get.dart';
import 'package:swara_solution_flutter_machine_test/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () async {
      Get.toNamed(Routes.LOGIN);
    });
    super.onInit();
  }
}
