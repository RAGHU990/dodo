import 'package:flutter/material.dart';

class Tasks {
  int? id;
  String? task_title;
  String? date;
  String? time;
  String? description;
  Color? color;

  // Constructor
  Tasks(
      {this.id,
      this.task_title,
      this.date,
      this.time,
      this.description,
      this.color});

  // Method to convert to a map
  Map<String, dynamic> userMap() {
    return {
      "id": id, // SQLite will handle the ID
      "task_title": task_title,
      "date": date,
      "time": time,
      "description": description,
      "color": color?.value.toRadixString(16)
    };
  }

  // toString method for easy printing
  @override
  String toString() {
    return 'Tasks{id: $id, task_title: $task_title, date: $date, time: $time, description: $description, color: $color}';
  }
}
