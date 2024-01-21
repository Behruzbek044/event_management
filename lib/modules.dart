import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final String name;
  final String description;
  final String place;
  final DateTime startTime;
  final DateTime endTime;
  final double cost;
  final String type;

  const EventWidget({
    Key? key,
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
    return Card(
      color: Colors.amberAccent,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(description),
            SizedBox(height: 8.0),
            Text('Location: $place'),
            SizedBox(height: 8.0),
            Text('Start Time: ${startTime.toString()}'),
            SizedBox(height: 8.0),
            Text('End Time: ${endTime.toString()}'),
            SizedBox(height: 8.0),
            Text('Cost: \$$cost'),
            SizedBox(height: 8.0),
            Text('Type: $type'),
          ],
        ),
      ),
    );
  }
}
