import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:swara_solution_flutter_machine_test/app/routes/app_pages.dart';
import 'package:swara_solution_flutter_machine_test/app/service/session.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () async {
      checkLoginStatus();
    });
    super.onInit();
  }

  void checkLoginStatus() async {
    const storage = FlutterSecureStorage();
    final isUser = await storage.containsKey(key: "userid");

    if (isUser) {
      String? userid = await storage.read(key: "userid");
      String? username = await storage.read(key: "username");

      Session.preferaceData(userid.toString(), username.toString());

      if (Session.userid != "") {
        Get.offAllNamed(
          Routes.DASHBOARD,
        );
      }
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }
}
