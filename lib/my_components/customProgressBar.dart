// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AudioProgressBar extends StatefulWidget {
  final double height;
  final double ballSize;

  const AudioProgressBar({super.key, 
    this.height = 7.0, // Height of the progress bar
    this.ballSize = 12.0, // Size of the draggable ball (thumb)
  });

  @override
  // ignore: library_private_types_in_public_api
  _AudioProgressBarState createState() => _AudioProgressBarState();
}

class _AudioProgressBarState extends State<AudioProgressBar> {
  double progress = 0.3; // Initial progress (0%)

  // Update the progress value based on the position of the drag
  void _updateProgress(Offset localPosition, double maxWidth) {
    setState(() {
      progress = (localPosition.dx / maxWidth)
          .clamp(0.0, 1.0); // Clamp between 0 and 1
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;

        return GestureDetector(
          onPanUpdate: (details) {
            _updateProgress(details.localPosition, maxWidth);
          },
          child: Stack(
            alignment: Alignment.centerLeft,
            clipBehavior: Clip.none,
            children: [
              // Background bar
              Container(
                height: widget.height,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(widget.height / 2),
                ),
              ),
              // Progress bar
              Container(
                height: widget.height,
                width: maxWidth * progress,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(widget.height / 2),
                ),
              ),
              // Draggable ball (thumb)
              Positioned(
                left: (maxWidth - widget.ballSize) * progress,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    _updateProgress(details.localPosition, maxWidth);
                  },
                  child: Container(
                    width: widget.ballSize,
                    height: widget.ballSize,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
