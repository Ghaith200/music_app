import 'package:flutter/material.dart';
import 'package:music_app/Pages/player.dart';
import 'package:music_app/api/model/music_model.dart';
import 'package:music_app/my_components/custom_progress_indecator.dart';

import 'package:cached_network_image/cached_network_image.dart';

class ArtistsForYouWidget extends StatelessWidget {
  const ArtistsForYouWidget({
    super.key,
    required this.musicModel,
  });

  final MusicModel musicModel;
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
              child: CachedNetworkImage(
                imageUrl: musicModel.musicThumbnail,
                fit: BoxFit.cover,
                placeholder: (context, url) => const CustomProgressIndecator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
              musicModel.musicTitle,
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
