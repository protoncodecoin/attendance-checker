import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:attendance_system/api/mock_student_system_data.dart';
import 'package:attendance_system/utility/functions.dart';
import 'package:go_router/go_router.dart';

import '../auth/auth_service.dart';
import '../components/lecture_info.dart';
import '../components/radio_group.dart';
import '../pages/login.dart';

class UpcomingPage extends StatefulWidget {
  static final String routeName = "/";

  const UpcomingPage({super.key});

  @override
  State<UpcomingPage> createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  String groupValue = "today";

  final mockService = MockStudentSystemData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upcoming Classes"),
        elevation: 2.0,
        actions: [
          IconButton(
            onPressed: () {
              _showSortDialog();
            },
            icon: Icon(Icons.sort),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: IconButton(
              onPressed: () {
                AuthService.logout().then((onValue) {
                  if (context.mounted) {
                    return context.go(LoginPage.routeName);
                  }
                });
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final lectures = snapshot.data?.lectures
                    ?.where((lecture) => lecture.hasClassEnded == false)
                    .toList() ??
                [];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: lectures.length,
                itemBuilder: (context, index) {
                  final lecture = lectures[index];

                  return LectureInfoCard(
                    lecture: lecture,
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  void _showSortDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Sort Lectures"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.close,
              color: Colors.red,
            ),
          )
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioGroup(
              value: "today",
              groupValue: groupValue,
              label: "Today",
              onChanged: (value) {
                /// TODO: use provider to handle change sort value
                if (kDebugMode) {
                  print(value);
                }

                Navigator.of(context).pop();
                setState(() {
                  groupValue = value!;
                });
              },
            ),
            RadioGroup(
              value: "tomorrow",
              groupValue: groupValue,
              label: "Tomorrow",
              onChanged: (value) {
                /// TODO: use provider to handle change sort value
                if (kDebugMode) {
                  print(value);
                }
                Navigator.of(context).pop();
                setState(() {
                  groupValue = value!;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
