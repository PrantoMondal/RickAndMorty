import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/features/home/model/all_cast_model.dart';

part 'all_cast_event.dart';
part 'all_cast_state.dart';

class AllCastBloc extends Bloc<AllCastEvent, AllCastState> {
  AllCastBloc() : super(AllCastInitial()) {
    on<AllCastInitialFetchEvent>(allCastInitialFetchEvent);
  }
}

FutureOr<void> allCastInitialFetchEvent(
    AllCastInitialFetchEvent event, Emitter<AllCastState> emit) async {
  final dio = Dio();
  AllCastModel allCastModel;
  try {
    var response = await dio.post("https://rickandmortyapi.com/graphql", data: {
      'query': '''
      {
        characters(page: 1) {
          results{
            id
            name
            image
          }
        }
      }
      '''
    });
    print("_-_-_-_-_-_-_-_-_-_-_-");
    var data = response.data['data'];
    allCastModel = AllCastModel.fromJson(data);

    print(allCastModel.results.first.name);

    emit(AllCastFetchSuccessfulState(allCastModel));
  } catch (e) {
    print(e.toString());
  }
}
