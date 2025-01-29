import 'package:flutter/material.dart';
import 'package:attendance_system/db/db_helper.dart';

import '../models/student.dart';

class StudentProvider with ChangeNotifier {
  List<Student> studentList = [];

  String enrollmentStatus = "enrolled";

  /// Add new student to the Collection student
  Future<void> addNewStudent(Student student) {
    return DbHelper.addStudent(student);
  }

  /// Retrieve one student
  Future<Map<String, dynamic>> getStudent(String studentId) {
    final data = DbHelper.getStudent(studentId);
    return data;
  }


  /// Retrieve all lecturers
  Future<void> getStudents() async {
    final snapshot = await DbHelper.getStudents();

    studentList = List.generate(
      snapshot.docs.length,
          (index) {
        return Student.fromJson(snapshot.docs[index].data());
      },
    );

    notifyListeners();
  }

}
