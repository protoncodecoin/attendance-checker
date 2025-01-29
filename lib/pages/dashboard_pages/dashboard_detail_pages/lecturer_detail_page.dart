import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:attendance_system/api/mock_student_system_data.dart';
import 'package:attendance_system/models/lecturer.dart';
import 'package:attendance_system/provider/lecturer_provider.dart';
// import 'package:attendance_system/utility/functions.dart';

import '../../../utility/widget_functions.dart';

class LecturerDetailPage extends StatefulWidget {
  static String routeName = "/detail_lecturer";

  final String? lectureId;

  const LecturerDetailPage({super.key, this.lectureId});

  @override
  State<LecturerDetailPage> createState() => _LecturerDetailPageState();
}

class _LecturerDetailPageState extends State<LecturerDetailPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _msg = "";

  final GlobalKey<FormState> _lecturerFormKey = GlobalKey<FormState>();

  MockStudentSystemData serviceData = MockStudentSystemData();

  @override
  void initState() {
    if (widget.lectureId != null) {
      // fetch lecturer's data
      _fetchLecturerData(widget.lectureId!);
    } else {
      _fullNameController.text = "";
      _emailController.text = "";
    }
    super.initState();
  }

  void _fetchLecturerData(String lecturerId) async {
    // final lecturer = getLecturer(lecturerId);

    final lecturer = await Provider.of<LecturerProvider>(context, listen: false)
        .getLecturer(lecturerId);

    _fullNameController.text = lecturer["fullname"];
    _emailController.text = lecturer["email"];
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.lectureId == "" ? "Add new Lecturer" : "Edit Lecturer"),
      ),
      body: Consumer<LecturerProvider>(
        builder: (context, provider, child) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Form(
              key: _lecturerFormKey,
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
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
                    child: ElevatedButton(
                      onPressed: _submitLecturerForm,
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
    );
  }

  void _submitLecturerForm() async {
    if (_lecturerFormKey.currentState!.validate()) {
      EasyLoading.show(status: "Submitting Data");

      final fullName = _fullNameController.text;
      final email = _emailController.text;

      try {
        final lecturer = Lecturer(fullname: fullName, email: email);

        Provider.of<LecturerProvider>(context, listen: false)
            .addNewLecturer(lecturer);

        _msg = "Data saved";
      } catch (e) {
        // catch error
        setState(() {
          _msg = "Failed to save data";
        });
      } finally {
        EasyLoading.dismiss();
        showMsg(context, _msg);
      }
    }
  }
}
