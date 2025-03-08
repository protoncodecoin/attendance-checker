import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/student_record.dart';
import '../provider/student_provider.dart';
import '../pages/scan_qr_code.dart';
import 'scan_verification.dart';

class StudentVerificationStatusScreen extends StatelessWidget {
  final String lectureId;

  const StudentVerificationStatusScreen({super.key, required this.lectureId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Verification Status")),
      body: StreamBuilder<StudentRecord?>(
        stream: Provider.of<StudentProvider>(context, listen: false)
            .streamCurrentUserVerification(lectureId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("You haven't complete any verification step"),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context
                                .go("${ScanVerification.routeName}/$lectureId");
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
                          onPressed: () {
                            context.go("${ScanQrCode.routeName}/$lectureId");
                          },
                          child: const Text("Scan QR Code"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }

          final student = snapshot.data!;

          return Center(
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.all(16),
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Student ID: ${student.studentId}",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Face ID:", style: TextStyle(fontSize: 16)),
                            Icon(
                                student.isFaceIdComplete
                                    ? Icons.check_circle
                                    : Icons.cancel,
                                color: student.isFaceIdComplete
                                    ? Colors.green
                                    : Colors.red),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("QR Code:", style: TextStyle(fontSize: 16)),
                            Icon(
                                student.isQRCodeComplete
                                    ? Icons.check_circle
                                    : Icons.cancel,
                                color: student.isQRCodeComplete
                                    ? Colors.green
                                    : Colors.red),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Location:", style: TextStyle(fontSize: 16)),
                            Icon(
                                student.isLocationAcurate
                                    ? Icons.check_circle
                                    : Icons.cancel,
                                color: student.isLocationAcurate
                                    ? Colors.green
                                    : Colors.red),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Date & Time:",
                                style: TextStyle(fontSize: 16)),
                            Icon(
                                student.isDateTimeAccurate
                                    ? Icons.check_circle
                                    : Icons.cancel,
                                color: student.isDateTimeAccurate
                                    ? Colors.green
                                    : Colors.red),
                          ],
                        ),
                        SizedBox(height: 20),
                        student.isComplete
                            ? Text("✅ Verification Completed!",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue))
                            : Text("⏳ Verification In Progress",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context
                              .go("${ScanVerification.routeName}/$lectureId");
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
                        onPressed: () {
                          context.go("${ScanQrCode.routeName}/$lectureId");
                        },
                        child: const Text("Scan QR Code"),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
