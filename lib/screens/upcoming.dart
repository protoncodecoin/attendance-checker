import 'package:attendance_system/provider/student_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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

  Future<void> _fetchRelatedData(BuildContext context) async {
    await Provider.of<StudentProvider>(context, listen: false)
        .fetchStudentProfile(AuthService.currentUser!.uid);
  }

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
        future: _fetchRelatedData(context),
        builder: (context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Consumer<StudentProvider>(
              builder: (context, provider, child) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: provider.currentStudentLectures.isEmpty
                    ? const Center(
                        child: Text("No Lectures available"),
                      )
                    : ListView.builder(
                        itemCount: provider.currentStudentLectures.length,
                        itemBuilder: (context, index) {
                          final lecture =
                              provider.currentStudentLectures[index];

                          return LectureInfoCard(
                            lecture: lecture,
                          );
                        },
                      ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text("Something went wrong"),
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
