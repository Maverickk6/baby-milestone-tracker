// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:baby_milestones_tracker/widgets/delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../utils/utils.dart';
import '../view_model/milestone_viewmodel.dart';

class TileWidget extends StatelessWidget {
  const TileWidget(
      {super.key,
      required this.type,
      required this.description,
      required this.date,
      required this.created,
      this.id});

  final String type;
  final String description;
  final DateTime date;
  final DateTime created;
  final int? id;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final milestoneView = Get.put(MilestoneController());

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: const EdgeInsets.all(15),
          height: deviceSize.height * 0.2,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(6)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      type,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const Gap(5),
                    Text(description),
                    const Gap(5),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.av_timer, size: 14),
                            const Gap(3),
                            Text(DateFormat.yMMMd().format(date)),
                          ],
                        ),
                        const Gap(3),
                        Row(
                          children: [
                            const Text('Created on:'),
                            const Gap(3),
                            Text(DateFormat.yMMMd().format(created)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: deviceSize.width * 0.17,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 175, 207, 234),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              size: 14,
                            ),
                            Gap(2),
                            Text('Edit', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(6),
                  GestureDetector(
                    onTap: () {
                      showDeleteDialog(context, id);
                    },
                    child: Container(
                      width: deviceSize.width * 0.17,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 246, 131, 131)),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              size: 14,
                            ),
                            Gap(3),
                            Text('Delete', style: TextStyle(fontSize: 12))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
