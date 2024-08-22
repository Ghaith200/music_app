import 'package:flutter/material.dart';
import 'package:music_app/lists.dart';
import 'package:music_app/locator.dart';
import 'package:music_app/my_components/artists_for_you_widget.dart';
import 'package:music_app/my_components/new_releases_widget.dart';
import 'package:music_app/my_components/recommended_for_you_widget.dart';
import 'package:music_app/playlist.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

String? listname;
String? Pick;
MusicRepo musicRepo = getIt.get<MusicRepo>();

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              "Artists For You ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 2,
                  fontFamily: ""),
            ),
          ),
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: musicRepo.recommended.length,
              itemBuilder: (context, index) {
                return ArtistsForYouWidget(
                    musicModel: musicRepo.recommended[index]);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: const Text(
              "New releases",
              style: TextStyle(
                  color: Colors.white, fontSize: 20, letterSpacing: 2),
            ),
          ),
          Container(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: musicRepo.recommended.length,
              itemBuilder: (context, index) {
                return NewReleasesWidget(
                    musicModel: musicRepo.recommended[index]);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              "Recomended \nfor you today ",
              style: TextStyle(
                  color: Colors.white, fontSize: 20, letterSpacing: 3),
            ),
          ),
          Container(
            height: 190,
            padding: EdgeInsets.all(5),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: musicRepo.recommended.length,
              itemBuilder: (context, index) {
                return RecommendedForYouWidget(
                    musicModel: musicRepo.recommended[index]);
              },
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 66, 64, 64),
                    borderRadius: BorderRadius.all(Radius.circular(26))),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  "assets/images/colorfull/collection.jpg",
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              Align(
                child: Text(
                  "Collections",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
