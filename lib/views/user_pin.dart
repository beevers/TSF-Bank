import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:tsf_bank/custom_widget.dart';
import 'package:tsf_bank/model/function.dart';
import 'package:tsf_bank/text_styling.dart';

class Pin extends StatefulWidget {
  final String name;
  final String  account;
  final String amount;
  const Pin({super.key,required this.name, required this.account, required this.amount});

  @override
  State<Pin> createState() => _PinState();
}

class _PinState extends State<Pin> {
  List user11 = [];
  dynamic user11Data;
  void addNewRow() async {
    user11Data = await query();
    setState(() {
      user11 = user11Data;
    });
  }
   @override
  void initState() {
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { addNewRow();});
    super.initState();
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Security Code"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OtpTextField(  
              clearText: true, 
              focusedBorderColor: const Color(0xffFF9F0A),
              cursorColor: const Color(0xffFF9F0A),
              textStyle: styleSmall(),
              showFieldAsBox: true,
              fieldWidth: 50,
              numberOfFields: 4,
              borderColor: const Color(0xffFF9F0A),
              // onCodeChanged: (String code) {
              //     print("changed");
              // },
              onSubmit: (String code) async { 
                showDialog(context: context, builder: (context){
                  return const Center(child: CircularProgressIndicator(color:Color(0xffFF9F0A) ),);
                }); 
                await Future.delayed(const Duration(seconds: 3),(){
                  final userdata = user11[10];
                  insertTransfers(widget.name,widget.account, widget.amount);
                  update(userdata["balance"],int.parse(widget.amount));
                  Navigator.pop(context);
                  openSheet(context);});
                
              }, // end onSubmit
            ),
            const HSpace(30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 50),
                backgroundColor:const Color(0xffFF9F0A) ),
              onPressed: (){
                openSheet(context);
              }, child: const Text("Enter"))
          ],
        ),
      ),
    );
  }
}

 
 void openSheet(context){
    showModalBottomSheet(
      isScrollControlled: true,
    shape: const OutlineInputBorder(
    borderSide: BorderSide.none,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),topRight: Radius.circular(20))
    ),
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                             gradient: const LinearGradient(
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                            colors: [
                              Color(0xffFF375F),Color(0xffFF9F0A)
                            ],),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: const Center(child: Icon(Icons.done,color: Colors.white,)),
                        ),
                        const WSpace(30),
                        const Text("Transfer Successful",style: TextStyle(fontSize: 18,color: Colors.black)),
                      ],
                    )
                      ,ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFF9F0A),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      fixedSize: const Size(253,55)
                      ),
                      onPressed: (){
                        Navigator.of(context).popUntil((route) => route.settings.name == '/');
                      }, child: Text("OK",
                        style: styleBig())
                      ),
                     const SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
          ],
        );
      });
  }