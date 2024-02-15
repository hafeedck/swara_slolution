import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:swara_solution_flutter_machine_test/app/api/api.dart';
import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';
import 'package:swara_solution_flutter_machine_test/app/routes/app_pages.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/helper/toast.dart';
import 'package:swara_solution_flutter_machine_test/app/model/login_model.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  var isLoading = false.obs;

  var ispasswordButtonShow = false.obs;
  var isemailButtonShow = false.obs;
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void login() async {
    String sha256 = sha256Password(passwordController.text);
    isLoading(true);

    try {
      final response =
          await ApiProvider().login(usernameController.text.trim(), sha256);
      if (response != null) {
        if (response.status.code == 200) {
          preferaceData(response);
          Get.offAllNamed(Routes.SPLASH);
          toast("Sucessfully Login");
          usernameController.clear();
          passwordController.clear();
        } else {
          isLoading(false);
          toast(response.status.message);
        }
      }
    } finally {
      isLoading(false);
    }
  }

  String sha256Password(String input) {
    var bytes = utf8.encode(input);
    var sha256Hash = sha256.convert(bytes);
    return sha256Hash.toString();
  }

  Future<void> preferaceData(LoginResponse response) async {
    const storage = FlutterSecureStorage();

    await storage.write(
        key: 'userid', value: response.response.userId.toString());
    await storage.write(
        key: 'username', value: response.response.userName.toString());
  }
}
