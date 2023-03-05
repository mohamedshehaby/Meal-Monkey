import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:meal_monkey/app/failure.dart';
import 'package:meal_monkey/domain/repositories/location_repository.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository locationRepository;

  LocationBloc({required this.locationRepository}) : super(LocationInitial()) {
    on<LocationGetLocation>(_onGetLocation);
    on<LocationUpdateLocation>(_onUpdateLocation);
  }

  _onGetLocation(LocationGetLocation event, Emitter<LocationState> emit) async {
    emit(LocationLoading());
    (await locationRepository.getCurrentLocation()).fold(
      (failure) => emit(
        LocationFailure(failure: failure),
      ),
      (position) => emit(
        LocationLoaded(point: GeoPoint(latitude: position.latitude, longitude: position.longitude)),
      ),
    );
  }

  _onUpdateLocation(LocationUpdateLocation event, Emitter<LocationState> emit) async {
    emit(LocationLoading());
    emit(LocationLoaded(point: event.point));
  }
}
