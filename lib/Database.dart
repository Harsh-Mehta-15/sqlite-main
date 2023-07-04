import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Databasehelper{
  static final databasename = "harsh.db";
  static final databaseversion = 1;

  static final table = "employee";

  static final employee_name = "empnm";
  static final street = 'str';
  static final city = "city";

  static Database database;

  Future<database> get database async
    if(database != null) return database;

    database = await _initdatabase();
    return database;

  _initdatabase() async{
    Directory documentdirectry = await getApplicationDocumentsDirectory();
    String path = join(documentdirectry.path , databasename);
    return await openDatabase(path,version: databaseversion, onCreate: oncreate);
  }

  Future oncreate(Database db, int version) async{
    await db.execute(
    '''
    CREATE TABLE $table(
    $employee_name
    )
    '''
    )
  }




}