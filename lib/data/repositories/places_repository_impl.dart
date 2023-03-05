import 'package:dartz/dartz.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import '../../app/failure.dart';
import '../../domain/repositories/places_repository.dart';

class PlacesRepositoryImpl implements PlacesRepository {
  @override
  Future<Either<Failure, List<SearchInfo>>> getSuggestedPlaces(String place) async {
    try {
      return Right(await addressSuggestion(place, limitInformation: 10));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
