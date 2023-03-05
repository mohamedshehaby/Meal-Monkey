part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class LocationGetLocation extends LocationEvent {}

class LocationUpdateLocation extends LocationEvent {
  final GeoPoint point;

  const LocationUpdateLocation({
    required this.point,
  });

  @override
  List<Object> get props => [point];
}
