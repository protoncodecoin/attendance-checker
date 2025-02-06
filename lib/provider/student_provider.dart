import 'package:flutter/material.dart';
import 'package:attendance_system/db/db_helper.dart';

import '../models/lecture.dart';
import '../models/student.dart';

class StudentProvider with ChangeNotifier {
  List<Student> studentList = [];
  List<Student> studentProfile = [];
  List<Lecture> currentStudentLectures = [];
  String? errorMessage;

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

  /// Fetch Student Profile and Update Provider
  Future<void> fetchStudentProfile(String studentId) async {
    try {
      studentProfile = await DbHelper.getUserProfile(studentId);

      if (studentProfile.isNotEmpty) {
        List<dynamic> lectureIds = studentProfile.first.lectureIds;
        List<String> lectureIdsString = lectureIds.cast<String>();

        await getListOfLectures(lectureIdsString);
      } else {
        throw Exception("Student Profile not found");
      }

      notifyListeners(); // Notify UI of changes
    } catch (error) {
      errorMessage = "Request failed: $error";
      notifyListeners();
    }
  }

  /// fetch list of lectures
  Future<void> getListOfLectures(List<String> lectureIds) async {
    try {

      currentStudentLectures = await DbHelper.getListOfLectures(lectureIds);
    } catch (error) {
      throw Exception("$error");
    }

    // notifyListeners();
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
