import 'package:draw/draw.dart';
import 'package:reddsource/constants/functional.dart';
import 'package:reddsource/services/data_service.dart';
import 'package:reddsource/services/services.dart';

class RedditService {

  Reddit _reddit;
  String _authUrl, state;

  RedditService() {
    state = getIt.get<DataService>().randomString(8);
    _reddit = Reddit.createInstalledFlowInstance(
      clientId: 'R5BXxeTyANfbfg',
      userAgent: 'reddsource-client',
      redirectUri: Uri.parse(redirectUrl)
    );
    _authUrl = _reddit.auth.url(['*'], state).toString();
  }

  String generateAuthUrl() => _authUrl;

  Future<bool> authorize(String code) async {
    await _reddit.auth.authorize(code);
    return _reddit.auth.isValid;
  } 

}
