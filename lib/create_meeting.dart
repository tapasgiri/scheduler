import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:scheduler/dialogs.dart';
import 'package:scheduler/shared_pref.dart';
import 'package:scheduler/place_search.dart';
import 'package:scheduler/meeting_screen.dart';

class CreateMeeting extends StatefulWidget {
  @override
  _CreateMeetingState createState() => _CreateMeetingState();
}

class _CreateMeetingState extends State<CreateMeeting> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay _time;
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  final formKey = new GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String meetingName;
  String meetingDate;
  String meetingTime;
  String meetingContact;
  String userId;

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      _showProgressDialog();
       createMeeting();
    }
  }

  @override
  void initState() {
    super.initState();
    _time = TimeOfDay.now();
    StorageUtil.getInstance();
    userId = StorageUtil.getUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        toolbarHeight: 90,
        leading: GestureDetector(
          onTap: (){
           // Navigator.pop(context);
            Route route = MaterialPageRoute(builder: (context) => MeetingScreen(userId));
            Navigator.pushReplacement(context, route);
          },
            child: Icon(Icons.arrow_back,color: Colors.white,size: 28,)),
        title: Text('Create Meeting',style: TextStyle(color: Colors.white,fontSize: 28),),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.indigo, Colors.deepPurple])),

          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Column(
                children: [
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
                                decoration: InputDecoration.collapsed(hintText: 'Meeting name'),
                                onSaved: (val)=>meetingName = val,
                                validator: (val){
                                  if(val.isEmpty){
                                    return 'Enter meeting';
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
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    fit: FlexFit.tight,
                                    child: TextFormField(
                                      controller: _dateController,
                                      onSaved: (val)=> meetingDate = val,
                                      decoration: InputDecoration.collapsed(
                                          hintText: 'Date',
                                      ),
                                     // onSaved: (val)=>_password = val,
                                      validator: (val){
                                        if(val.isEmpty){
                                          return 'Enter date';
                                        }else{
                                          return null;
                                        }
                                      },

                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                      onTap: (){
                                        _selectDate(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.calendar_today_rounded),
                                      ))
                                ],
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
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    fit: FlexFit.tight,
                                    child: TextFormField(
                                      controller: _timeController,
                                      onSaved: (val)=> meetingTime = val,
                                      validator: (val){
                                        if(val.isEmpty){
                                          return 'Enter time';
                                        }
                                      },
                                      decoration: InputDecoration.collapsed(hintText: 'Time'),
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: (){
                                        _pickTime();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.timer),
                                      ))
                                ],
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
                                onSaved: (val)=> meetingContact = val,
                                validator: (val){
                                  if(val.isEmpty){
                                    return 'Enter contact';
                                  }
                                },
                                decoration: InputDecoration.collapsed(hintText: 'Contact'),
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                buildCounter: (BuildContext context, { int currentLength, int maxLength, bool isFocused }) => null,
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
    );
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
  }
 /* Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });}*/

      _pickTime() async{
          TimeOfDay time = await showTimePicker(context: context,
              initialTime: _time,
          builder: (BuildContext cotext, Widget child){
            return Theme(data: ThemeData(), child: child);
          });
          if(time!=null){
            setState(() {
              _time = time;
              _timeController.text = "${time.hour}:${time.minute}";
            });
          }
      }

  void createMeeting() async {
    Map data = {'meetingName': meetingName,
                 'meetingDate':meetingDate,
                 'meetingtime':meetingTime,
                 'meetingType':true,
                 'meetingcompleted':true,
                 'meetingContact':meetingContact,
                 'user_id':userId,
               };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(
        'https://meetingscheduledata.herokuapp.com/api/v1/meeting',
        headers: {"Content-Type": "application/json"},
        body: body);
    print("Request Body: "+body);
    print("RESPONSE ${response.statusCode} ; BODY = ${response.body}");
    _hideProgressDialog();

    if (response.statusCode == 200) {
   /*   Map<String, dynamic> userMap = jsonDecode(response.body);
      var user = LoginResponse.fromJson(userMap);
      Route route = MaterialPageRoute(builder: (context) => MeetingScreen(user.body.id));
      Navigator.pushReplacement(context, route);*/

      Route route = MaterialPageRoute(builder: (context) => PlaceSearch());
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
    Dialogs.showLoadingDialog(context, _keyLoader);
  }
  void _hideProgressDialog() {
    Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
  }
}
