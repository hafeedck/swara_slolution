import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/appbar/common_appbar.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/buttons/common_button.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/colors/colors.dart';
import 'package:swara_solution_flutter_machine_test/app/routes/app_pages.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        label: "Account",
        onTap: () {},
      ),
      body: Center(
        child: CommonButtonWidget(
          label: "Logout",
          color: primaryColor,
          onClick: () {
            logout();
          },
        ).paddingAll(50),
      ),
    );
  }

  void logout() async {
    dynamic returnResponse = await openDialog(
        "Do you want to logout", "Are you sure want to exit now?");

    if (returnResponse == true) {
      const storage = FlutterSecureStorage();
      await storage.deleteAll();

      Get.offAllNamed(Routes.SPLASH);
    }
  }
}

Future<dynamic> openDialog(String title, String subTitle,
    {String? okRemark = 'Ok', String? cancelRemark = 'Cancel'}) {
  return Get.dialog(
    AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: Text(
        title,
      ),
      content: subTitle.isEmpty
          ? null
          : Text(
              subTitle,
            ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () => Get.back(result: false),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
                ),
                child: Text(
                  cancelRemark!,
                  style: const TextStyle(color: primaryColor, fontSize: 15),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              OutlinedButton(
                onPressed: () {
                  Get.back(result: true);
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    okRemark!,
                    style: const TextStyle(fontSize: 15, color: primaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}
