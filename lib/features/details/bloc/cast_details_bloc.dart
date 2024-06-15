import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/features/details/model/cast_details_model.dart';

part 'cast_details_event.dart';
part 'cast_details_state.dart';

class CastDetailsBloc extends Bloc<CastDetailsEvent, CastDetailsState> {
  CastDetailsBloc() : super(CastDetailsInitial()) {
    // on<CastDetailsEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<CastDetailsInitialFetchEvent>(castDetailsInitialFetchEvent);
  }
}

Future<void> castDetailsInitialFetchEvent(
    CastDetailsInitialFetchEvent event, Emitter<CastDetailsState> emit) async {
  final dio = Dio();
  CastDetailsModel castDetailsModel;
  try {
    var response = await dio.post("https://rickandmortyapi.com/graphql", data: {
      'query': '''
            {
        character(id: ${event.id}) {
          name
          status
          species
          gender
          origin {
            name
          }
          location {
            name
          }
          image
          episode {
            name
          }
        }
      }

      '''
    });
    print("_-_-_-_-Cast Details-_-_-_-");
    var data = response.data['data']['character'];
    castDetailsModel = CastDetailsModel.fromJson(data);

    print(castDetailsModel.location);

    emit(CastDetailsFetchSuccessfulState(castDetailsModel));
  } catch (e) {
    print(e.toString());
  }
}
