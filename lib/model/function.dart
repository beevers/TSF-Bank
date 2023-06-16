// Button onPressed methods

  import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tsf_bank/main.dart';
import 'package:tsf_bank/model/users.dart';

import '../storage/database_helper.dart';

Future<void> insert() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await dbHelper.insert(Users.users[0]);
    await dbHelper.insert(Users.users[1]);
    await dbHelper.insert(Users.users[2]);
    await dbHelper.insert(Users.users[3]);
    await dbHelper.insert(Users.users[4]);
    await dbHelper.insert(Users.users[5]);
    await dbHelper.insert(Users.users[6]);
    await dbHelper.insert(Users.users[7]);
    await dbHelper.insert(Users.users[8]);
    await dbHelper.insert(Users.users[9]);
    var id = await dbHelper.insert(Users.users[10]);
    prefs.setString('value', "Logged in");

    debugPrint('inserted row id: $id');
  }

  Future<List> query() async {
    final allRows = await dbHelper.queryAllRows();
    return allRows;
    // newRow = allRows;
    // print("this $newRow");
    // //create a list that will be passed to the customer list screen and use [...allRows]
    // debugPrint('query all rows:');
    // for (final row in allRows) {
    //   debugPrint(row.toString());
    // }
  }

  void update(int worth,int debit) async {
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: 11,
      DatabaseHelper.columnName: "Abolaji Ayeni",
      DatabaseHelper.columnEmail: "ayenilaji@gmail.com",
      DatabaseHelper.columnPhone: 22225570361,
      DatabaseHelper.columnBalance: worth - debit 
    };
    final rowsAffected = await dbHelper.update(row);
    debugPrint('updated $rowsAffected row(s)');
  }

  void delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    debugPrint('deleted $rowsDeleted row(s): row $id');
  }


Future<void> insertTransfers(String name,String phone, String amount) async {
    Map<String,dynamic> row = {
      DatabaseHelper.columnTransferName : name,
      DatabaseHelper.columnTransferNumber : phone ,
      DatabaseHelper.columnTransferAmount : amount ,
    };
    await dbHelper.insertTransfer(row);
    // prefs.setString('stringValue', "Logged in");

    // debugPrint('inserted row id: $id');
  }

  Future<List> queryTransfer() async {
    final allRows = await dbHelper.queryAllTransfer();
    return allRows;
    // newRow = allRows;
    // print("this $newRow");
    // //create a list that will be passed to the customer list screen and use [...allRows]
    // debugPrint('query all rows:');
    // for (final row in allRows) {
    //   debugPrint(row.toString());
    // }
  }

  // void updateTransfer() async {
  //   // row to update
  //   Map<String, dynamic> row = {
  //     DatabaseHelper.columnId: 6,
  //     DatabaseHelper.columnName: 'Mahmud Hassan',
  //     DatabaseHelper.columnEmail: "bob2@gmail.com",
  //     DatabaseHelper.columnPhone: 22225570361,
  //     DatabaseHelper.columnBalance: 6000.00
  //   };
  //   final rowsAffected = await dbHelper.update(row);
  //   debugPrint('updated $rowsAffected row(s)');
  // }

  // void deleteTransfer() async {
  //   // Assuming that the number of rows is the id for the last row.
  //   final id = await dbHelper.queryRowCount();
  //   final rowsDeleted = await dbHelper.delete(id);
  //   debugPrint('deleted $rowsDeleted row(s): row $id');
  // }
