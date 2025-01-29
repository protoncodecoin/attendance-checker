import 'package:flutter/material.dart';
import 'package:attendance_system/models/dashboard_models.dart';

class DashboardItem extends StatelessWidget {
  final DashboardModels dashboardItem;
  final Function(String) onPress;

  const DashboardItem({
    super.key,
    required this.dashboardItem,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(dashboardItem.icon),
              const SizedBox(
                height: 10,
              ),
              Text(
                dashboardItem.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
      onTap: () => onPress(dashboardItem.routeName),
    );
  }
}
