import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hw_flutter/lesson_19/bloc/rate_app_cubit.dart';
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
            const SizedBox(height: 12),
            FeatureCard(
              title: 'HW 19',
              onTap: () async {
                context.read<RateAppCubit>().reset();
                final result = await context.push<bool>(RouterNames.hw19);

                if (result == true && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.white70,
                      content: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(65, 166, 244, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 12,
                          children: [
                            Image.asset(
                              'assets/images/star.png',
                              width: 21,
                              height: 20,
                            ),
                            Text(
                              'Rating submitted successfully',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Image.asset(
                              'assets/images/star.png',
                              width: 21,
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 12),
            FeatureCard(
              title: 'HW 21',
              onTap: () => context.go(RouterNames.hw21),
            ),
            const SizedBox(height: 12),
            FeatureCard(
              title: 'HW 22',
              onTap: () => context.go(RouterNames.hw22),
            ),
          ],
        ),
      ),
    );
  }
}
