import 'package:flutter/material.dart';
import 'package:music_app/api/model/music_model.dart';
import 'package:music_app/homepage.dart';
import 'package:music_app/lists.dart';

class PlaylistTile extends StatelessWidget {
  const PlaylistTile({super.key});

  @override
  Widget build(BuildContext context) {
    MusicModel? musicModel;

    return Container(
      height: 400.0, // Set a fixed height for the container
      child: ListView.builder(
        itemCount: musicRepo.home.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                    musicModel!.musicThumbnail,
                    fit: BoxFit.cover,
                  ) ??
                  Container(
                    color: Colors.grey,
                  ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz),
            ),
            title: Text(
              musicModel.musicTitle ?? 'Unknown Artist',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              musicModel.musicAuthor ?? 'No details available',
              style: TextStyle(color: Colors.white70),
            ),
          );
        },
      ),
    );
  }
}
