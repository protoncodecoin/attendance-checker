import 'package:flutter/material.dart';
import 'package:attendance_system/api/mock_student_system_data.dart';
import 'package:attendance_system/utility/functions.dart';

import '../components/lecture_info_chip.dart';
import '../models/lecture.dart';

class OnGoingClass extends StatelessWidget {
  static final String routeName = "/active";

  OnGoingClass({super.key});

  final mockService = MockStudentSystemData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("On Going Class"),
        elevation: 2.0,
      ),
      body: FutureBuilder(
          future: mockService.getExploreData(),
          builder: (context, AsyncSnapshot<ExploreData> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final List<Lecture>? activeLectures = snapshot.data?.lectures;
              final Lecture? activeLecture = getActiveClass(activeLectures);

              return activeLecture != null
                  ? _buildActiveClass(activeLecture)
                  : _buildNoActiveClass();
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget _buildNoActiveClass() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text("No Active Class"),
      ),
    );
  }

  Widget _buildActiveClass(Lecture lecture) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 30, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Signed In"),
              Chip(
                label: Text("Ongoing"),
              ),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 30, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "CS405",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: const Color.fromARGB(255, 104, 104, 104),
                ),
              ),
            ],
          ),
        ),
        LectureInfoChip(
          leadingText: "Date",
          trailingText: "12/12/2024",
        ),
        LectureInfoChip(
          leadingText: "Time",
          trailingText: "12:04pm",
        ),
        LectureInfoChip(
          leadingText: "Lecturer",
          trailingText: "MR MICKY TETTS",
        ),
      ],
    );
  }
}
