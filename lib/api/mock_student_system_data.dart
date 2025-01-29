import "../models/models.dart";

class ExploreData {
  final List<Lecture>? lectures;
  final Student? student;
  final List<Student>? allStudents;
  final List<Lecturer>? allLectures;

  ExploreData({
    this.lectures,
    this.student,
    this.allStudents,
    this.allLectures,
  });
}

class MockStudentSystemData {
  Future<ExploreData> getExploreData() async {
    final lectures = await _getLectures();
    final studentProfile = await _getStudentProfile();
    final allStudents = await _getStudents();
    final allLectures = await _getLecturers();

    return ExploreData(
      lectures: lectures,
      student: studentProfile,
      allStudents: allStudents,
      allLectures: allLectures,
    );
  }

  /// Get the list of lectures and return
  Future<List<Lecture>> _getLectures() async {
    await Future.delayed(Duration(milliseconds: 1000));

    return lectures;
  }

  Future<Student> _getStudentProfile() async {
    await Future.delayed(Duration(microseconds: 1000));

    return student;
  }

  Future<List<Student>> _getStudents() async {
    await Future.delayed(Duration(milliseconds: 1000));

    return students;
  }

  Future<List<Lecturer>> _getLecturers() async {
    await Future.delayed(Duration(milliseconds: 1000));

    return lecturers;
  }
}
