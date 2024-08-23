import 'package:music_app/api/model/music_model.dart';

class Lists {
  List artistsForYou = [
    {"image": "assets/images/profiles/faouzia.jpg", "title": "Faouzia "},
    {"image": "assets/images/profiles/anne marie.jpg", "title": "Anne Marie "},
    {"image": "assets/images/profiles/new jeans.jpg", "title": "New Jeans"},
    {"image": "assets/images/profiles/kiara.png", "title": "Kiiara"},
    {
      "image": "assets/images/profiles/Billie Eilish.jpg",
      "title": "Billie Eilish"
    },
    {"image": "assets/images/profiles/eminem.jpg", "title": "Eminem"},
    {
      "image": "assets/images/profiles/ariana  grande.jpg",
      "title": "Ariana Grande"
    },
    {"image": "assets/images/profiles/Dua Lipa.jpg", "title": "Dua Lipa"},
    {"image": "assets/images/profiles/Adelle.jpg", "title": "Adelle"},
    {"image": "assets/images/profiles/gyle.jpg", "title": "gyle"},
    {"image": "assets/images/profiles/ketty perry.jpg", "title": "kety perry"},
  ];

  List newReleases = [
    {
      "image": "assets/images/new_release/Rip love faouzia.jpg",
      "title": "R.I.P Love",
      "author": "Faouzia "
    },
    {
      "image": "assets/images/new_release/friends anne marie.jpg",
      "title": "Friends",
      "author": "Anne Marie "
    },
    {
      "image": "assets/images/new_release/NewJeans league.jpg",
      "title": "League of Legends",
      "author": "New Jeans "
    },
  ];
}

class MusicRepo {
  List<MusicModel> recommended = [];
}
