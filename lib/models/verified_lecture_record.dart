import 'package:attendance_system/models/student_record.dart';

class VerifiedLectureStudents {
  String lectureId;
  List<StudentRecord> verifiedStudents;

  VerifiedLectureStudents(this.lectureId, this.verifiedStudents);

  /// Convert to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      "lectureId": lectureId,
      "verifiedStudents":
          verifiedStudents.map((record) => record.toJson()).toList(),
    };
  }

  /// Convert from JSON
  factory VerifiedLectureStudents.fromJson(Map<String, dynamic> json) {
    return VerifiedLectureStudents(
      json["lectureId"] as String,
      (json["verifiedStudents"] as List<dynamic>)
          .map((e) => StudentRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
