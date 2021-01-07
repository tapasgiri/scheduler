import 'package:flutter/material.dart';
import 'package:scheduler/ApiManager.dart';
import 'package:scheduler/AppDrawer.dart';
import 'package:scheduler/create_meeting.dart';
import 'package:scheduler/meeting_details.dart';
import 'package:scheduler/model/meeting_time.dart';
import 'package:scheduler/model/user_meetings.dart';
import 'package:scheduler/nav_drawer.dart';
import 'package:scheduler/notification.dart';
import 'package:scheduler/profile.dart';

class MeetingScreen extends StatefulWidget {
  String userId;
  MeetingScreen(this.userId);

  @override
  _MeetingScreenState createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  List<MeetingTime> meetingLIst;
  Future<Meetings> _meetingDetails;
  @override
  void initState() {
    super.initState();
    /* meetingLIst = List();
    meetingLIst.add(MeetingTime(time: '3:30 PM',day: 'Today'));
    meetingLIst.add(MeetingTime(time: '3:30 PM',day: 'Today'));
    meetingLIst.add(MeetingTime(time: '3:30 PM',day: 'Today'));
    meetingLIst.add(MeetingTime(time: '3:30 PM',day: 'Today'));
    meetingLIst.add(MeetingTime(time: '3:30 PM',day: 'Today'));*/

    _meetingDetails = ApiManager().getMeetings(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
        toolbarHeight: 80,
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
                size: 34,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()));
              }),
          SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/virat_kohli.png'),
              ),
            ),
          )
        ],
      ),
      drawer: /*AppDrawer()*/ NavDrawer(),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateMeeting()));
          },
          child: Icon(Icons.add),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.my_location_sharp),
                      suffixIcon: Icon(Icons.search)),
                ),
              ),
              FutureBuilder<Meetings>(
                future: _meetingDetails,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      return Container(
                        height: 230,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.body.meetings.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                             /* MeetingDetails(snapshot.data.body.meetings[index].meetingName,
                                                  snapshot.data.body.meetings[index].meetingDate,
                                                  snapshot.data.body.meetings[index].meetingtime,
                                                  snapshot.data.body.meetings[index].meetingContact)));*/
                                  MeetingDetails(meetingName: snapshot.data.body.meetings[index].meetingName,
                                                 meetingDate: snapshot.data.body.meetings[index].meetingDate.toString(),
                                                 meetingTime: snapshot.data.body.meetings[index].meetingtime,
                                                 meetingContact: snapshot.data.body.meetings[index].meetingContact
                                  )
                                      )
                                                 );

                                },
                                child: Container(
                                  child: Stack(
                                    overflow: Overflow.visible,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 0),
                                        height: 220,
                                        width: 200,
                                        child: Card(
                                          elevation: 5,
                                          color: Colors.indigo[100],
                                          child: Padding(
                                            padding: EdgeInsets.all(7),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        snapshot
                                                            .data
                                                            .body
                                                            .meetings[index]
                                                            .meetingName,
                                                        style: TextStyle(
                                                            color: Colors
                                                                    .blueAccent[
                                                                400],
                                                            fontSize: 28),
                                                      )),
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        snapshot
                                                            .data
                                                            .body
                                                            .meetings[index]
                                                            .meetingContact,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.blueGrey,
                                                            fontSize: 20),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 70,
                                        height: 50,
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Icon(
                                            Icons.navigation,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    }
                  } else {
                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'No meetings Found.',
                        style: TextStyle(fontSize: 20),
                      ),
                    ));
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Row(
                  children: [
                    Text(
                      'Near by Mettings',
                      style: TextStyle(
                          color: Colors.blueAccent[400],
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text('View All',
                        style: TextStyle(
                            color: Colors.blueAccent[400],
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),

              /*  ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: stateList.length,
                  itemBuilder: (BuildContext context,int index){
                    return Container(
                      height: 100,
                      margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.indigo[100],
                        elevation: 6,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:28.0),
                              child: Text('AREA',style: TextStyle(
                                  color: Colors.blueAccent[400],fontSize: 24,fontWeight: FontWeight.bold),),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right:18.0),
                              child: Text(stateList[index],style: TextStyle(
                                  color: Colors.blueAccent[400],fontSize: 20,fontWeight: FontWeight.bold),),
                            )

                          ],
                        ),
                      ),
                    );
                  }),*/

              Container(
                height: 100,
                margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.indigo[100],
                  elevation: 6,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Text(
                          'AREA',
                          style: TextStyle(
                              color: Colors.blueAccent[400],
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Text(
                          'Sector 62, Noida',
                          style: TextStyle(
                              color: Colors.blueAccent[400],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.indigo[100],
                  elevation: 6,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Text(
                          'AREA',
                          style: TextStyle(
                              color: Colors.blueAccent[400],
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Text(
                          'Sector 62, Noida',
                          style: TextStyle(
                              color: Colors.blueAccent[400],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.indigo[100],
                  elevation: 6,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Text(
                          'AREA',
                          style: TextStyle(
                              color: Colors.blueAccent[400],
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Text(
                          'Sector 62, Noida',
                          style: TextStyle(
                              color: Colors.blueAccent[400],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  'Current Location',
                  style: TextStyle(
                      color: Colors.blueAccent[400],
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.indigo[100],
                  elevation: 6,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Text(
                          'AREA',
                          style: TextStyle(
                              color: Colors.blueAccent[400],
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Text(
                          'Sector 62, Noida',
                          style: TextStyle(
                              color: Colors.blueAccent[400],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.indigo[100],
                  elevation: 6,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Text(
                          'AREA',
                          style: TextStyle(
                              color: Colors.blueAccent[400],
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Text(
                          'Sector 62, Noida',
                          style: TextStyle(
                              color: Colors.blueAccent[400],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.indigo[100],
                  elevation: 6,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Text(
                          'AREA',
                          style: TextStyle(
                              color: Colors.blueAccent[400],
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Text(
                          'Sector 62, Noida',
                          style: TextStyle(
                              color: Colors.blueAccent[400],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
