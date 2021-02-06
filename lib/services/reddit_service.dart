import 'package:draw/draw.dart';
import 'package:reddsource/constants/functional.dart';
import 'package:reddsource/services/data_service.dart';
import 'package:reddsource/services/services.dart';

class RedditService {

  Reddit _reddit;
  String _authUrl, state;
  bool ready;
  Redditor me;

  RedditService() {
    DataService dataService = getIt.get<DataService>();
    state = dataService.randomString(8);
    if(dataService.prefs.containsKey('redditCredentials')) {
      _reddit = Reddit.restoreInstalledAuthenticatedInstance(
        dataService.prefs.getString('redditCredentials'),
        clientId: clientId,
        userAgent: userAgent,
      );
      ready = true;
      () async {
        me = await _reddit.user.me();
      }();
    } else {
      _reddit = Reddit.createInstalledFlowInstance(
        clientId: clientId,
        userAgent: userAgent,
        redirectUri: Uri.parse(redirectUrl)
      );
      ready = false;
      _authUrl = _reddit.auth.url(['*'], state).toString();
    }
  }

  String generateAuthUrl() => _authUrl;

  Future<bool> authorize(String code) async {
    await _reddit.auth.authorize(code);
    if(_reddit.auth.isValid) {
      getIt.get<DataService>().prefs.setString('redditCredentials', _reddit.auth.credentials.toJson());
      ready = true;
      return true;
    }
    return false;
  }

  bool isAuthorized() {
    return false;
  }

  SubredditRef getSubredditRef(String name) {
    return _reddit.subreddit(name);
  }

  Stream<UserContent> getFrontPageStream() {
    return _reddit.front.best();
  }

}
