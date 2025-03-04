import 'package:attendance_system/ML/Recognition.dart';
import 'package:flutter/material.dart';
import 'package:attendance_system/db/db_helper.dart';

import '../models/lecture.dart';
import '../models/student.dart';

class StudentProvider with ChangeNotifier {
  List<Student> studentList = [];
  List<Student> studentProfile = [];
  List<Lecture> currentStudentLectures = [];
  String? errorMessage;
  Map<String, Recognition> registered = Map();

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
      print("student profile is ============: $studentProfile $studentId");

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

  /// add recognition to firebase
  Future<void> addNewRecognition(String email, Recognition recognition) async {
    errorMessage = null;
    notifyListeners();

    // change email from unknown to currentUser
    recognition.email = email;

    try {
      await DbHelper.addNewRecognition(email, recognition);
    } catch (e) {
      errorMessage =
          'An error occurred when adding new recognition: ${e.toString()}';
    } finally {
      notifyListeners();
    }
  }

  // Future<Map<String, dynamic>?> getEmbedding(String email) async {
  //   errorMessage = null;
  //   notifyListeners();

  //   try {
  //     final student = await DbHelper.getEmbeddings(email);

  //     return student;
  //   } catch (e) {
  //     errorMessage = 'An error occurred $e';
  //     notifyListeners();
  //   }
  // }

  /// Retreive recognition from firebase
  Future<Map<String, dynamic>?> fetchEmbeddings(String email) async {
    Map<String, dynamic>? data = await DbHelper.getEmbeddings(email);

    if (data != null) {
      print("😁😁😁`Embeddings found: ${data["embeddings"]}");
      Recognition retreivedReg = Recognition.fromJson(data);
      print(retreivedReg.email);
      registered.putIfAbsent(retreivedReg.email, () => retreivedReg);
      notifyListeners();
      print("========= retrieved =========");
      return data;
    } else {
      print("🥲🥲🥲No embeddings found for $email");
      return null;
    }
  }

  /// Retrieve all recognition from firebase
  Future<void> getAllEmbeddings() async {
    try {
      final snapshot = await DbHelper.getAllEmbedding();

      List.generate(
        snapshot.docs.length,
        (index) {
          Recognition recogStudent =
              Recognition.fromJson(snapshot.docs[index].data());
          registered.putIfAbsent(recogStudent.email, () => recogStudent);
        },
      );

      notifyListeners();
    } catch (e) {
      print("An error occurred 🥲: ${e.toString()}");
    }
  }
}
