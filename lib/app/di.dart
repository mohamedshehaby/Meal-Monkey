import 'package:get_it/get_it.dart';
import 'package:meal_monkey/data/repositories/location_repository_impl.dart';
import 'package:meal_monkey/data/repositories/places_repository_impl.dart';
import 'package:meal_monkey/domain/repositories/location_repository.dart';
import 'package:meal_monkey/presentation/blocs/location/location_bloc.dart';

import '../domain/repositories/places_repository.dart';
import '../presentation/blocs/places/places_bloc.dart';

final instance = GetIt.I;

Future<void> init() async {
  /// [Repositories]
  /// LocationRepository
  instance.registerLazySingleton<LocationRepository>(() => LocationRepositoryImpl());

  /// PlacesRepository
  instance.registerLazySingleton<PlacesRepository>(() => PlacesRepositoryImpl());

  /// [Blocs]
  /// LocationBloc
  instance.registerLazySingleton<LocationBloc>(() => LocationBloc(locationRepository: instance()));

  /// PlacesBloc
  instance.registerLazySingleton<PlacesBloc>(() => PlacesBloc(placesRepository: instance()));
}
