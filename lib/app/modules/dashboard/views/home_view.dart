import 'package:flutter/material.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/appbar/common_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: CommonAppBar(
        label: "Home",
        onTap: () {},
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );

  }
}
