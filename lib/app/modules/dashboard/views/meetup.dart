import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swara_solution_flutter_machine_test/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:swara_solution_flutter_machine_test/app/modules/meetup_description/views/meetup_description_view.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/appbar/common_appbar.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/card/meetup_card.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/card/trending_meetup_card.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/colors/colors.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/textfield/common_textfield.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/widgets/carousel_widget.dart';
import 'package:swara_solution_flutter_machine_test/app/extensions/extension.dart';
import '../../../common_widgets/text/text.dart';

class MeetupScreen extends GetView<DashboardController> {
  const MeetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        label: "Individual Meetups",
        onTap: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonTextField().paddingAll(5),
            CarouselSliderWidget(controller.sliderImage),
            commonText("Trending Popular People",
                color: blueColor, fontSize: 18),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return const MeetupCard();
                },
              ),
            ),
            15.0.spaceY,
            commonText("Top Trending Meetup", color: blueColor, fontSize: 18),
            10.0.spaceY,
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return TrendingMeetupCard(
                    count: '0${index + 1}',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MeetupDescriptionView(),
                          ));
                    },
                  );
                },
              ),
            ),
          ],
        ).paddingAll(8),
      ),
    );
  }
}

class MyHorizontalListView extends StatelessWidget {
  const MyHorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return const MeetupCard();
        },
      ),
    );
  }
}
