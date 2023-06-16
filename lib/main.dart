

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tsf_bank/model/function.dart';
import 'package:tsf_bank/storage/database_helper.dart';
import 'package:tsf_bank/views/home_screen.dart';

final dbHelper = DatabaseHelper();


Future<void > main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await dbHelper.init();
  prefs.containsKey('value') ? null : await insert();
  runApp(const TSFBank());
}

class TSFBank extends StatelessWidget {
  const TSFBank({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor:const Color(0xff000000),
        appBarTheme: const AppBarTheme(
          backgroundColor:Colors.black,
          elevation: 0.0
        )
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen()
    );
  }
}

 