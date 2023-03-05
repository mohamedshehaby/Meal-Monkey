import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/di.dart';
import '../blocs/location/location_bloc.dart';
import '../blocs/places/places_bloc.dart';
import '../resources/routes_manager.dart';
import '../resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => instance<LocationBloc>()..add(LocationGetLocation()),
        ),
        BlocProvider(
          create: (_) => instance<PlacesBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RoutesManager.splashRoute,
            onGenerateRoute: RoutesManager.generateRoute,
            theme: getAppTheme(),
          );
        },
      ),
    );
  }
}
