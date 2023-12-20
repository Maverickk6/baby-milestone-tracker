import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../utils/utils.dart';

import '../view_model/milestone_viewmodel.dart';

showEditDialog(BuildContext context, id) {
  final milestoneView = Get.put(MilestoneController());
  final deviceSize = context.deviceSize;

  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: Colors.white,
      title: const Text('Edit milestone', style: TextStyle(fontSize: 18)),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Milestone',
                  filled: true,
                  fillColor: Color.fromARGB(255, 233, 233, 233),
                  constraints:
                      BoxConstraints(maxHeight: deviceSize.height * 0.07)
                  // hintText: '',
                  ),
              controller: milestoneView.typetext,
            ),
            const Gap(10),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Add a description',
                  filled: true,
                  fillColor: Color.fromARGB(255, 233, 233, 233),
                  constraints:
                      BoxConstraints(maxHeight: deviceSize.height * 0.07)
                  // hintText: 'Add a milestone',
                  ),
              controller: milestoneView.descriptiontext,
            ),
            const Gap(10),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    
                      borderRadius: BorderRadius.circular(20),),
                  labelText: 'Add a date',
                  filled: true,
                  fillColor: Color.fromARGB(255, 233, 233, 233),
                  constraints:
                      BoxConstraints(maxHeight: deviceSize.height * 0.07)
                  // hintText: 'Add a milestone',
                  ),
              readOnly: true,
              controller: milestoneView.datetext,
              onTap: () {
                _selectDate(context);
              },
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    navigator?.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    milestoneView.editMilestone(id);
                    milestoneView.clear();
                    navigator?.pop(context);
                  },
                  child: const Text('Save'),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Future<void> _selectDate(BuildContext context) async {
  final milestoneView = Get.put(MilestoneController());

  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

  if (picked != null) {
    milestoneView.updateSelectedDate(picked.toString().split(" ")[0]);
  }
}
