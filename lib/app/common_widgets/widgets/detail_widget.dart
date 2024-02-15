// ignore: unused_import
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/colors/colors.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/text/text.dart';
import 'package:flutter/material.dart';
import 'package:swara_solution_flutter_machine_test/app/extensions/extension.dart';

class DetailWidget extends StatelessWidget {
  final String name;
  final String designation;
  final String duration;
  final String amount;
  final String descrption;
  const DetailWidget({
    super.key,
    required this.name,
    required this.designation,
    required this.duration,
    required this.amount,
    required this.descrption,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText(name, fontSize: 16, color: Colors.black),
        5.0.spaceY,
        commonText(designation, fontSize: 14, color: greyColor),
        15.0.spaceY,
        Row(
          children: [
            const Icon(Icons.lock_clock),
            5.0.spaceX,
            commonText("Duration $duration", fontSize: 14, color: greyColor)
          ],
        ),
        5.0.spaceY,
        Row(
          children: [
            const Icon(Icons.wallet),
            5.0.spaceX,
            commonText("Total Average Fees $amount",
                fontSize: 14, color: greyColor)
          ],
        ),
        15.0.spaceY,
        commonText("About", fontSize: 16, color: Colors.black),
        10.0.spaceY,
        commonText(descrption, fontSize: 14, color: greyColor)
      ],
    ).paddingAll(22);
  }
}
