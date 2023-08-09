import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:descope/descope.dart';
import 'package:logging/logging.dart';
import 'router.dart';

final Logger _logger = Logger('main');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "lib/.env");

  final String? projectId = dotenv.env['DESCOPE_PROJECT_ID'];

  if (projectId == null || projectId.isEmpty) {
    _logger.severe('ERROR: DESCOPE_PROJECT_ID is not set');
    return;
  }

  Descope.projectId = projectId;

  await Descope.sessionManager.loadSession();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'Descope Flutter Sample App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
    );
  }
}
