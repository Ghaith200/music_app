import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_app/api/model/music_model.dart';
import 'package:music_app/my_components/customProgressBar.dart';
import 'package:music_app/my_components/custom_progress_indecator.dart';
import 'package:music_app/my_components/lyrics.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key, required this.musicModel});
  final MusicModel musicModel;

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  double height = 0;
  late DraggableScrollableController draggableScrollableController;
  @override
  void initState() {
    super.initState();
    draggableScrollableController = DraggableScrollableController();
    draggableScrollableController.addListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          color: Colors.black,
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      ClipPath(
                          clipper: MyClipper(),
                          child: SizedBox(
                            height: 500,
                            child: CachedNetworkImage(
                              imageUrl: widget.musicModel.musicThumbnail,
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
                  ListTile(
                    title: Text(
                      widget.musicModel.musicTitle,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      widget.musicModel.musicAuthor,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.red,
                        )),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: AudioProgressBar(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 66, 64, 64),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: (height * MediaQuery.of(context).size.height),
                    ),
                  ),
                ],
              ),
              Container(
                child: DraggableScrollableSheet(
                    controller: draggableScrollableController,
                    builder: (context, controller) {
                      return Container(
                          decoration: BoxDecoration(
                            color: Colors
                                .transparent, //Color.fromARGB(255, 66, 64, 64),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: ListView(
                              controller: controller, children: [Lyrics()]));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  void listener() {
    setState(() {
      height = draggableScrollableController.size;
    });
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
