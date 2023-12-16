// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/model.dart';

class MilestoneController extends GetxController {
  @override
  void onInit() {
    // addItem();
    loadMilestones();
    super.onInit();
  }

  var allMilestones = <Milestone>[].obs;

  TextEditingController typetext = TextEditingController();
  TextEditingController descriptiontext = TextEditingController();
  TextEditingController datetext = TextEditingController();

  void updateSelectedDate(newDate) {
    datetext.text = newDate;
  }

  clear() {
    typetext.clear();
    descriptiontext.clear();
    datetext.clear();
  }

  void loadMilestones() async {
    var results = await Milestone().select().toList();
    allMilestones.value = results;
  }

  var milestone = <Milestone>[].obs;

  void addMilestone() async {
    Milestone milestone = Milestone();
    milestone.type = typetext.text;
    milestone.description = descriptiontext.text;
    milestone.date = DateTime.parse(datetext.text);

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
    loadMilestones();
  }

  editMilestone(id) async {
    try {
      // await Milestone(). ;
    } catch (e) {
      return;
    }
  }

  deleteMilestone(id) async {
    try {
      final result = await Milestone().select().id.equals(id).delete();

      Get.showSnackbar(const GetSnackBar(
        title: 'Milestone',
        message: 'Milestone deleted successfully',
        duration: Duration(seconds: 3),
      ));
      loadMilestones();
      return result;
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Error deleting Milestone',
        message: '$e.message.toString()',
        duration: const Duration(seconds: 3),
      ));
      loadMilestones();
    }
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
