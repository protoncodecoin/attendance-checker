import 'package:flutter/material.dart';
import 'package:attendance_system/pages/login.dart';

import '../auth/auth_service.dart';
import '../models/lecture.dart';
import '../models/lecturer.dart';
import '../models/student.dart';

IconButton logOutUserBtn(context) {
  return IconButton(
    onPressed: () {
      AuthService.logout().then(
        (onValue) => context.go(LoginPage.routeName),
      );
    },
    icon: Icon(
      Icons.logout,
      color: Colors.red,
    ),
  );
}

Lecture? getActiveClass(List<Lecture>? lectures) {
  if (lectures != null) {
    for (var lecture in lectures) {
      if (lecture.activeClass!) return lecture;
    }
  }
  return null;
}

Student? getStudent(String id) {
  for (var student in students) {
    if (student.id == id) {
      print("selected student is ==================== $student");
      return student;
    }
  }

  return null;
}

Student? getStudentListProvider(int id, List<Student> students) {
  for (var student in students) {
    if (student.id == id) return student;
  }

  return null;
}

void unEnrollStudent(Student student, List<Student> students) {
  for (var student in students) {
    if (student.id != student.id) {
      final index = students.indexOf(student);
      students.removeAt(index);

      print("student added");
    } else {
      print("student wasn't added");
    }
  }
}

void newEnrollStudent(Student student, List<Student> students) {
  for (var student in students) {
    if (student.id != student.id) {
      students.add(student);
      print("student added");
    } else {
      print("student wasn't added");
    }
  }
}

Lecturer? getLecturer(int id) {
  for (var lecturer in lecturers) {
    if (lecturer.id == id) return lecturer;
  }
  return null;
}

Lecture? getLecture(String lectureId) {
  for (var lecture in lectures) {
    if (lecture.id == lectureId) return lecture;
  }
  return null;
}

Lecture? getLectureFilter(int lectureId, List<Lecture> lectures) {
  for (var lecture in lectures) {
    if (lecture.id == lectureId) return lecture;
  }
  return null;
}
