import 'package:flutter/material.dart';
import 'package:tsf_bank/custom_widget.dart';
import 'package:tsf_bank/model/function.dart';

import '../text_styling.dart';

class TransferList extends StatefulWidget {
  const TransferList({super.key});

  @override
  State<TransferList> createState() => _TransferListState();
}

class _TransferListState extends State<TransferList> {
  List allTransfers = [];
  void getTransfer() async {
    var getransfer = await queryTransfer();
    setState(() {
      allTransfers = getransfer;
    });
  }
  @override
  void initState() {
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { getTransfer();});
    super.initState();
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction History"),
      ),
      body: ListView.builder(
        itemCount: allTransfers.length,
        itemBuilder: (context,index){
          return SingleChildScrollView(
              child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
                child:  GlowingOverscrollIndicator(
                  color: Colors.transparent,
                   axisDirection: AxisDirection.down,
                  child: Card(
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
                        leading:const  ProfilePicture(image: "assets/images/p_pic.jpg"),
                        title: Text(allTransfers[index]["receipent_name"],style: styleBig(),),
                        subtitle: Text(allTransfers[index]["receipent_number"].toString(),style: styleSmall(),),
                        trailing:  Text("\$${allTransfers[index]["amount_transfer"].toString()}",style: styleBig(),),
                      ),
                    ),
                  )
                ),
              ));
        }),
    );
  }
}