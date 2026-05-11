import 'package:flutter/material.dart';
import 'package:hw_flutter/router/app_router.dart';

void main() {
  runApp(const FlutterWidgetsApp());
}

class FlutterWidgetsApp extends StatelessWidget {
  const FlutterWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
    );
  }
}
