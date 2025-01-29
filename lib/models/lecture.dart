import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:attendance_system/models/models.dart';

part 'lecture.freezed.dart';
part 'lecture.g.dart';


const String collectionLecture = "Lecture";

@unfreezed
class Lecture with _$Lecture {
  factory Lecture({
    String? id,
    @Default(false) activeClass,
    @Default(false) hasClassEnded,
    required String courseTitle,
    required int totalStudents,
    required String lecturerName,
    required String date,
    required String time,
    required String classRoom,
    required String lecturerId,
    required List<String> studentIds,
  }) = _Lecture;

  factory Lecture.fromJson(Map<String, dynamic> json) =>
      _$LectureFromJson(json);
}

// class Lecture {
//   final int? id;
//   final String courseTitle;
//   final int totalStudents;
//   final String lecturerName;
//   final String date;
//   final String time;
//   final String classRoom;
//   final bool hasClassEnded;
//   final bool activeClass;
//   final Lecturer lecturer;
//   final List<Student> students;

//   Lecture({
//     this.id,
//     this.hasClassEnded = false,
//     this.activeClass = false,
//     required this.lecturer,
//     required this.students,
//     required this.courseTitle,
//     required this.totalStudents,
//     required this.lecturerName,
//     required this.date,
//     required this.classRoom,
//     required this.time,
//   });

//   @override
//   bool operator ==(Object other) {
//     return other is Lecture && other.id == id;
//   }

//   @override
//   int get hashCode => Object.hash(id, courseTitle);

//   @override
//   String toString() {
//     return 'course Id: $id course Title: $courseTitle';
//   }
// }

List<Lecture> lectures = [
  Lecture(
      studentIds: [

      ],
      id: '1',
      courseTitle: "CS40",
      lecturerId: 'lecturers[1]',
      totalStudents: 50,
      lecturerName: "Mr Appiah Kubi",
      date: "12/10/2025",
      classRoom: "34-C",
      time: "12:45 pm"),
  Lecture(
      studentIds: [

      ],
      id: '2',
      courseTitle: "CS90",
      lecturerId: 'lecturers[2]',
      totalStudents: 67,
      lecturerName: "Mr James Larbi",
      date: "07/10/2025",
      classRoom: "32-C-Aqua",
      time: "12:45 pm"),
  Lecture(
    studentIds: [

    ],
    id: '3',
    courseTitle: "CS40",
    lecturerId:' lecturers[3]',
    totalStudents: 30,
    lecturerName: "Mr Darko Kwesi",
    date: "09/10/2025",
    classRoom: "Mark Prince Lecture Hall",
    time: "12:45 pm",
  ),
  Lecture(
      studentIds: [

      ],
      id: '4',
      hasClassEnded: true,
      lecturerId: 'lecturers[1]',
      courseTitle: "CS70",
      totalStudents: 50,
      lecturerName: "Mr Micheal Tetteh",
      classRoom: "Peter Parker-C",
      date: "19/10/2024",
      time: "12:45 pm"),
  Lecture(
      studentIds: [

      ],
      id: '5',
      hasClassEnded: true,
      courseTitle: "CS30",
      lecturerId: 'lecturers[3]',
      totalStudents: 20,
      lecturerName: "Mr Appiah Kubi",
      classRoom: "Batman Hall-C",
      date: "07/10/2024",
      time: "12:45 pm"),
  Lecture(
      studentIds: [

      ],
      id: '6',
      courseTitle: "C540",
      totalStudents: 90,
      lecturerName: "Mr Paul Appiah",
      lecturerId:' lecturers[2]',
      classRoom: "James Hall",
      date: "25/09/2025",
      time: "12:45 pm"),
  Lecture(
      studentIds: [

      ],
      id: '7',
      hasClassEnded: true,
      courseTitle: "CS50",
      lecturerId: 'lecturers[4]',
      totalStudents: 50,
      lecturerName: "Mrs Marry Kubi",
      classRoom: "Bamso 14-A",
      date: "01/05/2024",
      time: "12:45 pm"),
];
