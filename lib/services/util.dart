import 'package:descope/descope.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logging/logging.dart';

final Logger _logger = Logger('auth_service');

Future<bool> startFlow() async {
  final String projectId = dotenv.env['DESCOPE_PROJECT_ID']!;

  String? flowUrl = dotenv.env['DESCOPE_FLOW_URL'];
  if (flowUrl == null || flowUrl.isEmpty) {
    flowUrl = 'https://auth.descope.io/$projectId';
  }
  final deepLinkUrl = dotenv.env['DESCOPE_DEEP_LINK_URL'];

  try {
    final options = DescopeFlowOptions(
        mobile: DescopeMobileFlowOptions(
            flowUrl: flowUrl, deepLinkUrl: deepLinkUrl),
        web: DescopeWebFlowOptions(
          flowId: 'sign-up-or-in',
          flowContainerCss: {
            "background-color": "antiquewhite",
            "width": "500px",
            "min-height": "300px",
            "margin": "auto",
            "position": "relative",
            "top": "50%",
            "transform": "translateY(-50%)",
            "display": "flex",
            "flex-direction": "column",
            "align-items": "center",
            "justify-content": "center",
            "box-shadow": "0px 0px 10px gray",
          },
        ));
    final authResponse = await Descope.flow.start(options);
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
