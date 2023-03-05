import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meal_monkey/app/failure.dart';

abstract class LocationRepository {
  Future<Either<Failure, Position>> getCurrentLocation();
}
