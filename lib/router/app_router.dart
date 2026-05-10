import 'package:go_router/go_router.dart';
import 'package:hw_flutter/lesson_11/homework_11_screen.dart';
import 'package:hw_flutter/lesson_12/homework_12_screen.dart';
import 'package:hw_flutter/lesson_13/homework_13_screen.dart';
import 'package:hw_flutter/screens/home_screen.dart';

// GoRouter configuration
final appRouter = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'hw11',
          builder: (context, state) => Homework11Screen(),
        ),
        GoRoute(
          path: 'hw12',
          builder: (context, state) => Homework12Screen(),
        ),
        GoRoute(
          path: 'hw13',
          builder: (context, state) => WidgetConstrainsTrainingScreen(),
        ),
      ],
    ),
  ],
);

class Homework13Screen {}
