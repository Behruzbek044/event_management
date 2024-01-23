import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'main_page.dart';


class EventForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EventFormPage(),
    );
  }
}

class EventFormPage extends StatefulWidget {
  @override
  _EventFormPageState createState() => _EventFormPageState();
}

class _EventFormPageState extends State<EventFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _placeController = TextEditingController();
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  double? _cost;
  String? _selectedType;

  List<String> _eventTypes = ['Offline', 'Online', 'Hybrid'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Event'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[

              TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Event Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter event name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 5,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter description';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _placeController,
              decoration: InputDecoration(labelText: 'Place'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter event place';
                }
                return null;
              },
            ),
            DateTimePicker(
              type: DateTimePickerType.dateTimeSeparate,
              initialValue: _startDate.toString(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              dateLabelText: 'Start Date',
              timeLabelText: 'Start Time',
              onChanged: (dateTime) =>
                  setState(() => _startDate = DateTime.parse(dateTime!)),
            ),
            DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                initialValue: _endDate.toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                dateLabelText: 'End Date',
                timeLabelText: 'End Time',
                onChanged: (dateTime) =>
                    setState(() => _endDate = DateTime.parse(dateTime!)),
      //           DateTime _startDate = DateTime.now();
      //       DateTime _endDate = DateTime.now();
      //   DateTimePicker(
      //   type: DateTimePickerType.dateTimeSeparate,
      //   dateMask: 'yyyy-MM-dd',
      //   initialValue: DateTime.now().toString(),
      //   firstDate: DateTime(2000),
      //   lastDate: DateTime(2100),
      //   icon: Icon(Icons.event),
      //   onChanged: (val) {
      //     print(val);
      //     setState(() {
      //       _startDate = DateTime.parse(val);
      //     });
      //   },
      //   validator: (val) {
      //     if (_endDate.isBefore(_startDate)) {
      //       return 'End time cannot be before start time';
      //     }
      //     return null;
      //   },
      //   onSaved: (val) {
      //     print(val);
      //   },
      // ),
              ),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Cost'),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _cost = double.parse(value);
                  }
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedType,
                items: _eventTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedType = value!;
                  });
                },
                decoration: InputDecoration(labelText: 'Event Type'),
                validator: (_selectedType) {
                  if (_selectedType!.isEmpty) {
                    return 'Please select event type';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/home');
                    _submitForm();
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    // Perform actions with the form data
    print('Event Name: ${_nameController.text}');
    print('Description: ${_descriptionController.text}');
    print('Place: ${_placeController.text}');
    print('Start Time: $_startDate');
    print('End Time: $_endDate');
    print('Cost: $_cost');
    print('Event Type: $_selectedType');
  }
}
