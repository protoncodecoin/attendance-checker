import 'package:flutter/material.dart';

class FaceRegistration extends StatefulWidget {
  static String routeName = "/register_face";

  const FaceRegistration({super.key});

  @override
  State<FaceRegistration> createState() => _FaceRegistrationState();
}

class _FaceRegistrationState extends State<FaceRegistration> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Register Student Face"),
      ),
    );
  }
}
