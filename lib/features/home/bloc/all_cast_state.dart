part of 'all_cast_bloc.dart';

@immutable
abstract class AllCastState {}

class AllCastInitial extends AllCastState {}

abstract class AllCastActionState extends AllCastState {}

class AllCastFetchSuccessfulState extends AllCastState {
  final Set<Character> characterSet;

  AllCastFetchSuccessfulState(this.characterSet);
}

class AllCastFetchFailureState extends AllCastState {
  final String error;

  AllCastFetchFailureState(this.error);
}
