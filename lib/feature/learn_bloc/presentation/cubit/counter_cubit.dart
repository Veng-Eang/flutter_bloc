import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increase() {
    emit(state + 1);
  }

  void decrease() {
    if (state == 0) {
      return;
    }
    emit(state - 1);
  }
}
