import 'package:music_app/api/model/music_model.dart';

class Lists {
  // List artistsForYou = [
  //   {"image": "assets/images/profiles/faouzia.jpg", "title": "Faouzia "},
  //   {"image": "assets/images/profiles/anne marie.jpg", "title": "Anne Marie "},
  //   {"image": "assets/images/profiles/new jeans.jpg", "title": "New Jeans"},
  //   {"image": "assets/images/profiles/kiara.png", "title": "Kiiara"},
  //   {
  //     "image": "assets/images/profiles/Billie Eilish.jpg",
  //     "title": "Billie Eilish"
  //   },
  //   {"image": "assets/images/profiles/eminem.jpg", "title": "Eminem"},
  //   {
  //     "image": "assets/images/profiles/ariana  grande.jpg",
  //     "title": "Ariana Grande"
  //   },
  //   {"image": "assets/images/profiles/Dua Lipa.jpg", "title": "Dua Lipa"},
  //   {"image": "assets/images/profiles/Adelle.jpg", "title": "Adelle"},
  //   {"image": "assets/images/profiles/gyle.jpg", "title": "gyle"},
  //   {"image": "assets/images/profiles/ketty perry.jpg", "title": "kety perry"},
  // ];
}

class MusicRepo {
  List<MusicModel> recommended = [];
  List<MusicModel> home = [];
  List<MusicModel> playlist = [];
  List<MusicModel> artists = [];
  List<MusicModel> todaysBiggestHits = [];
}
