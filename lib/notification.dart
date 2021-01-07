import 'package:flutter/material.dart';
import 'package:scheduler/model/notification_model.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Notifications> notificationList;
  @override
  void initState() {
    super.initState();
    notificationList = List();
    notificationList.add(Notifications(day: 'Today',time: '2:30 PM',name: 'Arvind',address: 'DLF Phase 3,Gurgaon'));
    notificationList.add(Notifications(day: 'Today',time: '2:30 PM',name: 'Arvind',address: 'DLF Phase 3,Gurgaon'));
    notificationList.add(Notifications(day: 'Today',time: '2:30 PM',name: 'Arvind',address: 'DLF Phase 3,Gurgaon'));
    notificationList.add(Notifications(day: 'Today',time: '2:30 PM',name: 'Arvind',address: 'DLF Phase 3,Gurgaon'));
  }
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
            child: Icon(Icons.arrow_back,color: Colors.white,size: 40,)),
          title: Padding(
            padding: const EdgeInsets.only(left:18.0),
            child: Text('Notifications',style: TextStyle(color: Colors.white,fontSize: 26),),
          ),
      ),
      body: Container(
        color: Colors.indigoAccent,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: notificationList.length,
            itemBuilder: (BuildContext context,int index){
              return Card(
                elevation: 6,
                margin: EdgeInsets.all(20),
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.indigoAccent,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(notificationList[index].day,style: TextStyle(
                            color: Colors.white,fontSize: 20
                          ),),
                          SizedBox(width: 20,),
                          Text("Meeting with "+notificationList[index].name,style: TextStyle(
                              color: Colors.white,fontSize: 20
                          ),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(notificationList[index].time,style: TextStyle(
                              color: Colors.white,fontSize: 16
                          ),),
                          SizedBox(width: 20,),
                          Text(notificationList[index].address,style: TextStyle(
                              color: Colors.white,fontSize: 20
                          ),)
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        );
     }
  }
