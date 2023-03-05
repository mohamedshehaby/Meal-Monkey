import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:meal_monkey/app/failure.dart';

import '../../../domain/repositories/places_repository.dart';

part 'places_event.dart';
part 'places_state.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  PlacesRepository placesRepository;

  PlacesBloc({required this.placesRepository}) : super(PlacesInitial()) {
    on<PlacesLoadEvent>(_onLoadPlaces);
  }

  _onLoadPlaces(PlacesLoadEvent event, Emitter<PlacesState> emit) async {
    emit(PlacesLoading());
    (await placesRepository.getSuggestedPlaces(event.place))
        .fold((failure) => emit(PlacesFailure(failure: failure)), (places) {
      emit(
        PlacesLoaded(places: places),
      );
    });
  }
}
