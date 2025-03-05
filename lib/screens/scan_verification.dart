import 'dart:io';
import 'package:attendance_system/ML/Recognition.dart';
import 'package:attendance_system/models/student_record.dart';
import 'package:attendance_system/provider/student_provider.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:provider/provider.dart';

import '../ML/Recognizer.dart';
import '../auth/auth_service.dart';
import '../components/face_painter.dart';

class ScanVerification extends StatefulWidget {
  static const routeName = "/verification_page";
  final String lectureId;
  const ScanVerification({super.key, required this.lectureId});

  @override
  State<ScanVerification> createState() => _ScanVerificationState();
}

class _ScanVerificationState extends State<ScanVerification> {
  File? _image;
  // Image picker instance
  final ImagePicker _picker = ImagePicker();

  // declare detector
  late FaceDetector faceDetector;

  // declare face reconizer
  late Recognizer recognizer;

  Recognition? generatedStudentFaceEmb;

  @override
  void initState() {
    final options =
        FaceDetectorOptions(performanceMode: FaceDetectorMode.accurate);
    // create FaceDetector instance here
    faceDetector = FaceDetector(options: options);

    // initialize face recognizer
    recognizer = Recognizer();
    print("====== Recognizer initialized: ${recognizer.registered}");
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    await Provider.of<StudentProvider>(context, listen: false)
        .getAllEmbeddings();
    // Provider.of<StudentProvider>(context, listen: false)
    //     .fetchEmbeddings(AuthService.currentUser!.email!);
    // set registered faces in Recognizer class instance
    recognizer.registeredFaces =
        Provider.of<StudentProvider>(context, listen: false).registered;

    print(
        '🤓🤓🤓this is from the recognizer instance: ${recognizer.registered}');
    super.didChangeDependencies();
  }

  void _imgFromGallery() async {
    // Pick an image.
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        doFaceDetection();
      });
    }
  }

  void _imgFromCamera() async {
    // Capture a photo.
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        doFaceDetection();
      });
    }
  }

  // list of faces
  List<Face> faces = [];
  void doFaceDetection() async {
    // remove rotation of camera images
    InputImage inputImage = InputImage.fromFile(_image!);

    // image = await _image?.readAsBytes();
    image = await decodeImageFromList(_image!.readAsBytesSync());

    print("input image ==");
    print(inputImage);
    print(_image);
    print(faces.length);

    // passing input to face detector and getting detected faces
    faces = await faceDetector.processImage(inputImage);

    for (Face face in faces) {
      final Rect boundingBox = face.boundingBox;
      print("Rect = " + boundingBox.toString());

      num left = boundingBox.left < 0 ? 0 : boundingBox.left;
      num top = boundingBox.top < 0 ? 0 : boundingBox.top;
      num right =
          boundingBox.right > image.width ? image.width - 1 : boundingBox.right;
      num bottom = boundingBox.bottom > image.height
          ? image.height - 1
          : boundingBox.bottom;

      num width = right - left;
      num height = bottom - top;

      // cropping the face
      final bytes = _image!.readAsBytesSync();
      img.Image? faceImg = img.decodeImage(bytes);
      img.Image croppedFace = img.copyCrop(faceImg!,
          x: left.toInt(),
          y: top.toInt(),
          width: width.toInt(),
          height: height.toInt());

      // Recognition
      Recognition recognition = recognizer.recognize(croppedFace, boundingBox);

      if (recognition.email == AuthService.currentUser!.email) {
        final studentRecord = StudentRecord(
            AuthService.currentUser!.uid, true, false, false, false, false);
        await Provider.of<StudentProvider>(context, listen: false)
            .addNewVerifiedRecord(studentRecord, widget.lectureId);
        Navigator.of(context).pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Face is not registered.\nTry again"),
            backgroundColor: Colors.red[400],
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
      // showFaceRegistrationDialogue(
      //     Uint8List.fromList(img.encodeBmp(croppedFace)), recognition);
    }
    drawRectangleAroundFaces();

    // call the method to perform face recognition on detected face
  }

  // remove rotation of camera images
  removeRotation(File inputImage) async {
    final img.Image? capturedImage =
        img.decodeImage(await File(inputImage.path).readAsBytes());
    final img.Image orientedImage = img.bakeOrientation(capturedImage!);
    return await File(_image!.path).writeAsBytes(img.encodeJpg(orientedImage));
  }

  // draw rectangles
  var image;
  drawRectangleAroundFaces() async {
    print('${image.width}  ${image.height}');

    setState(() {
      image;
      faces;
    });
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
                ? Container(
                    margin: const EdgeInsets.only(
                        top: 60, left: 30, right: 39, bottom: 0),
                    child: FittedBox(
                      child: SizedBox(
                        width: image.width.toDouble(),
                        height: image.width.toDouble(),
                        child: CustomPaint(
                          painter:
                              FacePainter(facesList: faces, imageFile: image),
                        ),
                      ),
                    ),
                  )
                : Icon(
                    Icons.image,
                    size: 200,
                  ),
            ElevatedButton(
                onPressed: () {
                  // open gallery
                  _imgFromGallery();
                },
                onLongPress: () {
                  // launch camera
                  _imgFromCamera();
                },
                child: const Text("Choose/Capture"))
          ],
        ),
      ),
    );
  }
}
