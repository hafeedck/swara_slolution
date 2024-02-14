import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swara_solution_flutter_machine_test/app/modules/dashboard/views/account.dart';
import 'package:swara_solution_flutter_machine_test/app/modules/dashboard/views/explore.dart';
import 'package:swara_solution_flutter_machine_test/app/modules/dashboard/views/home.dart';
import 'package:swara_solution_flutter_machine_test/app/modules/dashboard/views/meetup.dart';
import 'package:swara_solution_flutter_machine_test/app/modules/dashboard/views/prolet.dart';

class DashboardController extends GetxController {
  final pageIndex = 0.obs;
  String title = '';
  RxInt selectedDrowerIndex = 0.obs;

  var isLoading = false.obs;

  List<Widget> pages = [
    const HomeScreen(),
    const ProletScreen(),
    const MeetupScreen(),
    const ExploreScreen(),
    const AccountScreen(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  void onChange(int value) {
    pageIndex.value = value;
    if (value == 0) {
      title = 'Home';
    }
    if (value == 1) {
      title = 'Prolet';
    }
    if (value == 2) {
      title = 'Individual Meetup';
    }
    if (value == 3) {
      title = 'Explore';
    }
    if (value == 4) {
      title = 'Account';
    }

    update();
  }
}
