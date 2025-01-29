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
    var allStudentsIds = allStudents.map((student)=> student.id).toList();

    var sortBy = Provider.of<StudentProvider>(context, listen: false).enrollmentStatus;


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
                List<String> enrolledStudents2 = enrolledStudents.cast<String>();

               // show the student based on enrollment status
                var sortBy = Provider.of<StudentProvider>(context, listen: false).enrollmentStatus;
                List<String?> generalStudents = [];
                switch (sortBy) {
                  case "unEnrolled":
                    // logic to show unenrolled students
                    var  unEnrolled = allStudentsIds.toSet().difference(enrolledStudents2.toSet());
                    generalStudents  = unEnrolled.toList();
                    break;

                  case "enrolled":
                    // logic to show enrolled students
                    generalStudents = enrolledStudents2;
                    break;

                  default:
                    showMsg(context, "Something went wrong");
                    Provider.of<StudentProvider>(context, listen: false).enrollmentStatus = "unEnrolled";
                    break;
                }

                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          final student = students[index];
                          bool hasBeenAdded = false;

                          return ListTile(
                            title: Text(student.fullname),
                            subtitle: Text(student.programeOfStudy),
                            trailing: IconButton(
                              onPressed: () {
                                setState(
                                      () {
                                    if (sortBy == "enrolled") {
                                      // remove student from class
                                      print("The logic came here === enrolled");
                                      provider.removeStudentFromLecture(student.id!, widget.courseId);
                                    } else {
                                      // add student to class
                                      print("The logic came here === unEnrolled");
                                      provider.addStudentToLecture(student.id!, widget.courseId);
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

  /// Take parent data and child data to get difference
  List<Student> _unenrolledStudents(List<Student> parent, List<Student> child) {
    var unenrolled = parent.toSet().difference(child.toSet()).toList();

    return unenrolled;
  }

  void _showSortDialog() {
    showDialog(
      context: context,
      builder: (context) => Consumer<StudentProvider>(builder: (context, provider, child) => AlertDialog(
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
      ),)
    );
  }
}
