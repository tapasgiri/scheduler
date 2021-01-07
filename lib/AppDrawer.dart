import 'package:flutter/material.dart';
import 'package:scheduler/notification.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top:50.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            //_createHeader(),
            _createDrawerItem(icon: Icons.contacts,text: 'Home',),
            _createDrawerItem(icon: Icons.event, text: 'Notification',),
            _createDrawerItem(icon: Icons.note, text: 'History',),
            _createDrawerItem(icon: Icons.collections_bookmark, text:'Meetings'),
            _createDrawerItem(icon: Icons.face, text: 'Map'),
            _createDrawerItem(icon: Icons.account_box, text: 'Terms & Condition'),

          ],
        ),
      ),
    );
  }

   Widget _createHeader() {
     return DrawerHeader(
         margin: EdgeInsets.zero,
         padding: EdgeInsets.zero,
         decoration: BoxDecoration(
             image: DecorationImage(
                 fit: BoxFit.fill,
                 image:  AssetImage(''))),
         child: Stack(children: <Widget>[
           Positioned(
               bottom: 12.0,
               left: 16.0,
               child: Text("Name",
                   style: TextStyle(
                       color: Colors.blueAccent,
                       fontSize: 20.0,
                       fontWeight: FontWeight.w500))),
         ]));
   }

  Widget _createDrawerItem({IconData icon, String text,GestureTapCallback onTap}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ListTile(
        title: Row(
          children: <Widget>[
            Icon(icon),
            Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Text(text,style: TextStyle(color: Colors.blueAccent[400],fontSize: 22),),
            )
          ],
        ),
        onTap: (){
        },
      ),
    );
  }
}
