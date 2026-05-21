import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(10) {
    on<DecrementEvent>((event, emit) {
      emit(state - 1);
    });

    on<IncrementEvent>((event, emit) {
      emit(state + 1);
    });
  }
}

class CounterEvent {}

class DecrementEvent extends CounterEvent {}

class IncrementEvent extends CounterEvent {}
