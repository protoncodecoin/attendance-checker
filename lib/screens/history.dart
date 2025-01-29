import 'package:flutter/material.dart';
import 'package:attendance_system/api/mock_student_system_data.dart';
import 'package:attendance_system/components/lecture_info.dart';

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
      body: FutureBuilder(
          future: mockService.getExploreData(),
          builder: (context, AsyncSnapshot<ExploreData> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final lectures = snapshot.data?.lectures
                      ?.where((lecture) => lecture.hasClassEnded == true)
                      .toList() ??
                  [];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: lectures.length,
                  itemBuilder: (BuildContext contexxt, int index) {
                    final lecture = lectures[index];

                    return LectureInfoCard(
                      lecture: lecture,
                      selectedColor: Colors.green,
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
