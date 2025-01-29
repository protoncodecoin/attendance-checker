import 'package:flutter/material.dart';

import '../db/db_helper.dart';
import '../models/lecture.dart';

class LectureProvider extends ChangeNotifier {
  List<Lecture> selectedStudents = [];


  Future<Map<String, dynamic>> getClass(String lectureId)  {
    final data = DbHelper.getLecture(lectureId);
    return data;
  }
}
