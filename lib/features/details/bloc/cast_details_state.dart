part of 'cast_details_bloc.dart';

@immutable
abstract class CastDetailsState {}

class CastDetailsInitial extends CastDetailsState {}

abstract class CastDetailsActionState extends CastDetailsState {}

class CastDetailsFetchSuccessfulState extends CastDetailsState {
  final CastDetailsModel castDetailsModel;

  CastDetailsFetchSuccessfulState(this.castDetailsModel);
}
