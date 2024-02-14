import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swara_solution_flutter_machine_test/common_widgets/colors/colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String label;

  const CommonAppBar({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: false,
      bottomOpacity: 0,
      backgroundColor: whiteColor,
      leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
          )),
      title: Text(
        label,
        style: const TextStyle(fontSize: 18, color: primaryColor),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
