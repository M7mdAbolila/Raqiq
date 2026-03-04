import 'package:flutter/material.dart';
import 'app/app.dart';
import 'core/routing/app_router.dart';

import 'core/di/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(RaqiqApp(appRouter: AppRouter()));
}
