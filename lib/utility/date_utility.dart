import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime parseDate(String date){
  return DateFormat("yyyy-MM-dd").parse(date);
}

TimeOfDay parseTime(String formattedTime) {
  try {
    // Split the time into parts: "HH:MM AM/PM"
    List<String> parts = formattedTime.split(' ');
    List<String> timeParts = parts[0].split(':');

    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);
    String period = parts[1]; // AM or PM

    // Convert hour to 24-hour format if necessary
    if (period == "PM" && hour != 12) {
      hour += 12;
    } else if (period == "AM" && hour == 12) {
      hour = 0;
    }

    return TimeOfDay(hour: hour, minute: minute);
  } catch (e) {
    throw FormatException("Invalid time format: $formattedTime");
  }
}
