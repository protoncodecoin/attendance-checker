import 'package:attendance_system/provider/lecture_provider.dart';
import 'package:attendance_system/provider/student_provider.dart';
import 'package:attendance_system/utility/widget_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/radio_group.dart';
import '../../../models/student.dart';

class AddStudentToLecture extends StatefulWidget {
  static const routeName = "/add_student_to_class";
  final String courseId;

  const AddStudentToLecture({super.key, required this.courseId});

  @override
  State<AddStudentToLecture> createState() => _AddStudentToLectureState();
}

class _AddStudentToLectureState extends State<AddStudentToLecture> {
  @override
  void initState() {
    Provider.of<StudentProvider>(context, listen: false).getStudents();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Student> allStudents =
        Provider.of<StudentProvider>(context, listen: false).studentList;

    var sortBy =
        Provider.of<StudentProvider>(context, listen: false).enrollmentStatus;
    bool hasBeenAdded = sortBy == "enrolled" ? true : false;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add or Remove Students"),
        actions: [
          // TODO: add sort dialog
          IconButton(
            tooltip: "Sort Student Status",
            onPressed: () {
              _showSortDialog();
            },
            icon: Icon(Icons.sort),
          ),
        ],
      ),
      body: Consumer<LectureProvider>(
        builder: (context, provider, child) => FutureBuilder(
            future: provider.getClass(widget.courseId),
            builder: (BuildContext context,
                AsyncSnapshot<Map<String, dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic>? selectedClass = snapshot.data;

                var enrolledStudents = selectedClass!["studentIds"];
                List<String> enrolledStudents2 =
                    enrolledStudents.cast<String>();

                // use the ids from enrolledStudents2 to get the Student objects
                List<Student> resolvedStudentsObjects = [];

                resolvedStudentsObjects = allStudents
                    .where((student) => enrolledStudents2.contains(student.id))
                    .toList();

                // show the student based on enrollment status
                var generalStudents = [];
                switch (sortBy) {
                  case "unEnrolled":
                    var enrolledStudentsSet = enrolledStudents2.toSet();

                    generalStudents = allStudents
                        .toSet()
                        .where((student) =>
                            !enrolledStudentsSet.contains(student.id))
                        .toList();
                    break;

                  case "enrolled":
                    // logic to show enrolled students
                    generalStudents = resolvedStudentsObjects;
                    break;

                  default:
                    showMsg(context, "Something went wrong");
                    Provider.of<StudentProvider>(context, listen: false)
                        .enrollmentStatus = "unEnrolled";
                    break;
                }

                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          final student = generalStudents[index];

                          return ListTile(
                            title: Text(student.fullname),
                            subtitle: Text(student.programeOfStudy),
                            trailing: IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    if (sortBy == "enrolled") {
                                      // remove student from class
                                      provider.removeStudentFromLecture(
                                          student.id!, widget.courseId);
                                    } else {
                                      // add student to class
                                      provider.addStudentToLecture(
                                          student.id!, widget.courseId);
                                    }
                                  },
                                );
                              },
                              icon: Icon(
                                hasBeenAdded ? Icons.remove : Icons.add,
                                color: hasBeenAdded ? Colors.red : Colors.green,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                        itemCount: generalStudents.length),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  void _showSortDialog() {
    showDialog(
        context: context,
        builder: (context) => Consumer<StudentProvider>(
              builder: (context, provider, child) => AlertDialog(
                title: const Text("Sort on Enrollment Status"),
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
                      value: "enrolled",
                      groupValue: provider.enrollmentStatus,
                      label: "Enrolled",
                      onChanged: (value) {
                        /// TODO: use provider to handle change sort value
                        if (kDebugMode) {
                          print(value);
                        }

                        Navigator.of(context).pop();
                        setState(() {
                          provider.enrollmentStatus = value!;
                        });
                      },
                    ),
                    RadioGroup(
                      value: "unEnrolled",
                      groupValue: provider.enrollmentStatus,
                      label: "UnEnrolled",
                      onChanged: (value) {
                        /// TODO: use provider to handle change sort value
                        if (kDebugMode) {
                          print(value);
                        }
                        Navigator.of(context).pop();
                        setState(() {
                          provider.enrollmentStatus = value!;
                        });
                      },
                    )
                  ],
                ),
              ),
            ));
  }
}
