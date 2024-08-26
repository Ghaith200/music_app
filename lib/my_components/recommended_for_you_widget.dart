import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_app/api/model/music_model.dart';
import 'package:music_app/my_components/custom_progress_indecator.dart';

class RecommendedForYouWidget extends StatelessWidget {
  RecommendedForYouWidget({super.key, required this.musicModel});
  MusicModel musicModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Container(
          child: Column(
            children: [
              Container(
                width: 230,
                height: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          clipBehavior: Clip.hardEdge,
                          width: 220,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: musicModel.musicThumbnail,
                            placeholder: (context, url) =>
                                const CustomProgressIndecator(),
                          ),
                        ),
                        Center(
                          child: Container(
                            child: Text(
                              musicModel.musicTitle,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
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
                        offset: Offset(10, 20),
                        child: IconButton(
                          onPressed: () {},
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
      ),
    );
  }
}
