import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/complete_account.dart';
import 'package:scheduler/login_screen.dart';
import 'package:scheduler/verify_otp.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = new GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _mobileNumber;
  TextEditingController  _textEditingController = TextEditingController();

  void _submit() {
    final form = formKey.currentState;
    form.save();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyOtpScreen(_mobileNumber)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Scheduler',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 46,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'On political overview',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Text(
                      'How scheduler will help?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Text(
                      '--> Schedule the meeting',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Text(
                      '--> Get notify upcoming meeting',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Text(
                      '--> Reschedule your meeting according to near by location',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2),
                    ),
                  ),
                 /* Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Text(
                      'Enter your mobile number',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2),
                    ),
                  ),*/

                  /*Container(
                    height: 55,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(5),right: Radius.circular(20)),
                        color: Colors.white
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            height: 55,
                            color: Colors.grey[200],
                            child: Center(child: Text('+91')),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          fit: FlexFit.tight,
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Form(
                              key: formKey,
                              child: Center(
                                  child: TextFormField(
                                    onSaved: (val) => _mobileNumber = val,
                                    controller: _textEditingController,
                                    validator: (val) {
                                      if (val.length < 10) {
                                        return 'Incorrect mobile number';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration.collapsed(
                                      hintText: 'Mobile Number',
                                    ),
                                    keyboardType: TextInputType.number,
                                  )),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: GestureDetector(
                            onTap: (){
                              _submit();
                            },
                            child: Container(
                              height: 55,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.horizontal(left: Radius.circular(0),right: Radius.circular(20))
                              ),
                              child: Center(child: Icon(Icons.arrow_forward,color: Colors.white,)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),*/

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,50,20,20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder:
                                  (context)=>LoginScreen()));
                            },
                            child: Container(
                              width: 120,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.redAccent
                              ),
                              child: Center(
                                child: Text('SignIn',
                                  style: TextStyle(color: Colors.white,fontSize: 20),),
                              ),
                            )),
                        SizedBox(width: 20,),
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder:
                                  (context)=>CompleteAccount()));
                            },
                            child: Container(
                              width: 120,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green,
                              ),
                              child: Center(
                                child: Text('SignUp',
                                  style: TextStyle(color: Colors.white,fontSize: 20),),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
