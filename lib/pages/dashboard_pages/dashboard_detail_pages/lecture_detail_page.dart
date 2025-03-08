import 'package:attendance_system/pages/dashboard_pages/dashboard_detail_pages/add_student_to_lecture.dart';
import 'package:attendance_system/provider/lecture_provider.dart';
import 'package:attendance_system/utility/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:attendance_system/provider/lecturer_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../api/mock_student_system_data.dart';
import '../../../models/lecture.dart';
import '../../../models/lecturer.dart';
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
  final TextEditingController _courseClassNumController =
      TextEditingController();
  String _errMsg = "";
  Lecturer? _selectedLecturer;
  bool hasLoaded = false;
  String savedLecturerName = "";

  // hold generated QRCode
  QrImageView? _qrCode;

  @override
  void initState() {
    Provider.of<LecturerProvider>(context, listen: false).getLecturers();
    if (widget.lectureId != null) {
      _fetchLecture(widget.lectureId!);
    } else {
      // initialize form fields to empty stings
      _courseTitleController.text = "";
      _lecturerController.text = "";
      _numStudentsController.text = "0";
      _courseClassNumController.text = "";
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
    _courseClassNumController.dispose();
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
          child: ListView(children: [
            Center(
              child: Form(
                key: _lectureFormKey,
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _errMsg,
                          style:
                              const TextStyle(fontSize: 18, color: Colors.red),
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

                    hasLoaded
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  "Assigned Lecturer",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(savedLecturerName),
                              ],
                            ),
                          )
                        : const SizedBox(),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField<Lecturer>(
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          items: provider.lecturers.map(
                            (item) {
                              return DropdownMenuItem<Lecturer>(
                                // enabled: hasLoaded,
                                value: item,
                                child: Text(item.fullname),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedLecturer = value;
                            });
                          },
                          value: _selectedLecturer,
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

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _numStudentsController,
                        // enabled: false;
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
                      child: TextFormField(
                        // enabled: false,
                        controller: _courseClassNumController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Icon(Icons.house),
                          labelText: "Class Number",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Provide a valid Class Number";
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

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              //  '${Dashboard.routeName}${ManageLecture.routeName}${LectureDetailPage.routeName}/${lecture["id"]}'
                              final data = _generateQRCodeForCourse();

                              if (data != null) {
                                setState(() {
                                  _qrCode = data;
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Text("Generate QRCode"),
                            ),
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
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (_qrCode != null) const Text("Generated QRCode"),
                    Container(
                      child: _qrCode,
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ]),
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

  /// fetch and populate the form fields with the data fetched
  Future<void> _fetchLecture(String lectureId) async {
    // Lecture? lecture = getLecture(lectureId);
    var lecture = await Provider.of<LectureProvider>(context, listen: false)
        .getClass(lectureId);

    hasLoaded = true;

    var lecturer = await Provider.of<LecturerProvider>(context, listen: false)
        .getLecturer(lecture["lecturerId"]);

    setState(() {
      savedLecturerName = lecturer["fullname"];
    });

    _courseTitleController.text = lecture['courseTitle'];
    _lecturerController.text = lecture["lecturerName"];
    _numStudentsController.text = lecture["totalStudents"].toString();
    _startTimeController.text = lecture["time"];
    _dateController.text = lecture["date"];
    _courseClassNumController.text = lecture["classRoom"];
  }

  void _submitLectureForm() async {
    if (_selectedLecturer == null) {
      showMsg(context, "Please select a lecturer");
      return;
    }
    if (_lectureFormKey.currentState!.validate()) {
      EasyLoading.show(status: "Saving Data");

      Lecture newLecture = Lecture(
        activeClass:
            false, // automatically the class is not active because lectures are to be attended in the future
        hasClassEnded: false, // same has active class
        lecturerName: _selectedLecturer!.fullname,
        courseTitle: _courseTitleController.text,
        totalStudents: 0,
        date: _dateController.text,
        time: _startTimeController.text,
        classRoom: _courseClassNumController.text,
        lecturerId: _selectedLecturer!.id.toString(),
        studentIds: [],
      );

      try {
        // save data
        Provider.of<LectureProvider>(context, listen: false)
            .addNewLecture(newLecture);

        _errMsg = "Data Saved";
        showMsg(context, _errMsg);

        Navigator.pop(context);
        EasyLoading.dismiss();
      } catch (e) {
        _errMsg = "Failed to save data";

        EasyLoading.dismiss();
        showMsg(context, _errMsg);
      }
      // } finally {
      //   EasyLoading.dismiss();
      //     showMsg(context, _errMsg);
      // }
    }
  }

  void _addStudentToClass() {
    context.go(
        '${Dashboard.routeName}${ManageLecture.routeName}${LectureDetailPage.routeName}/${widget.lectureId}${AddStudentToLecture.routeName}',
        extra: widget.lectureId);
  }

  /// Generate the QRCodde for the course
  QrImageView? _generateQRCodeForCourse() {
    // check if course title, lecturer, class number and date is populated

    final courseTitle = _courseTitleController.text.trim();
    final lecturer = _lecturerController.text.trim();
    final dateForLecture = _dateController.text.trim();

    if (courseTitle.isNotEmpty &&
        lecturer.isNotEmpty &&
        dateForLecture.isNotEmpty) {
      final data = "$courseTitle,$lecturer,$dateForLecture";

      final generatedQrCodeData = QrImageView(
        data: data,
        version: QrVersions.auto,
        size: 320,
        gapless: false,
      );

      return generatedQrCodeData;
    }

    return null;
  }
}
