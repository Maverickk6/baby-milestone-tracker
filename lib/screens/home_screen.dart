import 'package:baby_milestones_tracker/view_model/milestone_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/tile_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final milestoneView = Get.put(MilestoneController());
    return SafeArea(
      child: Scaffold(
          body: Obx(
        () => Column(
          children: [
            const Text('Milestones Screen'),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                  itemCount: milestoneView.allMilestones.length,
                  itemBuilder: (context, index) => TileWidget(
                        type: milestoneView.allMilestones[index].type!,
                        description:
                            milestoneView.allMilestones[index].description!,
                        date: milestoneView.allMilestones[index].date!,
                      )),
            ),
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 20)
          ],
        ),
      )),
    );
  }
}
