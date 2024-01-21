import 'package:flutter/material.dart';
import 'modules.dart';
import 'add_event_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _filterApplied = true;
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
    Event(
      name: 'Event 3',
      description: 'Description 2',
      place: 'Place 2',
      startTime: DateTime.now().add(Duration(days: 1)),
      endTime: DateTime.now().add(Duration(days: 1, hours: 1)),
      cost: 0,
      type: 'Type 2',
    ),
  ];

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


// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Event Management and Registration',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   final List<Event> events = [
//     Event(
//       name: 'Event 1',
//       description: 'Description 1',
//       place: 'Place 1',
//       startTime: DateTime.now(),
//       endTime: DateTime.now().add(Duration(hours: 1)),
//       cost: 10.0,
//       type: 'Type 1',
//     ),
//     Event(
//       name: 'Event 2',
//       description: 'Description 2',
//       place: 'Place 2',
//       startTime: DateTime.now().add(Duration(days: 1)),
//       endTime: DateTime.now().add(Duration(days: 1, hours: 1)),
//       cost: 20.0,
//       type: 'Type 2',
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Event Management and Registration'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.person),
//             onPressed: () {
//               // Handle profile button press
//               Navigator.pushNamed(context, '/profile');
//             },
//           ),
//           IconButton(
//               onPressed: (){Navigator.pushNamed(context, '/upcoming');},
//               icon: Icon(Icons.calendar_month_outlined))
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Welcome to the Event Management and Registration Page!',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 24.0,
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: events.length,
//               itemBuilder: (context, index) {
//                 final event = events[index];
//                 return EventWidget(
//                   name: event.name,
//                   description: event.description,
//                   place: event.place,
//                   startTime: event.startTime,
//                   endTime: event.endTime,
//                   cost: event.cost,
//                   type: event.type,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           Navigator.pushNamed(context, '/addForm');
//         },
//       ),
//     );
//   }
// }

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
