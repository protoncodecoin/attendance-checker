import 'package:attendance_system/models/lecture.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  final Stream<QuerySnapshot> _lectureStream = FirebaseFirestore.instance.collection(collectionLecture).snapshots();

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
      body: StreamBuilder(stream: _lectureStream, builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError){
          return const Center(
            child: Text("Something went wrong"),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(),);
        }
        final lectureDocs = snapshot.data!.docs;

        return GridView.builder(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            final lecture = lectureDocs[index].data() as Map<String, dynamic>;

            return InkWell(
              onTap: () {
                context.go(
                  '${Dashboard.routeName}${ManageLecture.routeName}${LectureDetailPage.routeName}/${lecture["id"]}',
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CourseInfo(
                          title: "Course Title",
                          value: lecture["courseTitle"]),
                      const SizedBox(height: 10),
                      CourseInfo(
                          title: "Lecturer", value: lecture["lecturerName"]),
                      const SizedBox(height: 10),
                      CourseInfo(
                          title: "No. Students",
                          value: lecture['lecturerName'].toString()),
                      //TODO: fix bottom overflow pixel by 60
                      // const SizedBox(height: 10),
                      // CourseInfo(title: "Start Date", value: lecture['date']),
                      // const SizedBox(height: 10),
                      // CourseInfo(title: "Time", value: lecture['time']),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: lectureDocs.length,
        );
      })
    );
  }
}
