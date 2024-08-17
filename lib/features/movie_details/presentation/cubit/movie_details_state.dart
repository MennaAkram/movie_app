import 'package:movie_app/shared/bases/base_state.dart';

class LoadingMovie<T> extends BaseState<T> {
  const LoadingMovie();
}

class LoadingList<T> extends BaseState<T> {
  const LoadingList();
}

class DoneState<T> extends BaseState<T> {
  const DoneState();
}

class InitState<T> extends BaseState<T> {
  const InitState();
}

class ErrorState<T> extends BaseState<T> {
  final String message;

  const ErrorState(this.message);
}