// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:swara_solution_flutter_machine_test/app/modules/dashboard/controllers/dashboard_controller.dart';
// import 'package:swara_solution_flutter_machine_test/common_widgets/appbar/common_appbar.dart';
// import 'package:swara_solution_flutter_machine_test/common_widgets/colors/colors.dart';
// import 'package:swara_solution_flutter_machine_test/common_widgets/svg/svg_widget.dart';

// class DashboardView extends GetView<DashboardController> {
//   const DashboardView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CommonAppBar(
//         label: "Individual Meetup",
//       ),
//       body: Obx(
//         () => Center(
//           child: controller.pages.elementAt(controller.pageIndex.value),
//         ),
//       ),
//       bottomNavigationBar: Obx(
//         () => BottomNavigationBar(
//           currentIndex: controller.pageIndex.value,
//           showUnselectedLabels: true,
//           selectedItemColor: dashbordColor,
//           unselectedItemColor: Theme.of(context).primaryColor,
//           unselectedLabelStyle:
//               const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
//           selectedLabelStyle:
//               const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//           onTap: (int index) async {
//             controller.pageIndex.value = index;

//             controller.onChange(index);
//           },
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: svgWidget("assets/svg/Home.svg",
//                   color: Theme.of(context).primaryColor),
//               activeIcon:
//                   svgWidget("assets/svg/Home.svg", color: dashbordColor),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: svgWidget("assets/svg/Find Rate.svg",
//                   color: Theme.of(context).primaryColor),
//               activeIcon:
//                   svgWidget("assets/svg/Find Rate.svg", color: dashbordColor),
//               label: 'Prolet',
//             ),
//             BottomNavigationBarItem(
//               icon: svgWidget("assets/svg/Estimate.svg",
//                   color: Theme.of(context).primaryColor),
//               activeIcon:
//                   svgWidget("assets/svg/Estimate.svg", color: dashbordColor),
//               label: 'Meetup',
//             ),
//             BottomNavigationBarItem(
//               icon: svgWidget("assets/svg/Grievance.svg",
//                   color: Theme.of(context).primaryColor),
//               activeIcon:
//                   svgWidget("assets/svg/Grievance.svg", color: dashbordColor),
//               label: 'Explore',
//             ),
//             BottomNavigationBarItem(
//               icon: svgWidget("assets/svg/Awareness.svg",
//                   color: Theme.of(context).primaryColor),
//               activeIcon:
//                   svgWidget("assets/svg/Awareness.svg", color: dashbordColor),
//               label: 'Account',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:swara_solution_flutter_machine_test/app/modules/dashboard/controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        body: Obx(
          () => PersistentTabView(
            context,
            controller: controller.tabController,
            screens: controller.pages,
            items: controller.navBarItems(),
            confineInSafeArea: true,
            backgroundColor: Colors.white,
            navBarHeight: 75,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardShows: true,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.simple,
            onItemSelected: (value) {
              controller.pageIndex.value = value;
            },
          ),
        ));
  }
}
