import 'package:flutter/material.dart';
import 'package:scheduler/create_account.dart';

class VerifyOtpScreen extends StatefulWidget {
  String mobileNumber;
  VerifyOtpScreen(this.mobileNumber);
  @override
  _VerifyOtpScreenState createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child: SingleChildScrollView(
           child: Center(
             child: Container(
               height: MediaQuery.of(context).size.height,
               decoration: BoxDecoration(
                   gradient: LinearGradient(
                       begin: Alignment.topRight,
                       end: Alignment.bottomLeft,
                       colors: [Colors.indigo, Colors.deepPurple])),
               child: Center(
                   child: Padding(
                     padding: const EdgeInsets.only(top:100.0),
                     child: Column(
                      children: [
                         Text('Verification Code',style:
                         TextStyle(color: Colors.white,fontSize: 30,
                             fontWeight: FontWeight.bold,letterSpacing: 2),
                         ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,20,10,20),
                          child: Center(
                            child: Text('SMS with Code has been sent to '+
                                '85748574857',style:
                            TextStyle(color: Colors.grey,fontSize: 22,
                                letterSpacing: 2),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:35.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.white)),
                                child: Center(
                                  child: TextField(
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration.collapsed(
                                        hintText: null),
                                    enableInteractiveSelection: false,
                                    keyboardType: TextInputType.number,
                                    maxLength: 1,
                                    buildCounter: (BuildContext context, { int currentLength, int maxLength, bool isFocused }) => null,
                                  ),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.white)),
                                child: Center(
                                  child: TextField(
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 24,
                                          fontWeight: FontWeight.bold
                                      ),
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration.collapsed(
                                          hintText: null),
                                      enableInteractiveSelection: false,
                                      keyboardType: TextInputType.number,
                                      maxLength: 1,
                                      buildCounter: (BuildContext context, { int currentLength, int maxLength, bool isFocused }) => null,
                                  ),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.white)),
                                child: Center(
                                  child: TextField(
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration.collapsed(
                                          hintText: null),
                                      enableInteractiveSelection: false,
                                      keyboardType: TextInputType.number,
                                      maxLength: 1,
                                      buildCounter: (BuildContext context, { int currentLength, int maxLength, bool isFocused }) => null,
                                  ),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.white)),
                                child: Center(
                                  child: TextField(
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration.collapsed(
                                          hintText: null),
                                      enableInteractiveSelection: false,
                                      keyboardType: TextInputType.number,
                                      maxLength: 1,
                                      buildCounter: (BuildContext context, { int currentLength, int maxLength, bool isFocused }) => null,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder:
                                (context)=>CreateAccount()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 50),
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(child: Text('Next',style:
                            TextStyle(color: Colors.white,fontSize: 16),)),
                          ),
                        )
                      ],
                    )
                   ),
             ),
           ),
         ),
         ),
       )
    );
  }
}
