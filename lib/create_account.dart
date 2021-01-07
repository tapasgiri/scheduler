import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:scheduler/complete_account.dart';


class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
                        Text('Create Account',
                          style: TextStyle(color: Colors.white,fontSize: 30,letterSpacing: 2,fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text('Put your name and create account',
                            style: TextStyle(color: Colors.grey,fontSize: 20),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(25,50,25,10),
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left:18.0),
                                child: TextField(
                                  decoration: InputDecoration.collapsed(hintText: 'Full Name'),

                                ),
                              ),
                            ),
                          ),

                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder:
                                (context)=>CompleteAccount()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 60),
                            width: 170,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Center(child: Text('Lets Start',style:
                            TextStyle(color: Colors.white,fontSize: 16),)),
                          ),
                        )
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
}
