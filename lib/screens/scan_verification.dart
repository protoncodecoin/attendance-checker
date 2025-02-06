import 'dart:io';

import 'package:flutter/material.dart';

class ScanVerification extends StatefulWidget {
  static const routeName = "/verification_page";
  const ScanVerification({super.key});

  @override
  State<ScanVerification> createState() => _ScanVerificationState();
}

class _ScanVerificationState extends State<ScanVerification> {
  File? _image;

  chooseImage(){
    //
  }

  captureImage(){
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Face Scan Verification"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(_image!)
                : Icon(
                    Icons.image,
                    size: 200,
                  ),
            ElevatedButton(
                onPressed: () {
                  // open gallery
                  chooseImage();

                }, onLongPress: (){
                  // launch camera
              captureImage();
            } ,child: const Text("Choose/Capture"))
          ],
        ),
      ),
    );
  }
}
