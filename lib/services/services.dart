import 'package:get_it/get_it.dart';
import 'package:reddsource/services/data_service.dart';
import 'package:reddsource/services/reddit_service.dart';

final getIt = GetIt.instance;

Future<void> initServices() async {
  getIt.registerSingleton<DataService>(DataService());
  await getIt.get<DataService>().init();
  getIt.registerSingleton<RedditService>(RedditService());
}
