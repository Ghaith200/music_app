// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_app/api/model/music_model.dart';

class FavouritePlaylistCard extends StatelessWidget {
  const FavouritePlaylistCard({super.key, required this.musicModel});
  final MusicModel musicModel;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 160,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: CachedNetworkImage(
                  imageUrl: musicModel.musicThumbnail,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: Text(
                musicModel.musicTitle,
                style: const TextStyle(fontSize: 14, color: Colors.white),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ));
  }
}
