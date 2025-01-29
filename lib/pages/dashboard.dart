import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:attendance_system/auth/auth_service.dart';
import 'package:attendance_system/components/dashboard_item.dart';
import 'package:attendance_system/models/dashboard_models.dart';

import 'login.dart';

class Dashboard extends StatelessWidget {
  static final String routeName = '/dashboard';

  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            onPressed: () {
              AuthService.logout().then((onValue) {
                if (context.mounted) {
                  return context.go(LoginPage.routeName);
                }
              });
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: dashboardModelsList.length,
          itemBuilder: (context, index) {
            final model = dashboardModelsList[index];
            return DashboardItem(
              dashboardItem: model,
              onPress: (route) {
                context.go(route);
              },
            );
          }),
    );
  }
}
