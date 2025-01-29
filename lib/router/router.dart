// private navigators
import 'package:attendance_system/pages/dashboard_pages/dashboard_detail_pages/add_student_to_lecture.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:attendance_system/auth/auth_service.dart';
import 'package:attendance_system/pages/dashboard_pages/dashboard_detail_pages/lecture_detail_page.dart';
import 'package:attendance_system/pages/manage_lecture.dart';
import 'package:attendance_system/pages/dashboard_pages/dashboard_detail_pages/lecturer_detail_page.dart';
import 'package:attendance_system/pages/manage_lecturer.dart';
import 'package:attendance_system/pages/dashboard_pages/dashboard_detail_pages/student_detail.dart';
import 'package:attendance_system/pages/manage_students.dart';
import 'package:attendance_system/pages/dashboard.dart';
import 'package:attendance_system/screens/history.dart';
import 'package:attendance_system/screens/on_going_class.dart';
import 'package:attendance_system/screens/profile.dart';

import '../home.dart';
import '../pages/login.dart';
import '../screens/upcoming.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: "shellC");
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: "shellD");
// final _shellNavigatorEKey = GlobalKey<NavigatorState>(debugLabel: "shellE");

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  redirect: (context, state) {
    if (AuthService.currentUser == null) {
      return LoginPage.routeName;
    }

    return null;
  },
  initialLocation: "/",
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        // This is the first tab with it nested branches or routes
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            GoRoute(
              path: UpcomingPage.routeName,
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: UpcomingPage()),
            ),
          ],
        ),

// This is the second
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            GoRoute(
              path: HistoryPage.routeName,
              pageBuilder: (context, state) => NoTransitionPage(
                child: HistoryPage(),
              ),
            ),
          ],
        ),

// This shell branch is for third tab
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCKey,
          routes: [
            GoRoute(
              path: OnGoingClass.routeName,
              pageBuilder: (context, state) => NoTransitionPage(
                child: OnGoingClass(),
              ),
            ),
          ],
        ),

        StatefulShellBranch(
          navigatorKey: _shellNavigatorDKey,
          routes: [
            GoRoute(
              path: ProfileScreen.routeName,
              pageBuilder: (context, state) => NoTransitionPage(
                child: ProfileScreen(),
              ),
            ),
          ],
        ),

        // )
      ],
    ),
    GoRoute(
      path: LoginPage.routeName,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: Dashboard.routeName,
      builder: (context, state) => Dashboard(),
      routes: [
        GoRoute(
          path: ManageStudent.routeName,
          builder: (context, state) => ManageStudent(),
          routes: [
            GoRoute(
              path: '${StudentDetail.routeName}/:studentId',
              builder: (context, state) {
                final id = state.pathParameters['studentId'];

                return StudentDetail(
                  studentID: id,
                );
              },
            ),
            GoRoute(
              path: StudentDetail.routeName,
              builder: (context, state) {
                return StudentDetail();
              },
            ),
          ],
        ),
        GoRoute(
          path: ManageLecturer.routeName,
          builder: (context, state) => ManageLecturer(),
          routes: [
            GoRoute(
              path: '${LecturerDetailPage.routeName}/:lecturerId',
              builder: (context, state) {
                final id = state.pathParameters['lecturerId'];
                return LecturerDetailPage(
                  lectureId: id,
                );
              },
            ),
            GoRoute(
              path: LecturerDetailPage.routeName,
              builder: (context, state) {
                return LecturerDetailPage();
              },
            )
          ],
        ),
        GoRoute(
          path: ManageLecture.routeName,
          builder: (context, state) => ManageLecture(),
          routes: [
            GoRoute(
              path: '${LectureDetailPage.routeName}/:lectureId',
              builder: (context, state) {
                final id = state.pathParameters['lectureId'];
                return LectureDetailPage(
                  lectureId: id,
                );
              },
              routes: [
                GoRoute(
                    path: AddStudentToLecture.routeName,
                    builder: (context, state) {
                      final String extra = GoRouterState.of(context).extra! as String;
                      return AddStudentToLecture(courseId: extra);
                    })
              ],
            ),
            GoRoute(
              path: LectureDetailPage.routeName,
              builder: (context, state) => LectureDetailPage(),
            )
          ],
        ),
      ],
    ),
  ],
);
