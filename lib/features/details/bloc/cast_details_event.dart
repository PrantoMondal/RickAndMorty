part of 'cast_details_bloc.dart';

@immutable
abstract class CastDetailsEvent {}

class CastDetailsInitialFetchEvent extends CastDetailsEvent {
  final String id;

  CastDetailsInitialFetchEvent(this.id);
}
