import 'package:flutter/material.dart';
import 'package:tsf_bank/custom_widget.dart';
import 'package:tsf_bank/views/user_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //List newRow = [];
  List icons = [Icons.smartphone,Icons.subscriptions_outlined,Icons.trending_up,Icons.tv,];
  List icon2 = [Icons.offline_bolt,Icons.network_wifi,Icons.school,Icons.trending_flat,];
  List<String> services1 = ["Airtime","Data","Betting","TV"];
  List<String> services2 = ["Electricity","Internet","School&Exam","More"];
  @override
  Widget build(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 10,top:10),
          child: AppBar(
            leading: Container(
              width: 48,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color:const Color(0xff1C1C1E)
              ),
              child:const Icon(
                Icons.settings
              ),
            ),
            title: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                return const UserDetail();
              }));
              },
              child: const ProfilePicture(
                image: "assets/images/p_pic.jpg",),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                width: 56,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:const Color(0xff1C1C1E)
                ),
                child: const Icon(
                  Icons.notifications
                ),
                ),
              ),
            ],
          ),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.only(left: 10, right: 10,top: 15),
        child: SingleChildScrollView(
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: GlowingOverscrollIndicator(
              color: Colors.transparent,
              axisDirection: AxisDirection.down,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const ATMCard(),
                 const HSpace(8),
                 const Text("Payment",style: TextStyle(color: Colors.white),),
                 const HSpace(8),
                 PaymentServices(icons,services1),
                 const HSpace(40),
                 PaymentServices(icon2,services2),
                 const HSpace(8),
                 Chipped(width),
                 const HSpace(2),
                const FreeCard("Refer And Earn",Icon(Icons.record_voice_over,color: Colors.white,),"Earn #800 Cashback per referral"
                ,CloseButton()
                ),
                 const HSpace(5),
                 const FreeCard("Buy airtime, Get 3% cashback",Icon(Icons.on_device_training,color: Colors.white,),"Earn #800 Cashback per referral"
                ,CloseButton()),
                 const HSpace(5),
                 Padding(
                   padding: EdgeInsets.only(left: width *0.16,right: width *0.16),
                   child: const CustomerButton(),
                 ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

