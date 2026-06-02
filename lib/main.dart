import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_flutter/lesson_18/homework_bloc/bloc/counter_bloc.dart';
import 'package:hw_flutter/lesson_18/homework_cubit/cubit/counter_cubit.dart';
import 'package:hw_flutter/lesson_19/bloc/rate_app_cubit.dart';
import 'package:hw_flutter/lesson_22/error_handling_homework/data/repository/fake_user_repository.dart';
import 'package:hw_flutter/lesson_22/error_handling_homework/presentation/cubit/user_profile_cubit.dart';
import 'package:hw_flutter/router/app_router.dart';

void main() {
  runApp(const FlutterWidgetsApp());
}

class FlutterWidgetsApp extends StatelessWidget {
  const FlutterWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => RateAppCubit(),
        ),
        BlocProvider(
          create: (context) =>
              UserProfileCubit(FakeUserRepository())..loadUserProfile(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
      ),
    );
  }
}
