import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:attendance_system/api/mock_student_system_data.dart';
import 'package:attendance_system/models/student.dart';
import 'package:attendance_system/provider/student_provider.dart';
import 'package:attendance_system/utility/widget_functions.dart';

class StudentDetail extends StatefulWidget {
  static String routeName = '/detail_student';

  final String? studentID;

  const StudentDetail({
    super.key,
    this.studentID,
  });

  @override
  State<StudentDetail> createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();
  final TextEditingController _programme = TextEditingController();
  String? imageLocalPath;
  String _msg = "";

  final GlobalKey<FormState> _studentFormKey = GlobalKey<FormState>();

  MockStudentSystemData serviceData = MockStudentSystemData();

  @override
  void initState() {
    if (widget.studentID != null) {
      _fetchStudentData(widget.studentID!);
    } else {
      _fullNameController.text = "";
      _emailController.text = "";
      _levelController.text = "";
      _programme.text = "";
    }
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _levelController.dispose();
    _programme.dispose();

    super.dispose();
  }

  void _fetchStudentData(String studentId) async {
    final student = await Provider.of<StudentProvider>(context, listen: false)
        .getStudent(studentId);

    _fullNameController.text = student["fullname"];
    _emailController.text = student["email"];
    _levelController.text = student["level"];
    _programme.text = student["programmeOfStudy"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.studentID == "" ? "Add new Student" : "Edit Student"),
      ),
      body: Consumer<StudentProvider>(
        builder: (context, provider, child) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Form(
              key: _studentFormKey,
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _msg,
                        style: const TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      // enabled: false,
                      controller: _fullNameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                        labelText: "Full Name",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Provide a valid full name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _emailController,
                      // enabled: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.email),
                        labelText: "Email Address",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Provide a valid email address";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _levelController,
                      // enabled: false,
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.directions),
                        labelText: "Level",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Provide a valid level";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _programme,
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.book),
                        labelText: "Programme",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Provide a valid programme name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        imageLocalPath == null
                            ? const Icon(
                                Icons.photo,
                                size: 100,
                              )
                            : Image.file(
                                File(imageLocalPath!),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                        const Text(
                          "Select Image of Student\nfrom",
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton.icon(
                                onPressed: () {},
                                label: const Text("Gallery"),
                              ),
                              TextButton.icon(
                                onPressed: () {},
                                label: const Text("Camera"),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
                    child: ElevatedButton(
                      onPressed: _submitStudentForm,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text("Save"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submitStudentForm() async {
    // if (imageLocalPath == null ){
    //   showMsg(context, "Please select the student's image");
    //   return;
    // }
    if (_studentFormKey.currentState!.validate()) {
      // submit form
      EasyLoading.show(status: "Submitting Data");

      final fullname = _fullNameController.text;
      final email = _emailController.text;
      final level = _levelController.text;
      final programme = _programme.text;

      try {
        // send data
        final Student newStudent = Student(
            fullname: fullname,
            level: level,
            programeOfStudy: programme,
          lectureIds: [],
            email: email,);

        Provider.of<StudentProvider>(context, listen: false)
            .addNewStudent(newStudent);

        _msg = "Data saved";
        showMsg(context, _msg);

        Navigator.pop(context);
        EasyLoading.dismiss();


      } catch (e) {
        // catch error
        setState(() {
          _msg = "Failed to save data";
          EasyLoading.dismiss();
          showMsg(context, _msg);
        });
      }
    }
  }
}
