import 'package:flutter/material.dart';
import 'modules.dart';
import 'add_event_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}


class _HomePageState extends State<HomePage> {
  bool _filterApplied = false;
  List<Event> events = [];
  void initState() {
    super.initState();
    fetchData();
  }


  void fetchData() async {
    var url = Uri.parse('http://localhost:8080/api/events/get');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        setState(() {
          events = data.map((json) => Event.fromJson(json)).toList();
        });
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  // List<Event> events = [
  //   Event(
  //     name: 'Event 1',
  //     description: 'Description 1',
  //     place: 'Place 1',
  //     startTime: DateTime.now(),
  //     endTime: DateTime.now().add(Duration(hours: 1)),
  //     cost: 10.0,
  //     type: 'Type 1',
  //   ),
  //   Event(
  //     name: 'Event 2',
  //     description: 'Description 2',
  //     place: 'Place 2',
  //     startTime: DateTime.now().add(Duration(days: 1)),
  //     endTime: DateTime.now().add(Duration(days: 1, hours: 1)),
  //     cost: 20.0,
  //     type: 'Type 2',
  //   ),
  //   Event(
  //     name: 'Event 3',
  //     description: 'Description 2',
  //     place: 'Place 2',
  //     startTime: DateTime.now().add(Duration(days: 1)),
  //     endTime: DateTime.now().add(Duration(days: 1, hours: 1)),
  //     cost: 0,
  //     type: 'Type 2',
  //   ),
  // ];

  List<Event> getFilteredEvents(List<Event> events) {
    if (_filterApplied) {
      return events.where((event) => (event.cost == 0 || event.cost.isNaN)).toList();
    }
    return events;
  }

  @override
  Widget build(BuildContext context) {
    List<Event> filteredEvents = getFilteredEvents(events);

    return Scaffold(
      appBar: AppBar(
        title: Text('Event Management and Registration'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          IconButton(
              onPressed: (){Navigator.pushNamed(context, '/upcoming');},
              icon: Icon(Icons.calendar_month_outlined)
          ),
          IconButton(
            icon: Icon(_filterApplied ? Icons.filter_alt : Icons.filter_alt_off),
            onPressed: () {
              setState(() {
                _filterApplied = !_filterApplied;
              });
            },
          ),
        ],
      ),
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
              itemCount: filteredEvents.length,
              itemBuilder: (context, index) {
                final event = filteredEvents[index];
                return EventWidget(
                  id: event.id,
                  name: event.name,
                  description: event.description,
                  place: event.place,
                  startTime: event.startTime,
                  endTime: event.endTime,
                  cost: event.cost,
                  type: event.type,
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
