import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
import 'package:http/http.dart' as http;

part 'model.g.dart';

const SqfEntityTable tableMilestones = SqfEntityTable(
    tableName: 'milestones',
    primaryKeyName: 'id',
    useSoftDeleting: false,
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    fields: [
      SqfEntityField('type', DbType.text),
      SqfEntityField('description', DbType.text),
      SqfEntityField('date', DbType.datetimeUtc),
      SqfEntityField('created', DbType.datetime,
          defaultValue: 'DateTime.now()'),
    ]);

const milestoneIdentity = SqfEntitySequence(
  sequenceName: 'milestoneIdentity',
);

@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
  modelName: 'milestoneModel',
  databaseName: 'milestone_manager',
  password: 'maverick',
  sequences: [milestoneIdentity],
  databaseTables: [tableMilestones],
  bundledDatabasePath: null,
);
