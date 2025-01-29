import 'package:attendance_system/pages/dashboard_pages/dashboard_detail_pages/add_student_to_lecture.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:attendance_system/provider/lecturer_provider.dart';
import 'package:attendance_system/utility/functions.dart';

import '../../../api/mock_student_system_data.dart';
import '../../../models/lecture.dart';
import '../../../models/lecturer.dart';
import '../../../models/student.dart';
import '../../dashboard.dart';
import '../../manage_lecture.dart';

class LectureDetailPage extends StatefulWidget {
  static final String routeName = "/detail_lecture";

  final String? lectureId;

  const LectureDetailPage({super.key, this.lectureId});

  @override
  State<LectureDetailPage> createState() => _LectureDetailPageState();
}

class _LectureDetailPageState extends State<LectureDetailPage> {
  MockStudentSystemData serviceData = MockStudentSystemData();
  final GlobalKey<FormState> _lectureFormKey = GlobalKey<FormState>();

  final TextEditingController _courseTitleController = TextEditingController();
  final TextEditingController _lecturerController = TextEditingController();
  final TextEditingController _numStudentsController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final String _errMsg = "";
  Lecturer? selectedLecturer;

  @override
  void initState() {
    Provider.of<LecturerProvider>(context, listen: false).getLecturers();
    if (widget.lectureId != null) {
      _fetchLecture(widget.lectureId!);
    } else {
      // initialize form fields to empty stings
      _courseTitleController.text = "";
      _lecturerController.text = "";
      _numStudentsController.text = "";
      _startTimeController.text = _formatTime(TimeOfDay.now());
      _dateController.text = _formatDate(DateTime.now());
    }
    super.initState();
  }

  @override
  void dispose() {
    _courseTitleController.dispose();
    _lecturerController.dispose();
    _numStudentsController.dispose();
    _startTimeController.dispose();
    _dateController.dispose();

    super.dispose();
  }

  String _formatDate(DateTime pickedDate) {
    return DateFormat('yyyy-MM-dd').format(pickedDate);
  }

  String _formatTime(TimeOfDay pickedTime) {
    final hour = pickedTime.hour.toString().padLeft(2, '0');
    final minute = pickedTime.minute.toString().padLeft(2, '0');

    return '$hour:$minute ${pickedTime.period.toString().split('.')[1]}';
  }

  Future<void> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2025, 1),
        lastDate: DateTime(2025, 12, 31));

    if (picked != null) {
      setState(() {
        _dateController.text = _formatDate(picked);
      });
    }
  }

  Future<void> _selectedTime(BuildContext context) async {
    final picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (picked != null) {
      setState(() {
        _startTimeController.text = _formatTime(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lectureId != null
            ? _courseTitleController.text
            : "Add new Lecture"),
      ),
      body: Consumer<LecturerProvider>(
        builder: (context, provider, child) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Form(
              key: _lectureFormKey,
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _errMsg,
                        style: const TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      // enabled: false,
                      controller: _courseTitleController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                        labelText: "Course Title",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Provide a valid Course Name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField<Lecturer>(
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        items: provider.lecturers.map(
                          (item) {
                            return DropdownMenuItem<Lecturer>(
                              value: item,
                              child: Text(item.fullname),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedLecturer = value;
                          });
                        },
                        value: selectedLecturer,
                        hint: const Text("select a Lecturer for the class"),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a lecturer';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: TextFormField(
                  //     controller: _lecturerController,
                  //     // enabled: false,
                  //     keyboardType: TextInputType.text,
                  //     decoration: InputDecoration(
                  //       filled: true,
                  //       prefixIcon: Icon(Icons.person_2),
                  //       labelText: "Lecturer",
                  //     ),
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return "Provide a valid lecture id";
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _numStudentsController,
                      // enabled: false,
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.numbers),
                        labelText: "No. Students",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Provide a valid number";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 224, 224, 224),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(Icons.timelapse),
                                ),
                                Text(_startTimeController.text),
                              ],
                            )),
                        ElevatedButton(
                          onPressed: () => _selectedTime(context),
                          child: Text("Select Time"),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 224, 224, 224),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(Icons.date_range),
                              ),
                              Text(_dateController.text),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => _selectedDate(context),
                          child: Text("Select Date"),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
                    child: ElevatedButton(
                      onPressed: _submitLectureForm,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text("Save"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.lectureId != null
            ? () {
                // add new student
                _addStudentToClass();
              }
            : null,
        tooltip: "Add new Student",
        child: const Icon(Icons.add),
      ),
    );
  }

  void _fetchLecture(String lectureId) {
    Lecture? lecture = getLecture(lectureId);
    //Lecture? lecture = Provider.of<LecturerProvider>(context, listen: false).getLecture();

    _courseTitleController.text = lecture!.courseTitle;
    _lecturerController.text = lecture.lecturerName;
    _numStudentsController.text = lecture.totalStudents.toString();
    _startTimeController.text = lecture.time;
    _dateController.text = lecture.date;
  }

  void _submitLectureForm() async {}

  void _addStudentToClass() {
    context.go(
        '${Dashboard.routeName}${ManageLecture.routeName}${LectureDetailPage.routeName}/${widget.lectureId}${AddStudentToLecture.routeName}',
        extra: widget.lectureId);
  }

  // void _addNewStudewntBottomSheet(BuildContext context) {
  //   showModalBottomSheet<void>(
  //     context: context,
  //     isScrollControlled: true,
  //     constraints: const BoxConstraints(maxWidth: 480),
  //     builder: (context) => FutureBuilder(
  //       future: serviceData.getExploreData(),
  //       builder: (context, AsyncSnapshot<ExploreData> snapshot) {
  //         if (snapshot.connectionState == ConnectionState.done) {
  //           final lectures = snapshot.data?.lectures ?? [];
  //           final students = snapshot.data?.allStudents ?? [];
  //
  //           final selectedLecture =
  //               getLectureFilter(widget.lectureId!, lectures);
  //
  //           final enrolledStudents = selectedLecture!.students;
  //
  //           final List<Student> unenrolledStudents = [];
  //
  //           for (Student student in students) {
  //             for (Student lectureStudent in enrolledStudents) {
  //               if (!enrolledStudents.contains(student)) {
  //                 unenrolledStudents.add(lectureStudent);
  //                 print(lectureStudent);
  //                 print(enrolledStudents.contains(student));
  //               }
  //             }
  //           }
  //
  //           return
  //         } else {
  //           return Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }
}
