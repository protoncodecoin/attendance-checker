import 'package:attendance_system/pages/face_registration.dart';
import 'package:flutter/material.dart';
import 'package:attendance_system/pages/manage_lecture.dart';
import 'package:attendance_system/pages/manage_lecturer.dart';
import 'package:attendance_system/pages/dashboard.dart';
import 'package:attendance_system/pages/manage_students.dart';

class DashboardModels {
  final String name;
  final IconData icon;
  final String routeName;

  const DashboardModels({
    required this.name,
    required this.icon,
    required this.routeName,
  });
}

List<DashboardModels> dashboardModelsList = [
  DashboardModels(
    name: "Lectures",
    icon: Icons.grade,
    routeName: '${Dashboard.routeName}${ManageLecture.routeName}',
  ),
  DashboardModels(
    name: "Lecturers",
    icon: Icons.add,
    routeName: '${Dashboard.routeName}${ManageLecturer.routeName}',
  ),
  DashboardModels(
    name: "Students",
    icon: Icons.person,
    routeName: '${Dashboard.routeName}${ManageStudent.routeName}',
  ),
  DashboardModels(
    name: "Face Registration",
    icon: Icons.person,
    routeName: '${Dashboard.routeName}${FaceRegistration.routeName}',
  ),
];
