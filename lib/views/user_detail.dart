import 'package:flutter/material.dart';
import 'package:tsf_bank/custom_widget.dart';
import 'package:tsf_bank/text_styling.dart';

import '../model/function.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  List newRow = [];
  dynamic eee;
  void addNewRow() async {
  eee = await query();
    setState(() {
      newRow = eee;
    });
  }

  @override
  void initState() {
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
       addNewRow();});
    super.initState();
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 30),
        child: Center(
          child: Column(
            children: [
              const ProfilePicture(
                width: 125,
                height: 125,
                radius: 60,
                image: "assets/images/p_pic.jpg"),
                const HSpace(50),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xffFF375F),Color(0xffFF9F0A)
                  ],)
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Name:",style: styleBig(),),
                        Text(newRow.isEmpty ? "" : newRow[10]["name"],style: styleBig(),)
                      ],
                    ),
                    const HSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Email:",style: styleBig(),),
                        Text(newRow.isEmpty ? "" : newRow[10]["email"],style: styleBig(),),
                      ],
                    ),
                    const HSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Phone:",style: styleBig(),),
                        Text(newRow.isEmpty ? "" : newRow[10]["phone"],style: styleBig(),),
                      ],
                    ),
                    const HSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Current Balance:",style: styleBig(),),
                        Text(newRow.isEmpty ? "" :"\$${newRow[10]["balance"]}",style: styleBig(),),
                      ],
                    ),
                  ],
                ),
                )
            ],
          ),
        ),
      ),
    );
  }
}