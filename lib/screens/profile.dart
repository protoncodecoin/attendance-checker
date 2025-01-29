import 'package:flutter/material.dart';
import 'package:attendance_system/api/mock_student_system_data.dart';
import 'package:attendance_system/components/lecture_info_chip.dart';

class ProfileScreen extends StatelessWidget {
  static final String routeName = "/profile";

  ProfileScreen({super.key});

  final mockService = MockStudentSystemData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          elevation: 2.0,
        ),
        body: FutureBuilder(
          future: mockService.getExploreData(),
          builder: (context, AsyncSnapshot<ExploreData> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final student = snapshot.data?.student;

              if (student != null) {
                return Column(
                  children: [
                    LectureInfoChip(
                        leadingText: "Full Name",
                        trailingText: student.fullname),
                    LectureInfoChip(
                        leadingText: "Programme",
                        trailingText: student.programeOfStudy),
                    LectureInfoChip(
                        leadingText: "Level", trailingText: student.level),
                  ],
                );
              } else {
                return Center(
                  child: Text("Something went wrong"),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
