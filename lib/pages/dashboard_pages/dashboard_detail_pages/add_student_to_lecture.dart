import 'package:attendance_system/provider/lecture_provider.dart';
import 'package:attendance_system/provider/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/student.dart';

class AddStudentToLecture extends StatefulWidget {
  static const routeName = "/add_student_to_class";
  final String classId;

  const AddStudentToLecture({super.key, required this.classId});

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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add or Remove Students"),
      ),
      body: Consumer<LectureProvider>(
        builder: (context, provider, child) => FutureBuilder(
            future: provider.getClass(widget.classId),
            builder: (BuildContext context,
                AsyncSnapshot<Map<String, dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic>? data = snapshot.data;
                // var enrolledStudents = data!["students"];
                print('--------------');
                print(data);
                // TODO:
                // get the student from the data
                // get all students from the student provider
                //
                //
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          // final student = students[index];
                          bool status = true;
                          // print(unenrolledStudents);

                          return ListTile(
                            title: Text(student.fullname),
                            subtitle: Text(student.programeOfStudy),
                            trailing: IconButton(
                              onPressed: () {
                                // setState(
                                //       () {
                                //     if (status) {
                                //       unEnrollStudent(student, students);
                                //     } else {
                                //       newEnrollStudent(student, students);
                                //     }
                                //     // remove student id from unenrolled list
                                //     // add the student to the list of lecture student
                                //   },
                                // );
                              },
                              icon: Icon(
                                status ? Icons.add : Icons.remove,
                                color: status ? Colors.green : Colors.red,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                        itemCount: allStudents.length),
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
}
