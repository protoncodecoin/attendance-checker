import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'lecturer.freezed.dart';
part 'lecturer.g.dart';

const collectionLecturer = "Lecturer";

@unfreezed
class Lecturer with _$Lecturer {
  factory Lecturer({
    String? id,
    required String fullname,
    required String email,
  }) = _Lecturer;

  factory Lecturer.fromJson(Map<String, dynamic> json) =>
      _$LecturerFromJson(json);
}

// class Lecturer {
//   final int? id;
//   final String fullname;
//   final String email;

//   const Lecturer({
//     this.id,
//     required this.fullname,
//     required this.email,
//   });
// }

List<Lecturer> lecturers = [
  Lecturer(
    id: '2',
    fullname: "Professor James Peter",
    email: "peter@example.com",
  ),
  Lecturer(
    id: '3',
    fullname: "Professor Paul Peter",
    email: "paul@example.com",
  ),
  Lecturer(
    id: '4',
    fullname: " Professor Mary Peter",
    email: "example@example.com",
  ),
  Lecturer(
    id: '5',
    fullname: "Doctor Vida Peter",
    email: "vida@example.com",
  ),
  Lecturer(
    id: '6',
    fullname: "Doctor Robertson Peter",
    email: "robertson202@example.com",
  ),
];
