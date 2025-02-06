import 'package:attendance_system/models/lecture.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/lecturer.dart';
import '../models/student.dart';

class DbHelper {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static const String collectionAdmin = "Admins";
  static const collectionStudentAuth = "StudentAuth";

  static Future<bool> isAdmin(String uid) async {
    final snapshot = await _db.collection(collectionAdmin).doc(uid).get();
    return snapshot.exists;
  }

  static Future<bool> isStudent(String uid) async {
    final snapshot = await _db.collection(collectionStudentAuth).doc(uid).get();
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

  /// get student profile
  static Future<List<Student>> getUserProfile(String studentId) async {
    try {
      QuerySnapshot querySnapshot = await _db
          .collection(collectionStudent)
          .where("authid", isEqualTo: studentId)
          .get();

      return querySnapshot.docs
          .map((doc) => Student.fromJson((doc.data() as Map<String, dynamic>)))
          .toList();
    } catch (error) {
      throw Exception("Request Failed: ${error.toString()}");
    }
  }

  /// get a list of lecture objects for student
  static Future<List<Lecture>> getListOfLectures(
      List<String> lectureIds) async {
    List<Lecture> lectures = [];

    try {
      for (int i = 0; i < lectureIds.length; i += 10) {
        // Firestore wherein method supports max 10 items, so the queries is batched if needed
        List<String> batch = lectureIds.sublist(
            i, i + 10 > lectureIds.length ? lectureIds.length : i + 10);

        QuerySnapshot querySnapshot = await _db
            .collection(collectionLecture)
            .where("id", whereIn: batch)
            .get();

        // convert each document into a Lecture object
        lectures.addAll(querySnapshot.docs.map(
          (doc) => Lecture.fromJson(doc.data() as Map<String, dynamic>),
        ));
      }
    } catch (error) {
      throw Exception("Request Failed : ${error.toString()}");
    }

    return lectures;
  }

  /// get student lectures
  // static Future<List<String>> getAllStudentLecture(String studentId) async {
  //   QuerySnapshot querySnapshot = await _db
  //       .collection(collectionStudent)
  //       .where("authid", isEqualTo: studentId)
  //       .get();
  // }

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
  static Future<void> removeStudentFromLecture(
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

  /// ensures both student and lecture is updated (added)
  Future<void> enrollStudentInLecture(
      String studentId, String lectureId) async {
    final studentRef = _db.collection(collectionStudent).doc(studentId);
    final lectureRef = _db.collection("lectures").doc(lectureId);

    await _db.runTransaction((transaction) async {
      // Get current student and lecture documents
      DocumentSnapshot studentSnapshot = await transaction.get(studentRef);
      DocumentSnapshot lectureSnapshot = await transaction.get(lectureRef);

      if (!studentSnapshot.exists || !lectureSnapshot.exists) {
        throw Exception("Student or Lecture does not exist.");
      }

      // Update student document
      List<dynamic> studentLectureIds = studentSnapshot["lectureIds"] ?? [];
      if (!studentLectureIds.contains(lectureId)) {
        studentLectureIds.add(lectureId);
        transaction.update(studentRef, {"lectureIds": studentLectureIds});
      }

      // Update lecture document
      List<dynamic> lectureStudentIds = lectureSnapshot["studentIds"] ?? [];
      if (!lectureStudentIds.contains(studentId)) {
        lectureStudentIds.add(studentId);
        transaction.update(lectureRef, {"studentIds": lectureStudentIds});
      }
    });
  }

  /// ensures both student and lecture is updated (removed)
  Future<void> unEnrollStudentInLecture(
      String studentId, String lectureId) async {
    final studentRef = _db.collection(collectionStudent).doc(studentId);
    final lectureRef = _db.collection(collectionAdmin).doc(lectureId);

    await _db.runTransaction((transactionHandler) async {
      DocumentSnapshot studentSnapshot =
          await transactionHandler.get(studentRef);
      DocumentSnapshot lectureSnapshot =
          await transactionHandler.get(lectureRef);

      if (!studentSnapshot.exists || !lectureSnapshot.exists) {
        throw Exception("Student or lecture does not exit");
      }

      // Update student document
      List<dynamic> studentLectureIds = studentSnapshot['lectureIds'] ?? [];
      if (studentLectureIds.contains(lectureId)) {
        studentLectureIds.remove(lectureId);
        transactionHandler
            .update(studentRef, {"lectureIds": studentLectureIds});
      }

      // Update lecture document
      List<dynamic> lectureStudentIds = lectureSnapshot['studentIds'] ?? [];
      if (lectureStudentIds.contains(studentId)) {
        lectureStudentIds.remove(studentId);
        transactionHandler
            .update(lectureRef, {"studentIds": lectureStudentIds});
      }
    });
  }
}
