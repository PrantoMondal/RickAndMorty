part of 'all_cast_bloc.dart';

@immutable
abstract class AllCastState {}

class AllCastInitial extends AllCastState {}

abstract class AllCastActionState extends AllCastState {}

class AllCastFetchSuccessfulState extends AllCastState {
  final AllCastModel allCastModel;

  AllCastFetchSuccessfulState(this.allCastModel);
}
