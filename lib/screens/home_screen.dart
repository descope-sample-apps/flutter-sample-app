// import 'package:descope/descope.dart';
import 'package:descope/descope.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/screens/welcome_screen.dart';
import 'package:flutter_sample_app/services/util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DescopeUser? user = Descope.sessionManager.session?.user;

  String get userId => user?.userId ?? '...';
  String get name => user?.name ?? '...';
  String get email => user?.email ?? '...';
  String get phone => user?.phone ?? '...';
  Uri? get picture => user?.picture;
  int? get createdAt => user?.createdAt;
  bool get isVerifiedEmail => user?.isVerifiedEmail ?? false;
  bool get isVerifiedPhone => user?.isVerifiedPhone ?? false;
  List<String> get loginIds => user?.loginIds ?? [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hi, $name',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20),
            CupertinoButton(
                color: Theme.of(context).primaryColorDark,
                child: const Text("Log out"),
                onPressed: () {
                  logout().then((value) => {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ))
                      });
                })
          ],
        ),
      ),
    );
  }
}
