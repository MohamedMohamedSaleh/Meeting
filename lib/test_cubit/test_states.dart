part of 'test_cubit.dart';

abstract class TestStates {}

final class InitialState extends TestStates {}

final class TestStateIncrement extends TestStates {}

final class TestStatedecrement extends TestStates {}

final class TestStateReset extends TestStates {}

final class TestStateLoading extends TestStates {}

final class TestStateError extends TestStates {}

final class TestStateSuccess extends TestStates {
  final List<dynamic> model;

  TestStateSuccess({required this.model});
}
