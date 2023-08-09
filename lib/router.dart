import 'package:descope/descope.dart';
import 'package:flutter_sample_app/screens/home_screen.dart';
import 'package:flutter_sample_app/screens/welcome_screen.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) =>
          Descope.sessionManager.session?.refreshToken.isExpired == false
              ? const HomeScreen()
              : const WelcomeScreen(), // Your main app
      routes: [
        GoRoute(
          path:
              'auth', // This path needs to correspond to the deep link you configured in your manifest - see below
          redirect: (context, state) async {
            try {
              Descope.flow
                  .exchange(state.uri); // Call exchange to complete the flow
            } catch (e) {
              // Handle errors here
            }
            return '/'; // This route doesn't display anything but returns the root path where the user will be signed in
          },
        ),
      ],
    ),
  ],
);
