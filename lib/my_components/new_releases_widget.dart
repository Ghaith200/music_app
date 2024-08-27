import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_app/api/model/music_model.dart';
import 'package:music_app/my_components/custom_progress_indecator.dart';

// ignore: must_be_immutable
class NewReleasesWidget extends StatelessWidget {
  NewReleasesWidget({super.key, required this.musicModel});
  MusicModel musicModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Container(
              width: 300,
              height: 150,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 66, 64, 64),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              margin: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: CachedNetworkImage(
                                imageUrl: musicModel.musicThumbnail,
                                placeholder: (context, url) =>
                                    const CustomProgressIndecator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    musicModel.musicTitle,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    musicModel.musicAuthor,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 40,
                          left: 0,
                          right: 0,
                          child: Align(
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_circle,
                                color: Colors.white.withOpacity(0.5),
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      ],
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
