import 'package:draw/draw.dart';
import 'package:reddsource/constants/functional.dart';
import 'package:reddsource/services/data_service.dart';
import 'package:reddsource/services/services.dart';

class RedditService {

  Reddit _reddit;
  String _authUrl, state;
  bool ready;
  Future<Redditor> me;
  List<Subreddit> _subscribedSubreddits = [];

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
      _afterAuth();
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

  void _afterAuth() {
    me = _reddit.user.me();
    _refreshSubscribedSubreddits();
    if(_reddit.auth.isValid) {
      getIt.get<DataService>().prefs.setString('redditCredentials', _reddit.auth.credentials.toJson());
      ready = true;
    }
  }

  void _refreshSubscribedSubreddits() {
    _subscribedSubreddits = [];
    _reddit.user.subreddits().listen((Subreddit subreddit) {
      _subscribedSubreddits.add(subreddit);
    }).onDone(() {
      _subscribedSubreddits.sort((Subreddit a, Subreddit b) {
        return a.displayName.compareTo(b.displayName);
      });
    });
  }

  String generateAuthUrl() => _authUrl;

  Future<bool> authorize(String code) async {
    await _reddit.auth.authorize(code);
    _afterAuth();
    return _reddit.auth.isValid;
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

  List<Subreddit> getSubscribedSubreddits() => _subscribedSubreddits;

}
