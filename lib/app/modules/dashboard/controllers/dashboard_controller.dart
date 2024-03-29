import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:swara_solution_flutter_machine_test/app/modules/dashboard/views/account_view.dart';
import 'package:swara_solution_flutter_machine_test/app/modules/dashboard/views/explore_view.dart';
import 'package:swara_solution_flutter_machine_test/app/modules/dashboard/views/home_view.dart';
import 'package:swara_solution_flutter_machine_test/app/modules/dashboard/views/meetup_view.dart';
import 'package:swara_solution_flutter_machine_test/app/modules/dashboard/views/prole_viewt.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/colors/colors.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/svg/svg_widget.dart';

class DashboardController extends GetxController {
  final pageIndex = 0.obs;
  String title = '';
  RxInt selectedDrowerIndex = 0.obs;
  int currentIndex = 0;
  var isLoading = false.obs;
  PersistentTabController tabController =
      PersistentTabController(initialIndex: 0);

  List<Widget> pages = [
    const HomeScreen(),
    const ProletScreen(),
    const MeetupScreen(),
    const ExploreScreen(),
    const AccountScreen(),
  ];
  List<String> sliderImage = [
    "assets/image/slider_image.jpg",
    "assets/image/slider_image_1.jpg",
    "assets/image/slider_image_2.jpg",
  ];

  @override
  void onInit() {
    super.onInit();
  }


  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: svgWidget(
          "assets/svg/Home.svg",
          color: pageIndex.value == 0
              ? dashbordColor
              : Theme.of(Get.context!).primaryColor,
        ),
        activeColorPrimary: dashbordColor,
        activeColorSecondary: dashbordColor,
        inactiveColorPrimary: Theme.of(Get.context!).primaryColor,
        title: 'Home',
      ),
      PersistentBottomNavBarItem(
        icon: svgWidget(
          "assets/svg/Find Rate.svg",
          color: pageIndex.value == 1
              ? dashbordColor
              : Theme.of(Get.context!).primaryColor,
        ),
        activeColorPrimary: dashbordColor,
        inactiveColorPrimary: Theme.of(Get.context!).primaryColor,
        title: 'Prolet',
      ),
      PersistentBottomNavBarItem(
        icon: svgWidget(
          "assets/svg/Estimate.svg",
          color: pageIndex.value == 2
              ? dashbordColor
              : Theme.of(Get.context!).primaryColor,
        ),
        activeColorPrimary: dashbordColor,
        inactiveColorPrimary: Theme.of(Get.context!).primaryColor,
        title: 'Meetup',
      ),
      PersistentBottomNavBarItem(
        icon: svgWidget(
          "assets/svg/Grievance.svg",
          color: pageIndex.value == 3
              ? dashbordColor
              : Theme.of(Get.context!).primaryColor,
        ),
        activeColorPrimary: dashbordColor,
        inactiveColorPrimary: Theme.of(Get.context!).primaryColor,
        title: 'Explore',
      ),
      PersistentBottomNavBarItem(
        icon: svgWidget(
          "assets/svg/Awareness.svg",
          color: pageIndex.value == 4
              ? dashbordColor
              : Theme.of(Get.context!).primaryColor,
        ),
        activeColorPrimary: dashbordColor,
        inactiveColorPrimary: Theme.of(Get.context!).primaryColor,
        title: 'Account',
      ),
    ];
  }
}
