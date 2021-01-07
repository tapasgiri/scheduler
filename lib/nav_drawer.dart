import 'package:flutter/material.dart';
import 'package:scheduler/history.dart';
import 'package:scheduler/notification.dart';
import 'package:scheduler/terms.dart';
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top:50.0),
        child: ListView(
          children: [
            Container(
               height: MediaQuery.of(context).size.height,
               color: Colors.white,
               child: Column(
                 children: [
                   ListTile(
                     title: Row(
                       children: <Widget>[
                         Icon(Icons.home),
                         Padding(
                           padding: EdgeInsets.only(left: 18.0),
                           child: Text('Home',style: TextStyle(color: Colors.blueAccent[400],fontSize: 22),),
                         )
                       ],
                     ),
                     onTap: (){
                        Navigator.pop(context);
                     },
                   ),
                   ListTile(
                     title: Row(
                       children: <Widget>[
                         Icon(Icons.notifications),
                         Padding(
                           padding: EdgeInsets.only(left: 18.0),
                           child: Text('Notification',style: TextStyle(color: Colors.blueAccent[400],fontSize: 22),),
                         )
                       ],
                     ),
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder:
                           (context)=>NotificationScreen()));
                     },
                   ),
                   ListTile(
                     title: Row(
                       children: <Widget>[
                         Icon(Icons.history),
                         Padding(
                           padding: EdgeInsets.only(left: 18.0),
                           child: Text('History',style: TextStyle(color: Colors.blueAccent[400],fontSize: 22),),
                         )
                       ],
                     ),
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder:
                           (context)=>History()));
                     },
                   ),
                   ListTile(
                     title: Row(
                       children: <Widget>[
                         Icon(Icons.meeting_room),
                         Padding(
                           padding: EdgeInsets.only(left: 18.0),
                           child: Text('Meetings',style: TextStyle(color: Colors.blueAccent[400],fontSize: 22),),
                         )
                       ],
                     ),
                     onTap: (){
                       Navigator.pop(context);
                     },
                   ),
                   ListTile(
                     title: Row(
                       children: <Widget>[
                         Icon(Icons.map),
                         Padding(
                           padding: EdgeInsets.only(left: 18.0),
                           child: Text('Map',style: TextStyle(color: Colors.blueAccent[400],fontSize: 22),),
                         )
                       ],
                     ),
                     onTap: (){
                       Navigator.pop(context);
                     },
                   ),
                   ListTile(
                     title: Row(
                       children: <Widget>[
                         Icon(Icons.outlet),
                         Padding(
                           padding: EdgeInsets.only(left: 18.0),
                           child: Text('Terms & Condition',style: TextStyle(color: Colors.blueAccent[400],fontSize: 22),),
                         )
                       ],
                     ),
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder:
                           (context)=>TermsCondition()));
                     },
                   ),
                 ],
               ),
            )
          ],
        ),
      ),
    );
  }
}
