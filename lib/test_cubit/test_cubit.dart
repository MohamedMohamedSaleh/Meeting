import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting/test_cubit/model.dart';

part 'test_states.dart';

class TestCubit extends Cubit<TestStates> {
  TestCubit() : super(InitialState());

  int counter = 0;

  void increment() {
    counter++;

    emit(TestStateIncrement());
  }

  void decrement() {
    counter--;
    emit(TestStatedecrement());
  }

  void reset() {
    counter = 0;
    emit(TestStateReset());
  }

  Future<void> fetchproduct() async {
    try {
      emit(TestStateLoading());
      final response = await Dio().get('https://fakestoreapi.com/products/2');
      final model = ProductModel.fromJson(response.data);
      emit(TestStateSuccess(model:  model));
    }on DioException catch (e) {
      debugPrint(e.message.toString());
      emit(TestStateError());
    }
  }
}
