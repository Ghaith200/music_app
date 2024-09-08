import 'package:get_it/get_it.dart';
import '../my_components/lists.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerLazySingleton<MusicRepo>(() => MusicRepo());
}
