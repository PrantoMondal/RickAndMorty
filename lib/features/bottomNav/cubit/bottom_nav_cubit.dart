import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavHome());

  void updateIndex(int index) {
    switch (index) {
      case 0:
        emit(BottomNavHome());
        break;
      case 1:
        emit(BottomNavCast());
        break;
    }
  }
}
