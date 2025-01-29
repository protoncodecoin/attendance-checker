// Provider to manage lecture data
import 'package:flutter/material.dart';
import 'package:attendance_system/db/db_helper.dart';

import '../models/lecturer.dart';

class LecturerProvider extends ChangeNotifier {
  List<Lecturer> lecturers = [];

  /// Add new student to the collection lecturer
  Future<void> addNewLecturer(Lecturer lecturer) {
    return DbHelper.addLecturer(lecturer);
  }

  /// Retrieve a lecturer
  Future<Map<String, dynamic>> getLecturer(String lecturerId) {
    final data = DbHelper.getLecturer(lecturerId);
    return data;
  }

  /// Retrieve all lecturers
  Future<void> getLecturers() async {
    final snapshot = await DbHelper.getLecturers();

    lecturers = List.generate(
      snapshot.docs.length,
      (index) {
        return Lecturer.fromJson(snapshot.docs[index].data());
      },
    );

    notifyListeners();
  }
}
