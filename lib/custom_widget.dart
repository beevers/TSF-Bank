import 'package:flutter/material.dart';
import 'package:tsf_bank/text_styling.dart';
import 'package:tsf_bank/views/customer_list.dart';
import 'package:tsf_bank/views/transfer_list.dart';

import 'model/function.dart';

class CardFeatures extends StatelessWidget {
  final String feature;
  final IconData icon;
  const CardFeatures({super.key, required this.feature, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const TransferList();
        }));
      },
      child: Column(
      children: [
        Container(
          width: 40,
          height: 43,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon,color: const Color(0xffFF375F),),
        ),
      const SizedBox(height: 7,),
        Text(feature,style: styleSmall(),)
      ],),
    );
  }
}

// This is the ATM card displayed on homescreen

class ATMCard extends StatefulWidget {
  const ATMCard({super.key});

  @override
  State<ATMCard> createState() => _ATMCardState();
}

class _ATMCardState extends State<ATMCard> {
  List newData = [];
  dynamic currentData;
  void addNewRow() async {
    currentData = await query();
    setState(() {
      newData = currentData;
    });
  }
  final  icon = [Icons.add,Icons.sync_alt_outlined,Icons.open_in_full_outlined];
  final feature = ["Add money","Transfer","Withdraw"];
  bool isVisible = false;
  @override
  void initState() {
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { addNewRow();});
    super.initState();
   
  }
  @override
  Widget build(BuildContext context) {
    addNewRow();
    return  Stack(
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            Color(0xffFF375F),Color(0xffFF9F0A)
          ],)
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10,right:10),
        child: Row(
          children: [
            const Column(
              children: [
                Text("Total Balance",style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",color: Colors.white),),
              ],
            ),
            IconButton(onPressed: (){
              //insert();
              // print(query());
              setState(() {
                isVisible = !isVisible;
              });
            }, icon: isVisible == true ? const Icon(
              Icons.visibility_outlined,color: Colors.white,) : const Icon(
              Icons.visibility_off_outlined,color: Colors.white,) ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
            GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>
              const TransferList()));},
              child: const Text("Transaction History",style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.white),),
            ),
            SizedBox(
              width: 1,
              child: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
              const TransferList()));
              }, icon: const Icon(Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 15,),),
            )
          ],
        ),
      ),
       Positioned(
        top: 55,
        left: 50,
        child: Text(newData.isEmpty ? "\$0" : isVisible ? "\$${newData[10]["balance"]}" : "****",style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),)),
        Positioned(
          top: 100,
          right: 10,
          left: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(3, (index) => CardFeatures(
            feature: feature[index], icon: icon[index])
            ),),
        ),
        
    ],
  );
  }
}

//
class HSpace extends StatelessWidget {
  final double height;
  const HSpace(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height,);
  }
}

class WSpace extends StatelessWidget {
  final double width;
  const WSpace(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width,);
  }
}

class HWSpace extends StatelessWidget {
  final double width;
  final double height;
  const HWSpace(this.width, this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width,height: height,);
  }
}

class PaymentServices extends StatelessWidget {
  final List services;
  final List icons;
  const PaymentServices(this.icons,this.services, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(4, (index) => Column(
        children: [
          Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xffFF375F),Color(0xffFF9F0A)
          ],)
        ),
          child: Icon(icons[index],color: Colors.white,)
          ),
          const HSpace(5),
          Text(services[index],style:const TextStyle(color: Colors.white,fontSize: 12),)
        ],
      )),
      );
  }
}

class Chipped extends StatelessWidget {
  final double width;
  const Chipped(this.width,{super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
    backgroundColor: const Color(0xffFF9F0A),
    label: Row( //mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      const Icon(Icons.record_voice_over_outlined,size: 16,color: Colors.white,),
      const WSpace(10),
      const Text("Earn Up to #1200 per referral",style: TextStyle(color: Colors.white),),
      WSpace(width * 0.35),
      const Icon(Icons.arrow_forward_ios_outlined,size: 14,color: Colors.white,)
      ],));
  }
}

class FreeCard extends StatelessWidget {
  final String title;
  final String subtitle ;
  final Widget trailing;
  final Widget leading;
  final void Function()? callback;
  const FreeCard(this.title,this.leading,this.subtitle,this.trailing,{super.key,this.callback});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Container(
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xffFF375F),Color(0xffFF9F0A)
          ],)
        ),
        child: ListTile(
          onTap: callback,
          leading: leading,
          title: Text(title,style: const TextStyle(color: Colors.white),),
          subtitle: Text(subtitle,style: const TextStyle(color: Colors.white,fontSize: 12),),
          trailing: trailing
        ),
      ),
    );
  }
}

class CustomerButton extends StatefulWidget {
  const CustomerButton({super.key});

  @override
  State<CustomerButton> createState() => _CustomerButtonState();
}

class _CustomerButtonState extends State<CustomerButton> {
  List newRows = [];
  
  void addNewRow() async {
  var info = await query();
    setState(() {
      newRows = info;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    addNewRow();
    return ElevatedButton(
  onPressed: () async {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return CustomerListScreen(usersInfo : newRows);
    }));
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
  ),
  child: Container(
    width: 250,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      gradient: const LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        Color(0xffFF375F),Color(0xffFF9F0A)
      ],)
    ),
    padding:const EdgeInsets.all(16.0), // Adjust the padding as needed
    child: const Wrap(
      children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.people,size: 18,),
            WSpace(10),
            Text(
              'View All Customers',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Icon(Icons.arrow_forward_ios,size: 15,)
          ],
        ),
      ],
    ),
  ),
);
  }
}

class ProfilePicture extends StatelessWidget {
  final String image;
  final double radius;
  final double width;
  final double height;
  const ProfilePicture({
   super.key,this.radius = 26,
   required this.image,this.height = 57, this.width = 57});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
          child: Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
              colors: [Color(0xff32D74B),Color(0xffFFD60A)],
                  )
            ),
          ),
        ),
        CircleAvatar(
          radius: radius,
          backgroundImage: AssetImage(image),
        )
      ],
    );
  }
}