import 'package:get/get.dart';

import '../controllers/meetup_description_controller.dart';

class MeetupDescriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeetupDescriptionController>(
      () => MeetupDescriptionController(),
    );
  }
}
