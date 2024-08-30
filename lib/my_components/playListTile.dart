// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_app/api/model/music_model.dart';
import 'package:music_app/my_components/custom_progress_indecator.dart';

class PlaylistTile extends StatelessWidget {
  const PlaylistTile({super.key, required this.musicModel});

  final MusicModel musicModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        clipBehavior: Clip.antiAlias,
        child: CachedNetworkImage(
          imageUrl: musicModel.musicThumbnail,
          fit: BoxFit.cover,
          placeholder: (context, url) => const CustomProgressIndecator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.more_horiz),
      ),
      title: Text(
        musicModel.musicTitle,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        musicModel.musicAuthor,
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }
}
