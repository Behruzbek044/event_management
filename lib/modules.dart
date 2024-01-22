import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'event_page.dart'; // Import the EventPage

class Participant {
  final int id;
  final int userId;
  final int eventId;
  final String? role;  // Nullable since it can be null

  Participant({
    required this.id,
    required this.userId,
    required this.eventId,
    this.role,  // Nullable
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      id: json['id'],
      userId: json['userId'],
      eventId: json['eventId'],
      role: json['role'],  // Nullable
    );
  }
}


class User {
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String? username;  // Nullable since it can be null
  final String password;
  final DateTime joinedDate;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    this.username,  // Nullable
    required this.password,
    required this.joinedDate,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      username: json['username'],  // Nullable
      password: json['password'],
      joinedDate: DateTime.parse(json['joinedDate']),
    );
  }
}


class Event {
  final int id;
  final String name;
  final String description;
  final String? place; // Nullable since it can be null
  final DateTime startTime;
  final DateTime endTime;
  final double cost;
  final bool allDay;
  final String? type; // Nullable since it can be null

  Event({
    required this.id,
    required this.name,
    required this.description,
    this.place, // Nullable
    required this.startTime,
    required this.endTime,
    required this.cost,
    required this.allDay,
    this.type, // Nullable
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      place: json['place'], // Nullable
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      cost: json['cost'].toDouble(),
      allDay: json['allDay'],
      type: json['eventType'], // Nullable
    );
  }
}



class EventWidget extends StatelessWidget {
  final int id;
  final String? name;
  final String? description;
  final String? place;
  final DateTime? startTime;
  final DateTime? endTime;
  final double? cost;
  final String? type;

  EventWidget({
    Key? key,
    required this.id,
    required this.name,
    required this.description,
    required this.place,
    required this.startTime,
    required this.endTime,
    required this.cost,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle boldStyle = TextStyle(fontWeight: FontWeight.bold);

    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name ?? '', style: boldStyle.copyWith(fontSize: 18.0)),
            SizedBox(height: 8.0),
            buildEventDetails(),
          ],
        ),
        subtitle: buildEventActions(context),
      ),
    );
  }

  Widget buildEventDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description ?? ''),
            SizedBox(height: 8.0),
            Text('Location: ${place ?? ''}'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Start: ${_formatDateTime(startTime)}'),
            SizedBox(height: 8.0),
            Text('End: ${_formatDateTime(endTime)}'),
          ],
        ),
      ],
    );
  }

  Widget buildEventActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.0),
        Text('Cost: \$${cost?.toStringAsFixed(2) ?? '0.00'}', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8.0),
        Text('Type: ${type ?? ''}', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 16.0),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              // Ensure the EventPage constructor accepts these parameters
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventPage(eventId: '${id}'), // Update this line as needed
                ),
              );
            },
            child: Text('More >>'),
          ),
        ),
      ],
    );
  }

  String _formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return '';
    return DateFormat('MMM d, H:mm').format(dateTime); // Using DateFormat for formatting
  }
}
