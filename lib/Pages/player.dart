import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_app/api/model/music_model.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key, required this.musicModel});
  final MusicModel musicModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          body: Container(
            color: Colors.black,
            child: ListView(
              children: [
                Stack(
                  children: [
                    ClipPath(
                        clipper: MyClipper(),
                        child: SizedBox(
                          height: 500,
                          child: CachedNetworkImage(
                            imageUrl: musicModel.musicThumbnail,
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                        )),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_double_arrow_left_rounded),
                        iconSize: 40,
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.play_circle_outlined),
                        iconSize: 50,
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_double_arrow_right),
                        iconSize: 40,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          )),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h - 50); //point 0 to 1 => down
    path.quadraticBezierTo(w * 0.5, h + 20, w, h - 130); //point 1 to 2 => right
    path.lineTo(w, 0); //point 2 to 3 => up
    path.close(); //point 3 to 0 => left
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
