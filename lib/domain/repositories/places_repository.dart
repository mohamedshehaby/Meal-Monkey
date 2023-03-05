import 'package:dartz/dartz.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import '../../app/failure.dart';

abstract class PlacesRepository {
  Future<Either<Failure, List<SearchInfo>>> getSuggestedPlaces(String place);
}
