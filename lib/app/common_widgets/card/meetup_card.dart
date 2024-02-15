// ignore: unused_import
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/buttons/common_button.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/colors/colors.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/text/text.dart';
import 'package:swara_solution_flutter_machine_test/app/extensions/extension.dart';
import 'package:flutter/material.dart';

class MeetupCard extends StatelessWidget {
  const MeetupCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: size.width * 0.75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFFF8F8F8),
            border: Border.all(color: greyColor, width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              5.0.spaceY,
              Row(
                children: [
                  Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: blueColor, width: 2.0),
                      ),
                      child: const Icon(Icons.person_pin_circle)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText("Author", color: blueColor, fontSize: 16),
                      commonText("1028 Meetup", color: greyColor, fontSize: 12),
                    ],
                  ).paddingOnly(left: 10)
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              10.0.spaceY,
              SizedBox(
                height: 50,
                child: Stack(
                  children: [
                    for (int index = 0; index < 5; index++)
                      Positioned(
                        left: index * 30,
                        child: Builder(
                          builder: (BuildContext context) {
                            try {
                              return const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://avatars.githubusercontent.com/u/61495501?v=4"),
                                radius: 25,
                              );
                            } catch (e) {
                              return const Placeholder();
                            }
                          },
                        ),
                      ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      height: 30,
                      width: size.width * 0.25,
                      child: CommonButtonWidget(
                        label: "See more",
                        onClick: () {},
                        color: primaryColor,
                      ))
                ],
              ).paddingOnly(top: 20)
            ],
          ).paddingAll(8)),
    );
  }
}
