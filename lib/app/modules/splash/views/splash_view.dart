import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:swara_solution_flutter_machine_test/common_widgets/text/text.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              homeTitle("Sawara Solutions"),
            ],
          ),
        ),
      ),
    );
  }
}
