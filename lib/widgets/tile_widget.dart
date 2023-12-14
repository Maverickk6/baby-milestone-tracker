// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({
    Key? key,
    required this.type,
    required this.description,
    required this.date,
  }) : super(key: key);

  final String type;
  final String description;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
