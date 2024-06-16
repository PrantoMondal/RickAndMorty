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

Set<Character> cList = {};
Future<void> allCastInitialFetchEvent(
    AllCastInitialFetchEvent event, Emitter<AllCastState> emit) async {
  final dio = Dio();
  AllCastModel allCastModel;
  try {
    var response = await dio.post("https://rickandmortyapi.com/graphql", data: {
      'query': '''
      {
        characters(page: ${event.pageNumber}) {
          results{
            id
            name
            image
          }
        }
      }
      '''
    });
    print("_-_-_-_All Cast_-_-_-_-");
    var data = response.data['data'];
    allCastModel = AllCastModel.fromJson(data);
    for (var c in allCastModel.results) {
      cList.add(c);
    }

    print(allCastModel.results.first.name);
    print(cList);

    emit(AllCastFetchSuccessfulState(cList));
  } catch (e) {
    print(e.toString());
  }
}
