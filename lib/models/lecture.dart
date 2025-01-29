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
    bool? activeClass,
    bool? hasClassEnded,
    required String courseTitle,
    required int totalStudents,
    required String lecturerName,
    required String date,
    required String time,
    required String classRoom,
    required Lecturer lecturer,
    required List<Student> students,
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
      students: [
        Student(
          id: '2',
          fullname: "James Peter",
          level: "400",
          email: "peter@example.com",
          programeOfStudy: "Computer Science",
         
        ),
        Student(
            id: '3',
            fullname: "Paul Peter",
            level: "400",
            email: "paul@example.com",
           
            programeOfStudy: "Computer Science"),
        Student(
            id: '4',
            fullname: "Mary Peter",
            level: "400",
            email: "example@example.com",
           
            programeOfStudy: "mary Science"),
      ],
      id: '1',
      courseTitle: "CS40",
      lecturer: lecturers[1],
      totalStudents: 50,
      lecturerName: "Mr Appiah Kubi",
      date: "12/10/2025",
      classRoom: "34-C",
      time: "12:45 pm"),
  Lecture(
      students: [
        Student(
            id: '2',
            fullname: "James Peter",
            level: "400",
            email: "peter@example.com",
           
            programeOfStudy: "Computer Science"),
        Student(
            id: '3',
            fullname: "Paul Peter",
            level: "400",
            email: "paul@example.com",
           
            programeOfStudy: "Computer Science"),
        Student(
            id: '4',
            fullname: "Mary Peter",
            level: "400",
            email: "example@example.com",
           
            programeOfStudy: "mary Science"),
      ],
      id: '2',
      courseTitle: "CS90",
      lecturer: lecturers[2],
      totalStudents: 67,
      lecturerName: "Mr James Larbi",
      date: "07/10/2025",
      classRoom: "32-C-Aqua",
      time: "12:45 pm"),
  Lecture(
    students: [
      Student(
          id: '2',
          fullname: "James Peter",
          level: "400",
          email: "peter@example.com",
         
          programeOfStudy: "Computer Science"),
      Student(
          id: '3',
          fullname: "Paul Peter",
          level: "400",
          email: "paul@example.com",
         
          programeOfStudy: "Computer Science"),
      Student(
          id: '4',
          fullname: "Mary Peter",
          level: "400",
          email: "example@example.com",
         
          programeOfStudy: "mary Science"),
      Student(
          id: '5',
          fullname: "Vida Peter",
          level: "400",
          email: "vida@example.com",
         
          programeOfStudy: "Computer Science"),
    ],
    id: '3',
    courseTitle: "CS40",
    lecturer: lecturers[3],
    totalStudents: 30,
    lecturerName: "Mr Darko Kwesi",
    date: "09/10/2025",
    classRoom: "Mark Prince Lecture Hall",
    time: "12:45 pm",
  ),
  Lecture(
      students: [
        Student(
            id: '4',
            fullname: "Mary Peter",
            level: "400",
            email: "example@example.com",
           
            programeOfStudy: "mary Science"),
        Student(
            id: '5',
            fullname: "Vida Peter",
            level: "400",
            email: "vida@example.com",
            //
            programeOfStudy: "Computer Science"),
        Student(
            id: '6',
            fullname: "Robertson Peter",
            level: "400",
            email: "robertson202@example.com",
            //
            programeOfStudy: "Computer Science"),
      ],
      id: '4',
      hasClassEnded: true,
      lecturer: lecturers[1],
      courseTitle: "CS70",
      totalStudents: 50,
      lecturerName: "Mr Micheal Tetteh",
      classRoom: "Peter Parker-C",
      date: "19/10/2024",
      time: "12:45 pm"),
  Lecture(
      students: [
        Student(
            id: '4',
            fullname: "Mary Peter",
            level: "400",
            email: "example@example.com",
            //
            programeOfStudy: "mary Science"),
        Student(
            id: '5',
            fullname: "Vida Peter",
            level: "400",
            email: "vida@example.com",
            //
            programeOfStudy: "Computer Science"),
        Student(
            id: '6',
            fullname: "Robertson Peter",
            level: "400",
            email: "robertson202@example.com",
            //
            programeOfStudy: "Computer Science"),
      ],
      id: '5',
      hasClassEnded: true,
      courseTitle: "CS30",
      lecturer: lecturers[3],
      totalStudents: 20,
      lecturerName: "Mr Appiah Kubi",
      classRoom: "Batman Hall-C",
      date: "07/10/2024",
      time: "12:45 pm"),
  Lecture(
      students: [
        Student(
            id: '2',
            fullname: "James Peter",
            level: "400",
            email: "peter@example.com",
            //
            programeOfStudy: "Computer Science"),
        Student(
            id: '3',
            fullname: "Paul Peter",
            level: "400",
            email: "paul@example.com",
            //
            programeOfStudy: "Computer Science"),
        Student(
            id: '4',
            fullname: "Mary Peter",
            level: "400",
            email: "example@example.com",
            //
            programeOfStudy: "mary Science"),
      ],
      id: '6',
      courseTitle: "C540",
      totalStudents: 90,
      lecturerName: "Mr Paul Appiah",
      lecturer: lecturers[2],
      classRoom: "James Hall",
      date: "25/09/2025",
      time: "12:45 pm"),
  Lecture(
      students: [
        Student(
            id: '2',
            fullname: "James Peter",
            level: "400",
            email: "peter@example.com",
            //
            programeOfStudy: "Computer Science"),
        Student(
            id: '3',
            fullname: "Paul Peter",
            level: "400",
            email: "paul@example.com",
            //
            programeOfStudy: "Computer Science"),
        Student(
            id: '4',
            fullname: "Mary Peter",
            level: "400",
            email: "example@example.com",
            //
            programeOfStudy: "mary Science"),
      ],
      id: '7',
      hasClassEnded: true,
      courseTitle: "CS50",
      lecturer: lecturers[4],
      totalStudents: 50,
      lecturerName: "Mrs Marry Kubi",
      classRoom: "Bamso 14-A",
      date: "01/05/2024",
      time: "12:45 pm"),
];
