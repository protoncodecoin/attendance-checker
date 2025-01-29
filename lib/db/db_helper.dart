import 'package:attendance_system/models/lecture.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/lecturer.dart';
import '../models/student.dart';

class DbHelper {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static const String collectionAdmin = "Admins";

  static Future<bool> isAdmin(String uid) async {
    final snapshot = await _db.collection(collectionAdmin).doc(uid).get();
    return snapshot.exists;
  }

  /// Create student document in the studentCollection
  static Future<void> addStudent(Student student) {
    final doc = _db.collection(collectionStudent).doc();
    student.id = doc.id;
    return doc.set(student.toJson());
  }

  /// Get Student
  static Future<Map<String, dynamic>> getStudent(String studentId) {
    final docRef = _db.collection(collectionStudent).doc(studentId);

    final data = docRef
        .get()
        .then((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>);

    return data;
  }

  /// get All student using async await
  static Future<QuerySnapshot<Map<String, dynamic>>> getStudents() async {
    final docRef = await _db.collection(collectionStudent).get();

    return docRef;
  }

  /// get all students from the studentCollection
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllStudents() =>
      _db.collection(collectionStudent).snapshots();

  /// Create lecturer document in the LecturerCollection
  static Future<void> addLecturer(Lecturer lecturer) {
    final doc = _db.collection(collectionLecturer).doc();
    lecturer.id = doc.id;
    return doc.set(lecturer.toJson());
  }

  /// Get Lecturer
  static Future<Map<String, dynamic>> getLecturer(String lecturerId) {
    final docRef = _db.collection(collectionLecturer).doc(lecturerId);

    final data = docRef
        .get()
        .then((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>);

    return data;
  }

  /// Get all lecturers
  static Future<QuerySnapshot<Map<String, dynamic>>> getLecturers() async {
    final docRef = await _db.collection(collectionLecturer).get();

    return docRef;
  }

  /// Get Lecture (Class)
  // Get Lecturer
  static Future<Map<String, dynamic>> getLecture(String lectureId) {
    final docRef = _db.collection(collectionLecture).doc(lectureId);

    final data = docRef
        .get()
        .then((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>);

    return data;
  }

  /// Save Lecture
  static Future<void> saveLecture(Lecture course) {
    final docRef = _db.collection(collectionLecture).doc();
    course.id = docRef.id;

    return docRef.set(course.toJson());
  }

  /// Add student to lecture
 static Future<void> assignStudentToLecture(
      String studentId, String lectureId) async {
    DocumentReference lectureRef =
        _db.collection(collectionLecture).doc(lectureId);
    DocumentReference studentRef =
        _db.collection(collectionStudent).doc(studentId);

    // Update lecture document
    await lectureRef.update(
      {
        "studentIds": FieldValue.arrayUnion(
          [studentId],
        ),
      },
    );

    // Update student document
    await studentRef.update(
      {
        "lectureIds": FieldValue.arrayUnion(
          [lectureId],
        ),
      },
    );
  }

  // Remove student from Lecture
static  Future<void> removeStudentFromLecture(
      String studentId, String lectureId) async {
    DocumentReference studentRef =
        _db.collection(collectionStudent).doc(studentId);
    DocumentReference lectureRef =
        _db.collection(collectionLecture).doc(lectureId);

    /// Update lecture document
    await lectureRef.update(
      {
        "studentIds": FieldValue.arrayRemove([studentId]),
      },
    );

    // update student document
    await studentRef.update(
      {
        "lectureIds": FieldValue.arrayRemove(
          [lectureId],
        ),
      },
    );
  }
}
