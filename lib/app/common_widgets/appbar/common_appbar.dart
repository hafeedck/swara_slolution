import 'package:flutter/material.dart';

import 'package:swara_solution_flutter_machine_test/app/common_widgets/colors/colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String label;
  final Function onTap;

  const CommonAppBar({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: false,
      bottomOpacity: 0,
      backgroundColor: whiteColor,
      leading: InkWell(
          onTap: () {
            onTap();
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
