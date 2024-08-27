import 'package:flutter/material.dart';
import 'package:music_app/api/model/music_model.dart';
import 'package:music_app/homepage.dart';

class AccountScreen extends StatelessWidget {
  final MusicModel? musicModel;

  const AccountScreen({super.key, this.musicModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/profiles/me.jpg'), // Use your profile image asset here
                    radius: 50,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Hey Ghaith !!',
                style: TextStyle(
                    fontSize: 24, color: Colors.white, fontFamily: 'Nicemoji'),
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Followers: 50',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Following: 36',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                    ),
                    child: const Text('Edit'),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.upload_outlined,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz_rounded))
                ],
              )
            ],
          ),
          const SizedBox(height: 30),
          // Your Playlists Section
          const Text(
            'Your Playlists',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: musicRepo.recommended.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                _buildPlaylistCard(
                   'Unknown Title',
                   'Unknown Artist',
                );
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          // Favorite Playlists Section
          const Text(
            'Favorite Playlists',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: musicRepo.recommended.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: SizedBox(
                    width: 180,
                    child: _buildFavoritePlaylistCard(
                        'Unknown Thumbnail',
                       'Unknown Title'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaylistCard(String imagePath, String title) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritePlaylistCard(String imagePath, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            height: 110,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
