// import 'package:descope/descope.dart';
import 'package:descope/descope.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_sample_app/screens/home_screen.dart';
import 'package:logging/logging.dart';

final Logger _logger = Logger('welcome_screen');

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome to Descope's Flutter Sample App!",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                final flowUrl = dotenv.env['DESCOPE_FLOW_URL'];
                if (flowUrl == null || flowUrl.isEmpty) {
                  _logger.severe('ERROR: DESCOPE_FLOW_URL is not set');
                  return;
                }
                final deepLinkUrl = dotenv.env['DESCOPE_DEEP_LINK_URL'];

                Descope.flow
                    .start(flowUrl, deepLinkUrl: deepLinkUrl)
                    .then((authResponse) {
                  final session =
                      DescopeSession.fromAuthenticationResponse(authResponse);
                  Descope.sessionManager.manageSession(session);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                }).catchError((e) {
                  _logger.severe('ERROR: $e');
                });
              },
              child: const Text("Get started"),
            )
          ],
        ),
      ),
    );
  }
}
