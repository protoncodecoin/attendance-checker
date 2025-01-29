import 'package:attendance_system/provider/lecture_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:attendance_system/provider/lecturer_provider.dart';
import 'package:attendance_system/provider/student_provider.dart';
import 'firebase_options.dart';
import 'router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StudentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LecturerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LectureProvider(),
        ),
      ],
      child: AttendanceSystem(),
    ),
  );
}

class AttendanceSystem extends StatelessWidget {
  const AttendanceSystem({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: 'Students Attendance System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: goRouter,
    );
  }
}
