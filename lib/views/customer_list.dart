import 'package:flutter/material.dart';
import 'package:tsf_bank/custom_widget.dart';
import 'package:tsf_bank/text_styling.dart';
import 'package:tsf_bank/views/customer_detail.dart';



class CustomerListScreen extends StatefulWidget {
  final List usersInfo;
  const CustomerListScreen({required this.usersInfo, super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  final icon = const Icon(Icons.more_vert_outlined,color: Colors.white,);
  void customerAction(){}
  void viewCustomer(int index){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return  CustomerDetail(userInfo: widget.usersInfo,index: index);
    }));
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Customers") ,) ,
        body: ListView.builder(
          itemCount: widget.usersInfo.length,
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
                      child:index == 10 ? null : ListTile(
                        onTap: (){viewCustomer(index);},
                        leading:const  ProfilePicture(image: "assets/images/p_pic.jpg"),
                        title: Text(widget.usersInfo[index]["name"],style: styleBig(),),
                        subtitle: Text(widget.usersInfo[index]["phone"],style: styleSmall(),),
                      ),
                    ),
                  )
                ),
              ));
          }
          ),
    );
  }
}
 