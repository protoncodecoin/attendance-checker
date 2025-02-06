import 'package:attendance_system/auth/auth_service.dart';
import 'package:attendance_system/provider/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:attendance_system/api/mock_student_system_data.dart';
import 'package:attendance_system/components/lecture_info_chip.dart';
import 'package:provider/provider.dart';


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
      body: AuthService.currentUser != null
          ? FutureBuilder(
            future:
                Provider.of<StudentProvider>(context, listen: false).fetchStudentProfile(AuthService.currentUser!.uid),
            builder: (context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Consumer<StudentProvider>(
                  builder: (context, provider, child) {
                    if (provider.studentProfile.isEmpty) {
                      return Center(
                        child:
                            Text("No profile found\nSomething went wrong"),
                      );
                    }

                    var selectedStudent = provider.studentProfile.first;

                    return Column(
                      children: [
                        LectureInfoChip(
                            leadingText: "Full Name",
                            trailingText: selectedStudent.fullname),
                        LectureInfoChip(
                            leadingText: "Programme",
                            trailingText: selectedStudent.programeOfStudy),
                        LectureInfoChip(
                            leadingText: "Level",
                            trailingText: selectedStudent.level),
                      ],
                    );
                  },
                );
              }
              if (snapshot.connectionState ==
                  ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Center(
                  child: Text("Something went wrong ${AuthService.currentUser!.uid}"),
                );
              }
            },
          )
          : const Center(
              child: Text("Please login to see user details"),
            ),
    );
  }
}
