import 'package:attendance_system/provider/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:attendance_system/api/mock_student_system_data.dart';
import 'package:attendance_system/components/lecture_info.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  static final String routeName = '/history';

  HistoryPage({super.key});

  final mockService = MockStudentSystemData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        elevation: 2.0,
      ),
      body: Consumer<StudentProvider>(builder: (context, provider, child)  {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: provider.currentStudentLectures.length,
            itemBuilder: (BuildContext context, int index) {
              final lecture = provider.currentStudentLectures[index];

              return LectureInfoCard(
                lecture: lecture,
                selectedColor: Colors.green,
              );
            },
          ),
        );
      },)
    );
  }
}
