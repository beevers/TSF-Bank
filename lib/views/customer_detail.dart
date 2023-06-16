import 'package:flutter/material.dart';
import 'package:tsf_bank/custom_widget.dart';
import 'package:tsf_bank/views/transfer_screen.dart';

import '../text_styling.dart';

class CustomerDetail extends StatelessWidget {
  final List userInfo;
  final int index;
  const CustomerDetail({super.key,required this.userInfo ,required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Detail"),
      ),
      body:  Center(
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
                        Text(userInfo[index]["name"],style: styleBig(),)
                      ],
                    ),
                    const HSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Email:",style: styleBig(),),
                        Text(userInfo[index]["email"],style: styleBig(),),
                      ],
                    ),
                    const HSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Bank:",style: styleBig(),),
                        Text("TSF Bank",style: styleBig(),),
                      ],
                    ),
                    const HSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Account Number",style: styleBig(),),
                        Text(userInfo[index]["phone"],style: styleBig(),),
                      ],
                    ),
                  ],
                ),
                )
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Transfer Money",
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: ((context) =>
           TransferScreen(selectedInfo: userInfo , index: index))));
        },
        backgroundColor: const Color(0xffFF9F0A),
        child: const Icon(Icons.arrow_forward_outlined),
      ),
    );
  }
}