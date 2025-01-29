import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:attendance_system/api/mock_student_system_data.dart';
import 'package:attendance_system/components/course_info.dart';

import 'dashboard.dart';
import 'dashboard_pages/dashboard_detail_pages/lecture_detail_page.dart';

class ManageLecture extends StatefulWidget {
  static String routeName = "/list_lecture";

  const ManageLecture({super.key});

  @override
  State<ManageLecture> createState() => _ManageLectureState();
}

class _ManageLectureState extends State<ManageLecture> {
  final MockStudentSystemData mockService = MockStudentSystemData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Lectures"),
        actions: [
          IconButton(
            tooltip: "Add new Lecture",
            onPressed: () {
              context.go(
                  '${Dashboard.routeName}${ManageLecture.routeName}${LectureDetailPage.routeName}');
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final lectures = snapshot.data?.lectures ?? [];

            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                final lecture = lectures[index];

                return InkWell(
                  onTap: () {
                    context.go(
                      '${Dashboard.routeName}${ManageLecture.routeName}${LectureDetailPage.routeName}/${lecture.id}',
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CourseInfo(
                              title: "Course Title",
                              value: lecture.courseTitle),
                          const SizedBox(height: 10),
                          CourseInfo(
                              title: "Lecturer", value: lecture.lecturerName),
                          const SizedBox(height: 10),
                          CourseInfo(
                              title: "No. Students",
                              value: lecture.totalStudents.toString()),
                          const SizedBox(height: 10),
                          CourseInfo(title: "Start Date", value: lecture.date),
                          const SizedBox(height: 10),
                          CourseInfo(title: "Time", value: lecture.time),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: lectures.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
