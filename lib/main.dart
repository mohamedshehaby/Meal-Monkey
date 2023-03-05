import 'package:flutter/material.dart';
import 'package:meal_monkey/app/di.dart' as di;
import 'package:meal_monkey/presentation/screens/app.dart';

void main() async {
  // Ensure that Flutter engine already started and binding is ok
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const MyApp());
}
