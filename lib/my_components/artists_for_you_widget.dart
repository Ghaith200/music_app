import 'package:flutter/material.dart';
import 'package:music_app/api/model/music_model.dart';
import 'package:music_app/my_components/lists.dart';

class ArtistsForYouWidget extends StatelessWidget {
  ArtistsForYouWidget({
    super.key,
    this.index,
  });

  final index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(21))),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {},
              child: Image.asset(
                Lists().artistsForYou[index]["image"],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 5,
          ),
          Container(
            width: 80,
            child: Text(
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              Lists().artistsForYou[index]["title"],
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
