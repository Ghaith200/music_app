import 'package:flutter/material.dart';
import 'package:music_app/api/model/music_model.dart';
class ArtistsForYouWidget extends StatelessWidget {
   ArtistsForYouWidget({super.key, required this.musicModel});
    MusicModel musicModel;

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
                            borderRadius:
                                BorderRadius.all(Radius.circular(21))),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {},
                          child: Image.network(
                            musicModel.musicThumbnail,
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
                          overflow: TextOverflow.ellipsis,
                          musicModel.musicTitle,
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