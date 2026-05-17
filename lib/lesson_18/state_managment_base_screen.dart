import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hw_flutter/router/router_names.dart';
import 'package:hw_flutter/widgets/feature_card.dart';

class StateManagmentBaseScreen extends StatelessWidget {
  const StateManagmentBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Lab'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FeatureCard(
            title: 'Cubit Example',
            onTap: () => context.go(RouterNames.cubitExample),
          ),
          FeatureCard(
            title: 'Bloc Example',
            onTap: () => context.go(RouterNames.blocExample),
          ),
        ],
      ),
    );
  }
}
