import 'package:flutter/material.dart';
import 'package:scheduler/AddressSearch.dart';
import 'package:uuid/uuid.dart';

import 'model/place_service.dart';

class PlaceSearch extends StatefulWidget {
  PlaceSearch({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _PlaceSearchState createState() => _PlaceSearchState();
}

class _PlaceSearchState extends State<PlaceSearch> {
  final _controller = TextEditingController();
  String _streetNumber = '';
  String _street = '';
  String _city = '';
  String _zipCode = '';
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Meeting Address'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            onTap: () async {
              // generate a new token here
              final sessionToken = Uuid().v4();
              final Suggestion result = await showSearch(
                context: context,
                delegate: AddressSearch(sessionToken),
              );
              // This will change the text displayed in the TextField
              if (result != null) {
                final placeDetails = await PlaceApiProvider(sessionToken)
                    .getPlaceDetailFromId(result.placeId);
                setState(() {
                  _controller.text = result.description;
                  _streetNumber = placeDetails.streetNumber;
                  _street = placeDetails.street;
                  _city = placeDetails.city;
                  _zipCode = placeDetails.zipCode;
                });
              }
            },
            // with some styling
            decoration: InputDecoration(
              icon: Container(
                margin: EdgeInsets.only(left: 20),
                width: 10,
                height: 10,
                child: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
              ),
              hintText: "Enter your meeting address",
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 8.0, top: 16.0),
            ),
          ),
          SizedBox(height: 20.0),
          Text('Street Number: $_streetNumber'),
          Text('Street: $_street'),
          Text('City: $_city'),
          Text('ZIP Code: $_zipCode'),

       /*   GestureDetector(
              onTap: (){
                *//*Navigator.push(context, MaterialPageRoute(builder:
                    (context)=>LoginScreen()));*//*
              },
              child: Center(
                child: Container(
                  width: 150,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent
                  ),
                  child: Center(
                    child: Text('Next',
                      style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                ),
              )),*/
           ],
      ),
    );
  }
}
