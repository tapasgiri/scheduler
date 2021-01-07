
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:scheduler/dialogs.dart';
import 'package:scheduler/meeting_screen.dart';
import 'package:scheduler/model/sign_up_response.dart';
import 'package:scheduler/shared_pref.dart';

class CompleteAccount extends StatefulWidget {
  @override
  _CompleteAccountState createState() => _CompleteAccountState();
}

class _CompleteAccountState extends State<CompleteAccount> {
  BuildContext _ctx;
  // ProgressDialog pr;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _password;
  String _confirmPassword;
  String _email;

  @override
  void initState() {
    super.initState();

    StorageUtil.getInstance();
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
       form.save();
      _showProgressDialog();
      __signUp();
    }
  }
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
                    padding: const EdgeInsets.only(top:58.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              GestureDetector(
                                 onTap:(){
                                    Navigator.pop(context);
                                  },
                                  child:
                                   Icon(Icons.arrow_back,color: Colors.white,size: 30,)),
                                   SizedBox(width: 24),
                                   Text('Create Account',
                                style:
                                TextStyle(color: Colors.white,fontSize: 25,letterSpacing: 2,fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),

                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(25,50,25,10),
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:18.0),
                                    child: TextFormField(
                                      decoration: InputDecoration.collapsed(hintText: 'Email'),
                                      onSaved: (val)=>_email = val,
                                      validator: (val){
                                        if(val.isEmpty){
                                          return 'Please enter email';
                                        }else{
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(25,30,25,10),
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:18.0),
                                    child: TextFormField(
                                      obscureText: true,
                                      decoration: InputDecoration.collapsed(hintText: 'Password'),
                                      onSaved: (val)=>_password = val,
                                      validator: (val){
                                        if(val.isEmpty){
                                          return 'Please enter password';
                                        }else{
                                          return null;
                                        }
                                      },

                                    ),
                                  ),
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.fromLTRB(25,30,25,10),
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:18.0),
                                    child: TextFormField(
                                      obscureText: true,
                                      onSaved: (val)=> _confirmPassword = val,
                                      validator: (val){
                                        if(val.isEmpty){
                                          return 'Confirm your password';
                                        }
                                      },
                                      decoration: InputDecoration.collapsed(hintText: 'Confirm Password'),

                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                           /* Navigator.push(context, MaterialPageRoute(builder:
                                (context)=>MeetingScreen()));*/

                           _submit();
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 60),
                            width: 170,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Center(child: Text('Go',style:
                            TextStyle(color: Colors.white,fontSize: 16),)),
                            
                          ),
                        ),
                       /* Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: GestureDetector(
                             onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder:
                                   (context)=>MeetingScreen()));
                             },
                              child: Text('SKIP',style: TextStyle(color: Colors.grey,fontSize: 22),)),
                        )*/
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }

  __signUp() async {
    Map data = {
      'email': _email,
      'password': _password,
    };
    //encode Map to JSON
    var body = json.encode(data);
    print('Request Body: ***'+ body);
    var response = await http.post(
        'https://meetingscheduledata.herokuapp.com/api/v1/user/signup',
        headers: {"Content-Type": "application/json"},
        body: body);
    print("RESPONSE ${response.statusCode} ; BODY = ${response.body}");
    _hideProgressDialog();

    if (response.statusCode == 200) {
      Map userMap = jsonDecode(response.body);
      var user = SignUpResponse.fromJson(userMap);
      print('Signup response ****, ${user.body}!');
      // var otp = map['data']['otp'];
      // print('OTP: ' + otp);
     // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MeetingScreen()));
      StorageUtil.saveUserId(user.body.id);
      StorageUtil.setLoginStatus(true);
      Route route = MaterialPageRoute(builder: (context) => MeetingScreen(user.body.id));
      Navigator.pushReplacement(context, route);
    } else {
      Map<String, dynamic> map = jsonDecode(response.body);
      var message = map['message'];
      print('Error message' + message);
      showAlertDialog(context, message);
    }
  }
  showAlertDialog(BuildContext context, message) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Vyaaparee"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  void _showProgressDialog() {
    // pr.show();
    Dialogs.showLoadingDialog(context, _keyLoader);
  }

  void _hideProgressDialog() {
    //pr.hide();
    Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
  }
}
