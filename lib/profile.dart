
import 'package:flutter/material.dart';
import 'package:scheduler/home_screen.dart';
import 'package:scheduler/shared_pref.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    StorageUtil.getInstance();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
         children: [
           Expanded(
             flex: 2,
             child: Container(
               color: Colors.blue,
               width: MediaQuery.of(context).size.width,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Align(
                       alignment: Alignment.topLeft,
                       child: Padding(
                         padding: const EdgeInsets.only(left:18.0),
                         child: GestureDetector(
                           onTap: (){
                             Navigator.pop(context);
                           },
                             child: Icon(Icons.arrow_back,color: Colors.white,size: 40,)),
                       )),
                   Container(
                     width: 100,
                     height: 100,
                     child: CircleAvatar(
                       radius: 30,
                       backgroundImage: AssetImage('assets/virat_kohli.png'),
                     ),
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Text('Name',style:
                   TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                   SizedBox(
                     height: 20,
                   ),
                   Text('Address',style:
                   TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                 ],
               ),
             ),
           ),
           Expanded(
             flex: 2,
             child: Container(
               color: Colors.lightBlueAccent,
               padding: EdgeInsets.all(20),
               child: Column(
                 children: [
                   Row(
                     children: [
                       Icon(Icons.settings,color: Colors.white,size: 40,),
                       SizedBox(width: 10,),
                       Text('Accounts',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400))
                     ],
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Row(
                     children: [
                       Icon(Icons.help,color: Colors.white,size: 40,),
                       SizedBox(width: 10,),
                       Text('Help Center',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400))
                     ],
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Row(
                     children: [
                       Icon(Icons.account_box_outlined,color: Colors.white,size: 40,),
                       SizedBox(width: 10,),
                       Text('About',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400),)
                     ],
                   ),
                   SizedBox(
                     height: 25,
                   ),
                   GestureDetector(
                     onTap: (){
                       StorageUtil.setLoginStatus(false);
                       Route route = MaterialPageRoute(builder: (context)=>HomeScreen());
                       Navigator.pushReplacement(context, route);
                     },
                     child: Row(
                       children: [
                         Icon(Icons.logout,color: Colors.white,size: 40,),
                         SizedBox(width: 10,),
                         Text('Logout',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400),)
                       ],
                     ),
                   ),
                 ],
               ),
             ),
           )
         ],
       ),
    );
  }
}
