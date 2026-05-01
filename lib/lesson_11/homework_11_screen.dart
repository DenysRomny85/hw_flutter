import 'package:flutter/material.dart';

class Homework11Screen extends StatelessWidget {
  Homework11Screen({super.key});

  final ValueNotifier<bool> isPressed_1 = ValueNotifier(false);
  final ValueNotifier<bool> isPressed_2 = ValueNotifier(false);
  final ValueNotifier<bool> isPressed_3 = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 11'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Expanded(
              flex: 1,
              child: ValueListenableBuilder(
                valueListenable: isPressed_1,
                builder: (context, value, child) {
                  return InkWell(
                    onTap: () => {isPressed_1.value = !isPressed_1.value},
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                        color: value
                            ? Colors.blue.shade900
                            : Colors.blue.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        boxShadow: value
                            ? const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 30,
                                  offset: Offset(0, 4),
                                ),
                              ]
                            : [],
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                value ? Icons.star : Icons.star_border,
                                size: 30,
                                color: Colors.amber,
                              ),
                              const Text(
                                'Привіт, Flutter!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                value ? Icons.star : Icons.star_border,
                                color: Colors.amber,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ValueListenableBuilder(
              valueListenable: isPressed_2,
              builder: (context, value, child) {
                return InkWell(
                  onTap: () => {isPressed_2.value = !isPressed_2.value},
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 300,
                    height: 150,
                    decoration: BoxDecoration(
                      color: value
                          ? Colors.green.shade900
                          : Colors.green.shade300,
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      boxShadow: value
                          ? const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 30,
                                offset: Offset(0, 4),
                              ),
                            ]
                          : [],
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              value ? Icons.star : Icons.star_border,
                              size: 30,
                              color: Colors.amber,
                            ),
                            const Text(
                              'Привіт, Flutter!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              value ? Icons.star : Icons.star_border,
                              color: Colors.amber,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: isPressed_3,
              builder: (context, value, child) {
                return InkWell(
                  onTap: () => {isPressed_3.value = !isPressed_3.value},
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 300,
                    height: 150,
                    decoration: BoxDecoration(
                      color: value ? Colors.red.shade900 : Colors.red.shade300,
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      boxShadow: value
                          ? const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 30,
                                offset: Offset(0, 4),
                              ),
                            ]
                          : [],
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              value ? Icons.star : Icons.star_border,
                              size: 30,
                              color: Colors.amber,
                            ),
                            const Text(
                              'Привіт, Flutter!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              value ? Icons.star : Icons.star_border,
                              color: Colors.amber,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
