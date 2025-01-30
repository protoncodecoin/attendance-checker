import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

const collectionStudent = "Students";
const String labelStudentId = "id";
const String labelFullname = "fullname";
const String labelLevel = "level";
const String labelProgrammeOfStudy = "programeOfStudy";
const String classIds = "lectureIds";
const String labelEmail = "email";



@unfreezed
class Student with _$Student {

  factory Student({
    String? id,
    required String fullname,
    required String level,
    required String programeOfStudy,
    required String email,
    @Default(List<String>) lectureIds,
}) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
}

Student student = Student(
  id: 1.toString(),
  fullname: "James Peter",
  level: "400",
  programeOfStudy: "Computer Sciencew",
  email: "james@example.com",
  lectureIds: [],

);

List<Student> students = [
  Student(
      id: '2',
      fullname: "James Peter",
      level: "400",
      email: "peter@example.com",
      lectureIds: [],
      programeOfStudy: "Computer Science"),

  Student(
      id: '3',
      fullname: "Paul Peter",
      level: "400",
      email: "paul@example.com",
      lectureIds: [],
      programeOfStudy: "Computer Science"),
  Student(
      id: '4',
      fullname: "Mary Peter",
      level: "400",
      email: "example@example.com",
      lectureIds: [],
      programeOfStudy: "mary Science"),
  Student(
      id: '5',
      fullname: "Vida Peter",
      level: "400",
      email: "vida@example.com",
      lectureIds: [],
      programeOfStudy: "Computer Science"),
  Student(
      id: '6',
      fullname: "Robertson Peter",
      level: "400",
      email: "robertson202@example.com",
      lectureIds: [],
      programeOfStudy: "Computer Science"),
];
