import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:attendance_system/models/lecturer.dart';

import '../api/mock_student_system_data.dart';
import 'dashboard.dart';
import 'dashboard_pages/dashboard_detail_pages/lecturer_detail_page.dart';

class ManageLecturer extends StatefulWidget {
  static String routeName = "/list_lectures";

  const ManageLecturer({super.key});

  @override
  State<ManageLecturer> createState() => _ManageLecturerState();
}

class _ManageLecturerState extends State<ManageLecturer> {
  final MockStudentSystemData mockService = MockStudentSystemData();
  final Stream<QuerySnapshot> _lecturerStream =
      FirebaseFirestore.instance.collection(collectionLecturer).snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Lecturers"),
        actions: [
          IconButton(
            tooltip: "Add new Lecturer",
            onPressed: () {
              context.go(
                  '${Dashboard.routeName}${ManageLecturer.routeName}${LecturerDetailPage.routeName}');
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _lecturerStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final lecturerDocs = snapshot.data!.docs;

          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              final data = lecturerDocs[index].data() as Map<String, dynamic>;

              return InkWell(
                onTap: () {
                  context.go(
                    '${Dashboard.routeName}${ManageLecturer.routeName}${LecturerDetailPage.routeName}/${data["id"]}',
                  );
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Full Name:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          data["fullname"],
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "email:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          data["email"],
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: snapshot.data!.docs.length,
          );
        },
      ),
    );
  }
}
