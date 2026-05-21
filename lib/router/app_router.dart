import 'package:go_router/go_router.dart';
import 'package:hw_flutter/lesson_11/homework_11_screen.dart';
import 'package:hw_flutter/lesson_12/homework_12_screen.dart';
import 'package:hw_flutter/lesson_13/homework_13_screen.dart';
import 'package:hw_flutter/lesson_18/homework_bloc/homework_bloc_screen.dart';
import 'package:hw_flutter/lesson_18/homework_cubit/homework_cubit_screen.dart';
import 'package:hw_flutter/lesson_18/state_managment_base_screen.dart';
import 'package:hw_flutter/lesson_19/screens/rate_app_screen.dart';
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
        GoRoute(
          path: 'hw18',
          builder: (context, state) => StateManagmentBaseScreen(),
          routes: [
            GoRoute(
              path: 'cubitExample',
              builder: (context, state) => CounterAppCubit(),
            ),
            GoRoute(
              path: 'blocExample',
              builder: (context, state) => CounterAppBloc(),
            ),
          ],
        ),
        GoRoute(
          path: 'hw19',
          builder: (context, state) => RateAppScreen(),
        ),
      ],
    ),
  ],
);

class Homework13Screen {}
