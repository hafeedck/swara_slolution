import 'package:flutter/material.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/appbar/common_appbar.dart';

class ProletScreen extends StatelessWidget {
  const ProletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        label: "Prolet",
        onTap: () {},
      ),
      body: const Center(
        child: Text('Prolet Screen'),
      ),
    );
  }
}
