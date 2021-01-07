import 'package:flutter/material.dart';

class MeetingDetails extends StatefulWidget {
  MeetingDetails({this.meetingName, this.meetingDate, this.meetingTime, this.meetingContact});
  final String meetingName;
  final String meetingDate;
  final String meetingTime;
  final String meetingContact;
  @override
  _MeetingDetailsState createState() => _MeetingDetailsState();
}

class _MeetingDetailsState extends State<MeetingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(
         toolbarHeight: 80,
         backgroundColor: Colors.indigo,
         leading: Icon(Icons.arrow_back,color: Colors.white),
         title: Padding(
           padding: const EdgeInsets.only(left:48.0),
           child: Text('Meeting',style: TextStyle(color: Colors.white,fontSize: 20),),
         ),
       ),
       body: Center(
         child: Padding(
           padding: const EdgeInsets.all(28.0),
           child: Column(
             children: [
                Text(widget.meetingTime,style: TextStyle(color: Colors.indigo,fontSize: 34,fontWeight: FontWeight.w500),),
                SizedBox(height: 20),
                Text('Meeting with '+widget.meetingName,style:
                TextStyle(color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.w500),),
               SizedBox(height: 20),
               Text('Mobile No:'+widget.meetingContact,style:
               TextStyle(color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.w500),),
               SizedBox(height: 20),
               Text('Date:'+widget.meetingDate,style:
               TextStyle(color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.w500),),
             ],
           ),
         ),
       ),
    );
  }
}
