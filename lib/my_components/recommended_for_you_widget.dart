import 'package:flutter/material.dart';
import 'package:music_app/api/model/music_model.dart';

class RecommendedForYouWidget extends StatelessWidget {
   RecommendedForYouWidget({super.key ,required this.musicModel});
  MusicModel musicModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
                  onTap: () {
                    
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            width: 230,
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Stack(
                              children: [
                                Container(
                                  width: 220,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.network(
                                    musicModel.musicThumbnail,
                                    fit: BoxFit.cover,
                                    height: 120,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 150,
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
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Transform.translate(
                                    offset: Offset(10, 0),
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