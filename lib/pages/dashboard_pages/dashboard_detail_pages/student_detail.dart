import 'dart:io';
import 'dart:typed_data';

import 'package:attendance_system/ML/Recognition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:attendance_system/models/student.dart';
import 'package:attendance_system/provider/student_provider.dart';
import 'package:attendance_system/utility/widget_functions.dart';
import 'package:image/image.dart' as img;

import '../../../ML/Recognizer.dart';
import '../../../components/face_painter.dart';

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
  TextEditingController faceEmbeddingTextEditingController =
      TextEditingController();

  Recognition? generatedStudentFaceEmb;

  String? imageLocalPath;
  String _msg = "";

  // Image picker instance
  final ImagePicker _picker = ImagePicker();
  // File instance
  File? _image;

  final GlobalKey<FormState> _studentFormKey = GlobalKey<FormState>();

  // MockStudentSystemData serviceData = MockStudentSystemData();

  // declare detector
  late FaceDetector faceDetector;

  // declare face reconizer
  late Recognizer recognizer;

  @override
  void initState() {
    final options =
        FaceDetectorOptions(performanceMode: FaceDetectorMode.accurate);
    // create FaceDetector instance here
    faceDetector = FaceDetector(options: options);

    // initialize face recognizer
    recognizer = Recognizer();

    print("======= I just got initialized=======");

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

  void _fetchStudentData(String studentId) async {
    final student = await Provider.of<StudentProvider>(context, listen: false)
        .getStudent(studentId);

    _fullNameController.text = student["fullname"];
    _emailController.text = student["email"];
    _levelController.text = student["level"];
    _programme.text = student["programmeOfStudy"];
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
      showFaceRegistrationDialogue(
          Uint8List.fromList(img.encodeBmp(croppedFace)), recognition);
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

  // show face Registation Dialogue

  showFaceRegistrationDialogue(Uint8List croppedFace, Recognition recognition) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Face Registration"),
              content: SizedBox(
                height: 340,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Image.memory(
                      croppedFace,
                      width: 200,
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(child: Text(_emailController.text)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: _emailController.text == ""
                          ? null
                          : () async {
                              print(
                                  "========= This is the result of the embedding =============");
                              // print(faceEmbeddingTextEditingController.text);
                              // print(recognition.location);
                              print(_emailController.text);
                              print("\n ======================");
                              // recognizer.registeredFaceInDb(
                              //     faceEmbeddingTextEditingController.text,
                              //     recognition.embeddings);
                              // recognizer.registerFaceInDb(
                              //     faceEmbeddingTextEditingController.text,
                              //     recognition.embeddings);

                              try {
                                // save embedding in firebase
                                await Provider.of<StudentProvider>(context,
                                        listen: false)
                                    .addNewRecognition(
                                        _emailController.text, recognition);

                                faceEmbeddingTextEditingController.text = "";
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Face Registered"),
                                  ),
                                );
                              } catch (e) {
                                faceEmbeddingTextEditingController.text = "";
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Failed to  Register Face"),
                                  ),
                                );
                                print('error: $e');
                              }
                            },
                      // style: ElevatedButton.styleFrom(p),
                      child: const Text("Register"),
                    )
                  ],
                ),
              ),
              contentPadding: EdgeInsets.zero,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.studentID == "" ? "Add new Student" : "Edit Student"),
      ),
      body: Consumer<StudentProvider>(
        builder: (context, provider, child) => ListView(
          children: [
            Padding(
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
                            style: const TextStyle(
                                fontSize: 18, color: Colors.red),
                          ),
                        ),
                      ),
                      // Container(
                      //   child: Image.asset("assets_models/hey.jpeg"),
                      // ),
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
                      const Text(
                        "Select Image of Student\nfrom",
                        textAlign: TextAlign.center,
                      ),
                      Card(
                        child: Column(
                          children: [
                            image == null
                                ? const Icon(
                                    Icons.photo,
                                    size: 100,
                                  )
                                : Container(
                                    margin: const EdgeInsets.only(
                                        top: 60,
                                        left: 30,
                                        right: 39,
                                        bottom: 0),
                                    child: FittedBox(
                                      child: SizedBox(
                                        width: image.width.toDouble(),
                                        height: image.width.toDouble(),
                                        child: CustomPaint(
                                          painter: FacePainter(
                                              facesList: faces,
                                              imageFile: image),
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton.icon(
                              onPressed: () {
                                _imgFromGallery();
                              },
                              label: const Text("Gallery"),
                            ),
                            TextButton.icon(
                              onPressed: () {
                                _imgFromCamera();
                              },
                              label: const Text("Camera"),
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
          ],
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

      // save recognition data

      try {
        // send data
        final Student newStudent = Student(
          fullname: fullname,
          level: level,
          programeOfStudy: programme,
          lectureIds: [],
          email: email,
        );

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
