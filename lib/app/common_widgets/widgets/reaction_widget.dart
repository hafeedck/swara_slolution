// ignore: unused_import
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/colors/colors.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/text/text.dart';
import 'package:flutter/material.dart';
import 'package:swara_solution_flutter_machine_test/app/extensions/extension.dart';

class ReactionWidget extends StatelessWidget {
  final String saveCount;
  final String likeCount;
  final String ratingCount;
  const ReactionWidget({
    super.key,
    required this.saveCount,
    required this.likeCount,
    required this.ratingCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.bookmark,
          color: primaryColor,
        ),
        10.0.spaceX,
        commonText(saveCount, fontSize: 12, color: greyColor),
        10.0.spaceX,
        const Icon(
          Icons.heart_broken_sharp,
          color: primaryColor,
        ),
        commonText(likeCount, fontSize: 12, color: greyColor),
        15.0.spaceX,
        Container(
            height: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: greyColor.withOpacity(0.3)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.green,
                ),
                Icon(
                  Icons.star,
                  color: Colors.green,
                ),
                Icon(
                  Icons.star,
                  color: Colors.green,
                ),
                Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                Icon(
                  Icons.star,
                  color: Colors.black,
                ),
              ],
            ).paddingOnly(left: 5, right: 5)),
        15.0.spaceX,
        commonText(ratingCount, fontSize: 15, color: primaryColor),
      ],
    ).paddingOnly(left: 20);
  }
}
