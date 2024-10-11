import 'package:flutter/material.dart';
import '../models/time_entry.dart';
import '../services/time_tracking_service.dart';
import '../widgets/time_entry_card.dart';

class TimeTrackingScreen extends StatefulWidget {
  @override
  _TimeTrackingScreenState createState() => _TimeTrackingScreenState();
}

class _TimeTrackingScreenState extends State<TimeTrackingScreen> {
  final TimeTrackingService _timeTrackingService = TimeTrackingService();
  List<TimeEntry> _timeEntries = [];

  @override
  void initState() {
    super.initState();
    _loadTimeEntries();
  }

  void _loadTimeEntries() async {
    final timeEntries = await _timeTrackingService.getTimeEntries();
    setState(() {
      _timeEntries = timeEntries;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracking'),
      ),
      body: ListView.builder(
        itemCount: _timeEntries.length,
        itemBuilder: (context, index) {
          return TimeEntryCard(timeEntry: _timeEntries[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement add time entry functionality
        },
        child: Icon(Icons.add),
      ),
    );
  }
}