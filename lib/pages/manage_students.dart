import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:attendance_system/api/mock_student_system_data.dart';
import 'package:attendance_system/models/models.dart';
import 'package:attendance_system/pages/dashboard_pages/dashboard_detail_pages/student_detail.dart';

import 'dashboard.dart';

class ManageStudent extends StatefulWidget {
  static String routeName = "/list_students";

  const ManageStudent({super.key});

  @override
  State<ManageStudent> createState() => _ManageStudentState();
}

class _ManageStudentState extends State<ManageStudent> {
  final MockStudentSystemData mockService = MockStudentSystemData();
  final Stream<QuerySnapshot> _studentStream =
      FirebaseFirestore.instance.collection(collectionStudent).snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Manage Students"),
          actions: [
            IconButton(
              tooltip: "Add new student",
              onPressed: () {
                context.go(
                    '${Dashboard.routeName}${ManageStudent.routeName}${StudentDetail.routeName}');
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: StreamBuilder(
          stream: _studentStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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

            final studentsDocs = snapshot.data!.docs;

            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                final data = studentsDocs[index].data() as Map<String, dynamic>;

                return InkWell(
                  onTap: () {
                    context.go(
                      '${Dashboard.routeName}${ManageStudent.routeName}${StudentDetail.routeName}/${data["id"]}',
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
                            data[labelFullname],
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Programme:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data[labelProgrammeOfStudy],
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Level:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data[labelLevel],
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
        ));
  }
}
