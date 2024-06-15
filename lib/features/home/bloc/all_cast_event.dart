part of 'all_cast_bloc.dart';

@immutable
abstract class AllCastEvent {}

class AllCastInitialFetchEvent extends AllCastEvent {
  final int pageNumber;

  AllCastInitialFetchEvent(this.pageNumber);
}
