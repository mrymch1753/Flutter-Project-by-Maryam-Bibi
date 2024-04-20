import 'package:flutter/material.dart';

void main() {
  runApp(TimetableApp());
}

class TimetableApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timetable',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TimetableScreen(),
    );
  }
}

class TimetableScreen extends StatefulWidget {
  @override
  _TimetableScreenState createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
  List<List<Event>> timetable = [
    [
      Event(title: 'Math', time: '9:00 AM', location: 'Room 101'),
      Event(title: 'Physics', time: '11:00 AM', location: 'Room 102'),
      Event(title: 'Chemistry', time: '1:00 PM', location: 'Room 103'),
      Event(title: 'Biology', time: '3:00 PM', location: 'Room 104'),
      Event(title: 'English', time: '5:00 PM', location: 'Room 105'),
    ],
    [
      Event(title: 'English', time: '9:00 AM', location: 'Room 105'),
      Event(title: 'Math', time: '11:00 AM', location: 'Room 101'),
      Event(title: 'Physics', time: '1:00 PM', location: 'Room 102'),
      Event(title: 'Biology', time: '3:00 PM', location: 'Room 104'),
      Event(title: 'Chemistry', time: '5:00 PM', location: 'Room 103'),
    ],
    [
      Event(title: 'Chemistry', time: '9:00 AM', location: 'Room 103'),
      Event(title: 'Biology', time: '11:00 AM', location: 'Room 104'),
      Event(title: 'English', time: '1:00 PM', location: 'Room 105'),
      Event(title: 'Math', time: '3:00 PM', location: 'Room 101'),
      Event(title: 'Physics', time: '5:00 PM', location: 'Room 102'),
    ],
    [
      Event(title: 'Physics', time: '9:00 AM', location: 'Room 102'),
      Event(title: 'Chemistry', time: '11:00 AM', location: 'Room 103'),
      Event(title: 'Biology', time: '1:00 PM', location: 'Room 104'),
      Event(title: 'English', time: '3:00 PM', location: 'Room 105'),
      Event(title: 'Math', time: '5:00 PM', location: 'Room 101'),
    ],
    [
      Event(title: 'Biology', time: '9:00 AM', location: 'Room 104'),
      Event(title: 'English', time: '11:00 AM', location: 'Room 105'),
      Event(title: 'Math', time: '1:00 PM', location: 'Room 101'),
      Event(title: 'Physics', time: '3:00 PM', location: 'Room 102'),
      Event(title: 'Chemistry', time: '5:00 PM', location: 'Room 103'),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable'),
      ),
      body: ListView.builder(
        itemCount: days.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  days[index],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: timetable[index].length,
                itemBuilder: (context, subIndex) {
                  return ListTile(
                    title: Text(timetable[index][subIndex].title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Time: ${timetable[index][subIndex].time}'),
                        Text('Location: ${timetable[index][subIndex].location}'),
                      ],
                    ),
                    onTap: () {
                      // Handle tap action if needed
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new event
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEventScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Event {
  final String title;
  final String time;
  final String location;

  Event({required this.title, required this.time, required this.location});
}

class AddEventScreen extends StatefulWidget {
  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: timeController,
              decoration: InputDecoration(
                labelText: 'Time',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Location',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save event
                String title = titleController.text;
                String time = timeController.text;
                String location = locationController.text;

                // You can handle saving data here, e.g., adding it to the timetable
                // For simplicity, just pop the screen for now
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
