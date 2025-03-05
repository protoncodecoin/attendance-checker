import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/lecture.dart';
import '../provider/student_provider.dart';

Lecture getStudentStatusForCourse(String lectureId, BuildContext context) {
  print("From getStudentStatusForCourse ============");
  print(lectureId);
  print(
      "${Provider.of<StudentProvider>(context, listen: false).currentStudentLectures}");
  List<Lecture> currentLecture =
      Provider.of<StudentProvider>(context, listen: false)
          .currentStudentLectures
          .where((lecture) => lecture.id! == lectureId)
          .toList();

  return currentLecture.first;
}
