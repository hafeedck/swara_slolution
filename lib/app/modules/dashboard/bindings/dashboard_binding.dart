import 'package:get/get.dart';
import 'package:swara_solution_flutter_machine_test/app/modules/meetup_description/controllers/meetup_description_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
      Get.lazyPut<MeetupDescriptionController>(
      () => MeetupDescriptionController(),
    );
  }
}
