import 'package:flutter_bloc/flutter_bloc.dart';

enum RateStatus {
  initial,
  loading,
  success,
  error,
}

class RateApp {
  const RateApp({
    required this.rating,
    required this.status,
  });

  const RateApp.initial() : rating = 0, status = RateStatus.initial;

  final int rating;
  final RateStatus status;

  RateApp copyWith({
    int? rating,
    RateStatus? status,
  }) {
    return RateApp(
      rating: rating ?? this.rating,
      status: status ?? this.status,
    );
  }
}

class RateAppCubit extends Cubit<RateApp> {
  RateAppCubit() : super(const RateApp.initial());

  void selectRating(int rating) {
    final newRating = state.rating == rating ? 0 : rating;
    emit(
      state.copyWith(
        rating: newRating,
        status: RateStatus.initial,
      ),
    );
  }

  void reset() {
    emit(const RateApp.initial());
  }

  Future<void> submit(String comment) async {
    emit(
      state.copyWith(
        status: RateStatus.loading,
      ),
    );

    await Future<void>.delayed(const Duration(milliseconds: 1000));

    emit(
      state.copyWith(
        status: RateStatus.success,
      ),
    );
  }
}
