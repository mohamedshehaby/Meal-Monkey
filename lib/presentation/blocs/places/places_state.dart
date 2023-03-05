part of 'places_bloc.dart';

abstract class PlacesState extends Equatable {
  const PlacesState();

  @override
  List<Object> get props => [];
}

class PlacesInitial extends PlacesState {}

class PlacesLoading extends PlacesState {}

class PlacesLoaded extends PlacesState {
  final List<SearchInfo> places;
  const PlacesLoaded({
    required this.places,
  });
  @override
  List<Object> get props => [places];
}

class PlacesFailure extends PlacesState {
  final Failure failure;

  const PlacesFailure({
    required this.failure,
  });

  @override
  List<Object> get props => [];
}
