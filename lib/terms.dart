import 'package:flutter/material.dart';

class TermsCondition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        toolbarHeight: 90,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back,color: Colors.white,size: 28,)),
        title: Text('Terms & Condition',style: TextStyle(color: Colors.white,fontSize: 24),),
      ),
      body: Container(

      ),
    );
  }
}
