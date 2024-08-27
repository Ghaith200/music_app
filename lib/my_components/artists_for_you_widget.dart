
import 'package:flutter/material.dart';
import 'package:music_app/Pages/player.dart';
import 'package:music_app/my_components/lists.dart';

class ArtistsForYouWidget extends StatelessWidget {
  const ArtistsForYouWidget({
    super.key,
    required this.index,
  });

  final index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(21))),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PlayerPage()));
              },
              child: Image.asset(
                Lists().artistsForYou[index]["image"],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 5,
          ),
          SizedBox(
            width: 80,
            child: Text(
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              Lists().artistsForYou[index]["title"],
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
