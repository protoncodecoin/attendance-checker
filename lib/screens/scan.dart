import 'package:attendance_system/models/models.dart';
import 'package:attendance_system/provider/student_provider.dart';
import 'package:attendance_system/screens/scan_verification.dart';
import 'package:attendance_system/utility/query_methods.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../utility/date_utility.dart';

class ScanScreen extends StatefulWidget {
  final String lectureId;
  const ScanScreen({super.key, required this.lectureId});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  Lecture? selectedLecture;

  @override
  void initState() {
    selectedLecture = getStudentStatusForCourse(widget.lectureId, context);

    DateTime convertedClassDate = parseDate(selectedLecture!.date);
    TimeOfDay convertedTIme = parseTime(selectedLecture!.time);
    print("==== selected lecture=======");
    print(
        "Current Time: ${TimeOfDay.now()} || $convertedTIme || Raw: ${selectedLecture!.time}");
    print("Current Date: ${DateTime.now()} || $convertedClassDate");
    print(selectedLecture);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in to class"),
      ),
      body: selectedLecture != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "CS401",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 30, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date & Time ${widget.lectureId}",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: const Color.fromARGB(255, 104, 104, 104)),
                      ),
                      Icon(
                        Icons.verified,
                        color: Colors.green,
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
                        "Location",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: const Color.fromARGB(255, 104, 104, 104),
                        ),
                      ),
                      Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 30, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Face ID",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: const Color.fromARGB(255, 104, 104, 104),
                        ),
                      ),
                      Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 30, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "QR Code",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: const Color.fromARGB(255, 104, 104, 104),
                        ),
                      ),
                      Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.go(ScanVerification.routeName);
                        },
                        child: const Text("Scan Face ID"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Scan QR Code"),
                      )
                    ],
                  ),
                )
              ],
            )
          : Center(
              child: const Text("Something went wrong"),
            ),
    );
  }
}
