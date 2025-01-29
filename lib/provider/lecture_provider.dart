import 'package:flutter/material.dart';

import 'package:attendance_system/db/db_helper.dart';
import '../models/lecture.dart';

class LectureProvider extends ChangeNotifier {
  List<Lecture> selectedStudents = [];

  /// Retrieve a lecture
  Future<Map<String, dynamic>> getClass(String lectureId)  {
    final data = DbHelper.getLecture(lectureId);
    return data;
  }

  /// add new lecture
  Future<void> addNewLecture (Lecture course){
    return DbHelper.saveLecture(course);
  }

  /// add mew student to lecture
  Future<void> addStudentToLecture (String studentId, String lectureId) {
    return DbHelper.assignStudentToLecture(studentId, lectureId);
  }

  /// remove student from lecture
  Future<void> removeStudentFromLecture (String studentId, String lectureId) {
    return DbHelper.removeStudentFromLecture(studentId, lectureId);
  }

  /// Retrieve a lecture
  Future<Map<String, dynamic>> getLecture(String lectureId) {
    final data = DbHelper.getLecture(lectureId);
    return data;
  }
}
