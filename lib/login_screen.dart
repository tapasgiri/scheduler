import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scheduler/dialogs.dart';
import 'package:scheduler/meeting_screen.dart';
import 'package:scheduler/model/login_response_model.dart';
import 'package:scheduler/model/sign_up_response.dart';
import 'package:scheduler/shared_pref.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _password;
  String email;

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
      __signIn();
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
                                  child: Icon(Icons.arrow_back,
                                    color: Colors.white,size: 30,)),
                              SizedBox(width: 24),
                              Text('Log In',
                                style:
                                TextStyle(color: Colors.white,
                                    fontSize: 25,letterSpacing: 2,fontWeight: FontWeight.bold),
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
                                      onSaved: (val)=>email = val,
                                      validator: (val){
                                        if(val.isEmpty){
                                          return 'Please enter email';
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
                                          return 'Please enter password.';
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            _submit();
                          /*  Route route = MaterialPageRoute(builder: (context) => MeetingScreen(''));
                            Navigator.pushReplacement(context, route);*/
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 60),
                            width: 170,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Center(child: Text('Login',style:
                            TextStyle(color: Colors.white,fontSize: 16),)),
                          ),
                        ),
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

  __signIn() async {
      Map data = {'email': email,'password':_password};
      //encode Map to JSON
      var body = json.encode(data);
      var response = await http.post(
          'https://meetingscheduledata.herokuapp.com/api/v1/user/login',
          headers: {"Content-Type": "application/json"},
          body: body);
      print("RESPONSE ${response.statusCode} ; BODY = ${response.body}");
      _hideProgressDialog();

      if (response.statusCode == 200) {
        Map<String, dynamic> userMap = jsonDecode(response.body);
        var user = LoginResponse.fromJson(userMap);
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
      title: Text("Scheduler"),
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
    Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
  }
}
