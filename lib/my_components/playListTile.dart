import 'package:flutter/material.dart';
import 'package:music_app/homepage.dart';
import 'package:music_app/lists.dart';

class PlaylistTile extends StatelessWidget {
  const PlaylistTile({super.key});

  @override
  Widget build(BuildContext context) {
    var artists = musicRepo.recommended;

    return Container(
      height: 400.0, // Set a fixed height for the container
      child: ListView.builder(
        itemCount: artists.length,
        itemBuilder: (context, index) {
          var artist = artists[index];
          return ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.antiAlias,
              child: artist["image"] != null
                  ? Image.asset(
                      musicRepo.recommended[index]['thumbnail'],
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: Colors.grey, // Placeholder if image is null
                    ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz),
            ),
            title: Text(
              artist["title"] ?? 'Unknown Artist',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              artist["author"] ?? 'No details available',
              style: TextStyle(color: Colors.white70),
            ),
          );
        },
      ),
    );
  }
}
