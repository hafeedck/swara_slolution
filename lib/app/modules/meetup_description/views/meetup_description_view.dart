import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/appbar/common_appbar.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/widgets/meetup_desc_carousal_widget.dart';
import '../controllers/meetup_description_controller.dart';

class MeetupDescriptionView extends GetView<MeetupDescriptionController> {
  const MeetupDescriptionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          label: "Description",
          onTap: () {
            Navigator.pop(context);
          },
        ),
        body: Column(
          children: [DescreptionCarouselSliderWidget(controller.sliderImage)],
        ));
  }
}
