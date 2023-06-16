import 'package:flutter/material.dart';
import 'package:tsf_bank/custom_widget.dart';
import 'package:tsf_bank/text_styling.dart';
import 'package:tsf_bank/views/user_pin.dart';
import 'package:flutter_laravel_form_validation/flutter_laravel_form_validation.dart';

class TransferScreen extends StatefulWidget {
  final List selectedInfo;
  final int index;
  const TransferScreen({super.key,required this.selectedInfo,required this.index});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer Money"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const ProfilePicture(image:"assets/images/p_pic.jpg",radius: 40,width: 85,height: 85,),
                  const HSpace(15),
                  Text(widget.selectedInfo[widget.index]["name"],style: styleBig(),),
                  const HSpace(10),
                  Text(widget.selectedInfo[widget.index]["phone"],style: styleSmall(),),
                  Text("Amount",style: styleSmall(),),
                  const HSpace(10),
                  TextFormField(
                    controller: _controller,
                     validator : "required".v,
                    keyboardType: TextInputType.number,
                    style: styleSmall(),
                    cursorColor: const Color(0xffFF9F0A),
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                      borderSide:  BorderSide(
                        color: Color(0xffFF9F0A),
                      ),
                    ),
                      enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white60,
                        width: 2.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red
                      )
                    ),
                  ),
                  ),
                  const HSpace(20),
                  Text("Remark",style: styleSmall(),),
                  const HSpace(10),
                  TextFormField(
                    style: styleSmall(),
                    cursorColor: const Color(0xffFF9F0A),
                     decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                      borderSide:  BorderSide(
                        color: Color(0xffFF9F0A),
                      ),
                    ),
                      enabledBorder: OutlineInputBorder(
                      borderSide:  BorderSide(
                        color: Colors.white60,
                        width: 2.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green
                      )
                    ),
                  ),
                  ),
                  const HSpace(40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                    onPressed: (){
                      FocusScope.of(context).unfocus();
                      if(!_formKey.currentState!.validate()){
                        return ;
                      }
                      else{
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        Pin(name : widget.selectedInfo[widget.index]["name"],
                        account: widget.selectedInfo[widget.index]["phone"],
                        amount: _controller.text
                       )));
                    }},
                     child:Container(
                      width: MediaQuery.of(context).size.width,
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
                      child:const Center(
                        child: Text(
                          'Proceed to payment',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),)
                ]),
            ),
          ),
        ),
      ),
    );
  }
}
