import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../view_model/milestone_viewmodel.dart';

showDeleteDialog(BuildContext context, id) {
  final milestoneView = Get.put(MilestoneController());

  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: Colors.white,
      title: const Text('Are you sure you want to delete?',
          style: TextStyle(fontSize: 18)),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                milestoneView.deleteMilestone(id);
                navigator?.pop(context);
              },
              child: const Text('Yes'),
            ),
            ElevatedButton(
              onPressed: () {
                navigator?.pop(context);
              },
              child: const Text('Cancel'),
            )
          ],
        ),
      ),
    ),
  );
}
