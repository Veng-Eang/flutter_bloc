import 'package:flutter_bloc/flutter_bloc.dart';

sealed class CounterEvent {}

class Increasemented extends CounterEvent {}

class Decreasemented extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<Increasemented>((event, emit) {
      emit(state + 1);
    });
    on<Decreasemented>((event, emit) {
      if (state == 0) {
        return;
      }
      emit(state - 1);
    });
  }
}
