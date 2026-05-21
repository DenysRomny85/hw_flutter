import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hw_flutter/router/router_names.dart';
import 'package:hw_flutter/widgets/feature_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Lab'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FeatureCard(
              title: 'HW 11',
              onTap: () => context.go(RouterNames.hw11),
            ),
            const SizedBox(height: 12),
            FeatureCard(
              title: 'HW 12',
              onTap: () => context.go(RouterNames.hw12),
            ),
            const SizedBox(height: 12),
            FeatureCard(
              title: 'HW 13',
              onTap: () => context.go(RouterNames.hw13),
            ),
            const SizedBox(height: 12),
            FeatureCard(
              title: 'HW 18',
              onTap: () => context.go(RouterNames.hw18),
            ),
          ],
        ),
      ),
    );
  }
}
