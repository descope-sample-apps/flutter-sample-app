import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_sample_app/screens/home_screen.dart';
import 'package:flutter_sample_app/screens/welcome_screen.dart';
import 'package:descope/descope.dart';
import 'package:logging/logging.dart';

final Logger _logger = Logger('main');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "lib/.env");

  final String? projectId = dotenv.env['DESCOPE_PROJECT_ID'];

  if (projectId == null || projectId.isEmpty) {
    _logger.severe('ERROR: DESCOPE_PROJECT_ID is not set');
    return;
  } else {
    _logger.info('DESCOPE_PROJECT_ID: $projectId');
  }

  Descope.projectId = projectId;

  await Descope.sessionManager.loadSession();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sample App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: Descope.sessionManager.session?.refreshToken.isExpired == false
          ? const HomeScreen()
          : const WelcomeScreen(),
    );
  }
}
