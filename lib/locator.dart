import 'package:get_it/get_it.dart';
import 'package:music_app/lists.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerLazySingleton<MusicRepo>(() => MusicRepo());
}
