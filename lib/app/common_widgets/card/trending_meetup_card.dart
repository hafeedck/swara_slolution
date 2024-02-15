import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/colors/colors.dart';

class TrendingMeetupCard extends StatelessWidget {
  final String count;
  final Function onTap;
  const TrendingMeetupCard({
    Key? key,
    required this.count,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Stack(
        children: [
          Container(
            width: size.width * 0.55,
            height: size.height * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/image/meetup_image.jpg',
                fit: BoxFit.cover,
              ).paddingOnly(left: 5, right: 5),
            ),
          ).paddingAll(5),
          Positioned(
            right: 1.0,
            top: 125,
            child: Container(
              width: size.width * 0.2,
              height: size.height * 0.1,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  count,
                  style: const TextStyle(
                    color: blueColor,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
