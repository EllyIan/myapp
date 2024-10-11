class TimeEntry {
  final String id;
  final String description;
  final int duration; // in minutes
  final DateTime startTime;

  TimeEntry({
    required this.id,
    required this.description,
    required this.duration,
    required this.startTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'duration': duration,
      'startTime': startTime.toIso8601String(),
    };
  }

  factory TimeEntry.fromJson(Map<String, dynamic> json) {
    return TimeEntry(
      id: json['id'],
      description: json['description'],
      duration: json['duration'],
      startTime: DateTime.parse(json['startTime']),
    );
  }
}