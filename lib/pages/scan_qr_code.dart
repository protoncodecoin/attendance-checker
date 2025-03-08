import 'package:attendance_system/auth/auth_service.dart';
import 'package:attendance_system/provider/lecture_provider.dart';
import 'package:attendance_system/provider/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

import '../utility/constants.dart';

class ScanQrCode extends StatefulWidget {
  static const routeName = "/scan_qr_code";

  final String lectureId;
  const ScanQrCode({super.key, required this.lectureId});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String _qrData = "Scan Data will appear here";
  Map<String, dynamic>? currentLecture;
  String computedQRCode = "";

  Future<void> scanQRCode() async {
    try {
      String qrCodeRes = await FlutterBarcodeScanner.scanBarcode(
          KCOLOR_CODE, KCANCEL_BUTTON_TEXT, true, ScanMode.QR);

      if (!mounted) return;

      if (computedQRCode.isNotEmpty && qrCodeRes == computedQRCode) {
        await Provider.of<StudentProvider>(context, listen: false)
            .updateFieldVerifiedRecord("isQRCodeComplete", true,
                AuthService.currentUser!.uid, widget.lectureId);
        setState(() {
          _qrData = "Verified✅";
        });
      } else {
        setState(() {
          _qrData = "Invalid verification Code ❌";
        });
      }
    } on PlatformException {
      _qrData = "Failed to read QR Code data";
    }
  }

  Future<void> getCurrentClass(String lectureId) async {
    currentLecture = await Provider.of<LectureProvider>(context, listen: false)
        .getLecture(lectureId);

    computedQRCode =
        '$currentLecture["courseTitle"],$currentLecture["lecturer"],$currentLecture["dateForLecture"]';
  }

  @override
  void initState() {
    getCurrentClass(widget.lectureId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              _qrData,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  scanQRCode();
                },
                child: const Text("Scan Code"))
          ],
        ),
      ),
    );
  }
}
