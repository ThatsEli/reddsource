import 'package:get_it/get_it.dart';
import 'package:reddsource/services/data_service.dart';
import 'package:reddsource/services/reddit_service.dart';

final getIt = GetIt.instance;

void initServices() {
  getIt.registerSingleton<DataService>(DataService());
  getIt.registerSingleton<RedditService>(RedditService());
}
