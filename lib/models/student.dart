import 'package:attendance_system/models/image_model.dart';

const collectionStudent = "Students";
const String labelStudentId = "id";
const String labelFullname = "fullname";
const String labelLevel = "level";
const String labelProgrammeOfStudy = "programmeOfStudy";

const String labelEmail = "email";

class Student {
  String? id;
  final String fullname;
  final String level;
  final String programeOfStudy;
  final String email;
  // final ImageModel image;

  Student({
    this.id,
    required this.fullname,
    required this.level,
    required this.programeOfStudy,
    required this.email,
    // required this.image,
  });

  @override
  bool operator ==(Object other) {
    return other is Student && other.id == id;
  }

  @override
  int get hashCode => Object.hash(id, email);

  @override
  String toString() {
    return 'Full Name: $fullname Email: $email';
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'fullname': fullname,
      'level': level,
      'programmeOfStudy': programeOfStudy,
      'email': email,
    };
  }

  factory Student.fromJson(Map<String, dynamic> map) => Student(
      fullname: map[labelFullname],
      level: map[labelLevel],
      programeOfStudy: map[labelProgrammeOfStudy],
      email: map[labelEmail]);

// email "jackson@test.com"
// (string)
// fullname "Micheal Jackson"
// (string)
// id "sZKBLe2ZLqLX8MZaO2Il"
// (string)
// level "400"
// (string)
// programmeOfStudy "Computer Science"
}

Student student = Student(
  id: 1.toString(),
  fullname: "James Peter",
  level: "400",
  programeOfStudy: "Computer Sciencew",
  email: "james@example.com",
);

List<Student> students = [
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
  Student(
      id: '6',
      fullname: "Robertson Peter",
      level: "400",
      email: "robertson202@example.com",
      programeOfStudy: "Computer Science"),
];
