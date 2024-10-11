import 'package:flutter/material.dart';
import '../models/time_entry.dart';

class TimeEntryCard extends StatelessWidget {
  final TimeEntry timeEntry;

  const TimeEntryCard({
    Key? key,
    required this.timeEntry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              timeEntry.description,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Duration: ${timeEntry.duration} minutes',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  'Started: ${_formatDateTime(timeEntry.startTime)}',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}