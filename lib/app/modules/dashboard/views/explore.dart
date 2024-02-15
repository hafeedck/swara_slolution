import 'package:flutter/material.dart';
import 'package:swara_solution_flutter_machine_test/app/common_widgets/appbar/common_appbar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        label: "Individual Meetup",
        onTap: () {},
      ),
      body: const Center(
        child: Text('Explore Screen'),
      ),
    );
  }
}
