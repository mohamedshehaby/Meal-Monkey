part of 'places_bloc.dart';

abstract class PlacesEvent extends Equatable {
  @override
  List<Object> get props => [];

  const PlacesEvent();
}

class PlacesLoadEvent extends PlacesEvent {
  final String place;

  const PlacesLoadEvent({
    required this.place,
  });

  @override
  List<Object> get props => [place];
}
