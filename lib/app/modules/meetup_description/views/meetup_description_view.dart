import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/appbar/common_appbar.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/widgets/detail_widget.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/widgets/meetup_desc_carousal_widget.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/widgets/reaction_widget.dart';
import 'package:swara_solution_flutter_machine_test/app/extensions/extension.dart';
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              DescreptionCarouselSliderWidget(controller.sliderImage),
              15.0.spaceY,
              const ReactionWidget(
                saveCount: '1024',
                likeCount: '125',
                ratingCount: '3',
              ),
              const DetailWidget(
                  name: 'Actor Name',
                  designation: 'indain Actor',
                  duration: '20 Minuts',
                  amount: '9999',
                  descrption:
                      'An actor or actress is a person who portrays a character in a production.[1] The actor performs "in the flesh" in the traditional medium of the theatre or in modern media such as film, radio, and television. The analogous Greek term is ὑποκριτής (hupokritḗs), literally "one who answers".[2] The actors interpretation of a role—the art of acting—pertains to the role played, whether based on a real person or fictional character. This can also be considered an "actors role," which was called this due to scrolls being used in the theaters. Interpretation occurs even when the actor is "playing themselves", as in some forms of experimental performance art.')
            ],
          ),
        ));
  }
}
