import 'package:descope/descope.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logging/logging.dart';

final Logger _logger = Logger('auth_service');

Future<bool> startFlow() async {
  final flowUrl = dotenv.env['DESCOPE_FLOW_URL'];
  if (flowUrl == null || flowUrl.isEmpty) {
    _logger.severe('ERROR: DESCOPE_FLOW_URL is not set');
    return false;
  }
  final deepLinkUrl = dotenv.env['DESCOPE_DEEP_LINK_URL'];

  try {
    final authResponse =
        await Descope.flow.start(flowUrl, deepLinkUrl: deepLinkUrl);
    final session = DescopeSession.fromAuthenticationResponse(authResponse);
    Descope.sessionManager.manageSession(session);
    return true;
  } catch (e) {
    _logger.severe('ERROR: $e');
    return false;
  }
}

Future<void> logout() async {
  final refreshJwt = Descope.sessionManager.session?.refreshJwt;
  if (refreshJwt != null) {
    await Descope.auth.logout(refreshJwt);
    Descope.sessionManager.clearSession();
  }
}
