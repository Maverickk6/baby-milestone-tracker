import 'package:baby_milestones_tracker/view_model/milestone_viewmodel.dart';
import 'package:baby_milestones_tracker/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../utils/utils.dart';

import '../widgets/tile_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;

    final milestoneView = Get.put(MilestoneController());
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 231, 229, 229),
          body: Obx(
            () => Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  width: deviceSize.width,
                  height: deviceSize.height * 0.2,
                  color: Color.fromARGB(255, 11, 25, 181),
                  child: const Center(
                    child: Text(
                      'Your Milestones',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Gap(10),
                    itemCount: milestoneView.allMilestones.length,
                    itemBuilder: (context, index) => TileWidget(
                        type: milestoneView.allMilestones[index].type!,
                        description:
                            milestoneView.allMilestones[index].description!,
                        date: milestoneView.allMilestones[index].date!,
                        created: milestoneView.allMilestones[index].created!,
                        id: milestoneView.allMilestones[index].id!),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () => showAddDialog(context),
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
