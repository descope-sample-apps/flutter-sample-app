import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/screens/home_screen.dart';
import 'package:flutter_sample_app/services/util.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final AuthService authService = AuthService();

  bool isLoading = false;

  Future<void> _startFlow() async {
    setState(() {
      isLoading = true;
    });
    final bool flowSucceeded = await authService.startFlow();

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    if (!flowSucceeded) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

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
              onPressed: isLoading ? null : _startFlow,
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text("Get started"),
            )
          ],
        ),
      ),
    );
  }
}
