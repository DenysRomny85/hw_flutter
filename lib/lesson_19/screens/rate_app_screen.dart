import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hw_flutter/lesson_19/bloc/rate_app_cubit.dart';

class RateAppScreen extends StatefulWidget {
  const RateAppScreen({super.key});

  @override
  State<RateAppScreen> createState() => _RateAppScreenState();
}

class _RateAppScreenState extends State<RateAppScreen> {
  final commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RateAppCubit, RateApp>(
      listenWhen: (previous, current) {
        return previous.status != current.status;
      },
      listener: (context, state) {
        if (state.status == RateStatus.success) {
          context.pop(true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(27, 61, 112, 1),
          title: Text(
            'Rate App Cubit',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(96, 186, 255, 0.7),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 32,
                      left: 16,
                      right: 16,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'How would you rate the app?',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        BlocBuilder<RateAppCubit, RateApp>(
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(5, (index) {
                                final starNumber = index + 1;
                                final isSelected = starNumber <= state.rating;

                                return IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    context.read<RateAppCubit>().selectRating(
                                      starNumber,
                                    );
                                  },
                                  icon: Icon(
                                    isSelected ? Icons.star : Icons.star_border,
                                    size: 40,
                                    color: Color.fromRGBO(254, 226, 182, 1),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24, top: 12),
                          child: TextField(
                            controller: commentController,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: 'Add a comment',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.all(12),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 44),
                          child: Row(
                            spacing: 10,
                            children: [
                              Expanded(
                                child: BlocBuilder<RateAppCubit, RateApp>(
                                  builder: (context, state) {
                                    final isLoading =
                                        state.status == RateStatus.loading;
                                    return ElevatedButton(
                                      onPressed: isLoading
                                          ? null
                                          : () {
                                              context
                                                  .read<RateAppCubit>()
                                                  .submit(
                                                    commentController.text,
                                                  );
                                            },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size.fromHeight(46),
                                        backgroundColor: const Color.fromRGBO(
                                          27,
                                          61,
                                          112,
                                          1,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      child: isLoading
                                          ? const SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                color: Colors.white,
                                              ),
                                            )
                                          : const Text(
                                              'Submit rating',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    commentController.clear();
                                    context.read<RateAppCubit>().reset();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(46),
                                    backgroundColor: const Color.fromRGBO(
                                      65,
                                      166,
                                      244,
                                      1,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.refresh,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    'Reset rating',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -102,
                  child: BlocBuilder<RateAppCubit, RateApp>(
                    builder: (context, state) {
                      return Image.asset(
                        'assets/images/phone_${state.rating}.png',
                        width: 96,
                        height: 124,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(154, 209, 239, 1),
      ),
    );
  }
}
