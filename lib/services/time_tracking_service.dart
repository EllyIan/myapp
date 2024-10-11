import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/time_entry.dart';

class TimeTrackingService {
  final String baseUrl = 'http://your-backend-url.com/api';

  Future<List<TimeEntry>> getTimeEntries() async {
    final response = await http.get(Uri.parse('$baseUrl/time-entries'));

    if (response.statusCode == 200) {
      List<dynamic> entriesJson = json.decode(response.body);
      return entriesJson.map((json) => TimeEntry.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load time entries');
    }
  }

  Future<TimeEntry> addTimeEntry(TimeEntry entry) async {
    final response = await http.post(
      Uri.parse('$baseUrl/time-entries'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(entry.toJson()),
    );

    if (response.statusCode == 201) {
      return TimeEntry.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add time entry');
    }
  }

  // Add more methods as needed (e.g., updateTimeEntry, deleteTimeEntry)
}