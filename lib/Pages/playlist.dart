import 'package:flutter/material.dart';
import 'homepage.dart';
import '../my_components/playListTile.dart';
import 'package:palette_generator/palette_generator.dart';
import 'dart:ui';

class Playlist extends StatefulWidget {
  final Map<String, dynamic>? data;
  final bool showBackArrow;

  const Playlist({super.key, this.data, this.showBackArrow = true});

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  Color? _dominantColor;
  bool toggle = false;

  @override
  void initState() {
    super.initState();
    _extractDominantColor();
  }

  Future<void> _extractDominantColor() async {
    final imageProvider = AssetImage(
        widget.data?["image"] ?? 'assets/images/profiles/playlist.jpg');
    final paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    setState(() {
      _dominantColor = paletteGenerator.dominantColor?.color ?? Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data ?? {};

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              data["image"] ?? 'assets/images/profiles/playlist.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                color: _dominantColor?.withOpacity(0.6) ??
                    Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          // Content of the page
          ListView(
            children: [
              Stack(
                children: [
                  Container(
                    height: 350,
                  ),
                  if (widget.showBackArrow) // Conditionally show back arrow
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.white),
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 70, vertical: 20),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 250,
                              height: 250,
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                child: Image.asset(
                                  data["image"] ??
                                      'assets/images/profiles/playlist.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Transform.translate(
                                offset: const Offset(10, 0),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: CircleAvatar(
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.8),
                                    radius: 25,
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white.withOpacity(0.7),
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        data['title'] ?? 'Your Playlist',
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Text(
                      "Top Songs",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: "LexendExa"),
                    ),
                    const Spacer(),
                    MaterialButton(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {},
                      child: IconButton(
                          iconSize: 30,
                          color: Colors.red,
                          icon: toggle
                              ? const Icon(Icons.favorite_border)
                              : const Icon(
                                  Icons.favorite,
                                ),
                          onPressed: () {
                            setState(() {
                              toggle = !toggle;
                            });
                          }),
                    )
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: musicRepo.playlist.length,
                itemBuilder: (context, index) {
                  return PlaylistTile(musicModel: musicRepo.playlist[index]);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
