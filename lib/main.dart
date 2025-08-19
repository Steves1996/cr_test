import 'dart:async';

import 'package:cr/src/core/cr.dart';
import 'package:cr/src/core/app_initializer.dart';
import 'package:cr/src/core/service/app_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  final AppInitializer appInitializer = AppInitializer();

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: ".env");
    Bloc.observer = AppBlocObserver();

    await appInitializer.preAppRun();
    appInitializer.postAppRun();

    runApp(const Cr());
  }, (error, stack) {});
}
