import 'package:event_management/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'edit_profile.dart';

Future<void> fetchData() async {
  var url = Uri.parse('http://localhost:8080/api/users/get');
  try {
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      // Handle successful response
      print('Response data: ${response.body}');
    } else {
      // Handle error response
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    // Handle any exceptions
    print('Error: $e');
  }
}
class ProfilePage extends StatelessWidget {
  final String firstName = 'John';
  final String lastName = 'Doe';
  final String username = 'johndoe123';
  final String email = 'johndoe@example.com';
  final String phoneNumber = '+1234567890';
  final String studentID = '2110001';
  final String joinDate = 'January 1, 2023';


  // void fetchData() async {
  //   var url = Uri.parse('https://40ab-95-214-211-133.ngrok-free.app/api/users/get'); // Replace with your server's endpoint
  //   try {
  //     var response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body);
  //       print(data);
  //     } else {
  //       print('Request failed with status: ${response.statusCode}.');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     var response = await http.get(url);
  //     print(response.body);
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Profile', style: TextStyle( fontSize: 24.0, fontWeight: FontWeight.bold,)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              fetchData();
              //Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 24.0),
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: 350,
                    height: 1000,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _buildInfoItem('First Name', firstName),
                            _buildInfoItem('Last Name', lastName),
                            _buildInfoItem('Username', username),
                            _buildInfoItem('Email', email),
                            _buildInfoItem('Phone Number', phoneNumber),
                            _buildInfoItem('Student ID', studentID),
                            _buildInfoItem('Join Date', joinDate),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}