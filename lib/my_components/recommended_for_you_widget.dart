import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../Pages/player.dart';
import '../api/model/music_model.dart';
import 'custom_progress_indecator.dart';

class RecommendedForYouWidget extends StatelessWidget {
  const RecommendedForYouWidget({super.key, required this.musicModel});
  final MusicModel musicModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Container(
              width: 230,
              height: 140,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        clipBehavior: Clip.antiAlias,
                        width: 220,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: musicModel.musicThumbnail,
                          height: 140,
                          placeholder: (context, url) =>
                              const CustomProgressIndecator(),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: 100,
                          child: Text(
                            musicModel.musicTitle,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Transform.translate(
                      offset: const Offset(10, 20),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlayerPage(
                                        musicModel: musicModel,
                                      )));
                        },
                        icon: Icon(
                          Icons.play_circle,
                          color: Colors.white.withOpacity(0.6),
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
