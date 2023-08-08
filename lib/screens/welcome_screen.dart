// import 'package:descope/descope.dart';
import 'package:descope/descope.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/screens/home_screen.dart';

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
                Descope.flow
                    .start(
                  'https://descope-flutter.vercel.app/login',
                  // deepLinkUrl: '<URL_FOR_APP_LINK_IN_SETUP_#2>'
                )
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
                  print(e);
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
