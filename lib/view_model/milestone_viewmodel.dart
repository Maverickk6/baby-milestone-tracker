// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/model.dart';

class MilestoneController extends GetxController {
  var allMilestones = <Milestone>[].obs;

  TextEditingController typetext = TextEditingController();
  TextEditingController descriptiontext = TextEditingController();
  TextEditingController datetext = TextEditingController();

  void updateSelectedDate(newDate) {
    datetext.value = newDate;
  }

  @override
  void onInit() {
    // addItem();
    loadMilestones();
    super.onInit();
  }

  void loadMilestones() async {
    var results = await Milestone().select().toList();
    allMilestones.value = results;
  }

  var milestone = <Milestone>[].obs;

  // void addItem() async {
  //   Milestone milestones = Milestone();
  //   milestones.type = 'Learn to sit';
  //   milestones.description = 'I want my baby to be able to sit on her own';
  //   milestones.date = DateTime.parse('2023-12-23');
  //   await milestones.save();
  //   loadMilestones();
  // }

  void addMilestone(
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

  Future<Map<String, dynamic>> getMilestone(int id) async {
    try {
      final milestone = await Milestone().getById(id);
      return milestone!.toMap();
    } catch (e) {
      return {'error': e.toString()};
    }
  }
}
