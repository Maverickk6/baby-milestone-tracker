// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/model.dart';

class MilestoneController extends GetxController {
  var allMilestones = <Milestone>[].obs;

  TextEditingController typetext = TextEditingController();
  TextEditingController descriptiontext = TextEditingController();
  TextEditingController datetext = TextEditingController();

  @override
  void onInit() {
    // addMilestone();
    loadMilestones();
    super.onInit();
  }

  void loadMilestones() async {
    var results = await Milestone().select().toList();
    allMilestones.value = results;
  }

  void addMilestone() async {
    Milestone milestones = Milestone();
    milestones.type = 'Learn to walk';
    milestones.description = 'I want my baby to be able to run';
    milestones.date = DateTime.parse('2023-12-23');
    await milestones.save();
    loadMilestones();
  }

  void addItem(
    String type,
    String description,
    String date,
  ) async {
    Milestone milestone = Milestone();
    milestone.type = type;
    milestone.description = description;
    milestone.date = DateTime.parse(date);
    if (type != '' && description != '' && date != '') {
      try {
        await milestone.save();
        Get.showSnackbar(const GetSnackBar(
          title: 'Milestone',
          message: 'Milestone added successfully',
          duration: Duration(seconds: 3),
        ));
      } catch (e) {
        Get.showSnackbar(GetSnackBar(
          title: 'Error adding Milestone',
          message: '$e.message.toString()',
          duration: const Duration(seconds: 3),
        ));
      }
    }
    loadMilestones();
  }
}
