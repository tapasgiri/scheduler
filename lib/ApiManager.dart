import 'dart:convert';
import 'package:scheduler/model/location.dart';
import 'package:http/http.dart' as http;
import 'package:scheduler/model/user_meetings.dart';

class ApiManager{
  Future<LocationModel> getLocationDetails() async{
    var client = http.Client();
    var locationDetails = null;
    //print('*** token ** $token');
    var response = await client.get('https://schedulercons.herokuapp.com/api/v1/country');
    print("RESPONSE ${response.statusCode} ; BODY = ${response.body}");
    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      locationDetails = LocationModel.fromJson(jsonMap);
    }
    return locationDetails;
  }

  Future<Meetings> getMeetings(String userId) async{
    var client = http.Client();
    var meetingDetails = null;
    //print('*** token ** $token');
    var response = await client.get('https://meetingscheduledata.herokuapp.com/api/v1/meeting/$userId');
   // var response = await client.get('https://myconstituency.herokuapp.com/api/v1/meeting');
    print("RESPONSE ${response.statusCode} ; BODY = ${response.body}");
    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      meetingDetails = Meetings.fromJson(jsonMap);
    }
    return meetingDetails;
  }
  Future<Meetings> getUser(String userId) async{
    var client = http.Client();
    var meetingDetails = null;
    //print('*** token ** $token');
    var response = await client.get('https://meetingscheduledata.herokuapp.com/api/v1/user/getuser?$userId');
    // var response = await client.get('https://myconstituency.herokuapp.com/api/v1/meeting');
    print("RESPONSE ${response.statusCode} ; BODY = ${response.body}");
    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      meetingDetails = Meetings.fromJson(jsonMap);
    }
    return meetingDetails;
  }
}