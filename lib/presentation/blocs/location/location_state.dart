part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationFailure extends LocationState {
  final Failure failure;

  const LocationFailure({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

class LocationLoaded extends LocationState {
  final GeoPoint point;

  const LocationLoaded({
    required this.point,
  });

  @override
  List<Object> get props => [point];
}
