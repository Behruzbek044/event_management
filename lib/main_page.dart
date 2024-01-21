import 'package:flutter/material.dart';
import 'modules.dart';
import 'add_event_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Management and Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Event> events = [
    Event(
      name: 'Event 1',
      description: 'Description 1',
      place: 'Place 1',
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 1)),
      cost: 10.0,
      type: 'Type 1',
    ),
    Event(
      name: 'Event 2',
      description: 'Description 2',
      place: 'Place 2',
      startTime: DateTime.now().add(Duration(days: 1)),
      endTime: DateTime.now().add(Duration(days: 1, hours: 1)),
      cost: 20.0,
      type: 'Type 2',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Management and Registration'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Handle profile button press
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      // appBar: AppBar(
      //   title: Text('Event Management and Registration'),
      //   actions: [
      //     IconButton(
      //       alignment: Alignment.topLeft,
      //       icon: Icon(Icons.person),
      //       onPressed: () {
      //         Navigator.pushNamed(context, '/profile');},
      //     ),
      //     IconButton(
      //       icon: Icon(Icons.person),
      //       onPressed: () {
      //         Navigator.pushNamed(context, '/profile');},
      //     ),
      //   ],
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome to the Event Management and Registration Page!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return EventWidget(
                  name: 'Event 1',
                  description: 'Description 1',
                  place: 'Place 1',
                  startTime: DateTime.now(),
                  endTime: DateTime.now().add(Duration(hours: 1)),
                  cost: 10.0,
                  type: 'Type 1',
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/addForm');
        },
      ),
    );
  }
}

class Event {
  final String name;
  final String description;
  final String place;
  final DateTime startTime;
  final DateTime endTime;
  final double cost;
  final String type;

  const Event({
    required this.name,
    required this.description,
    required this.place,
    required this.startTime,
    required this.endTime,
    required this.cost,
    required this.type,
  });
}

class AddEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event'),
      ),
      body: Center(
        child: Text('Add Event Page'),
      ),
    );
  }
}
