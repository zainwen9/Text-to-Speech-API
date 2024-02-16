import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class VieoPlayerWidget extends StatefulWidget {
  final String url;

  const VieoPlayerWidget({
    super.key,
    required this.url,
  });

  @override
  _VieoPlayerWidgetState createState() => _VieoPlayerWidgetState();
}

class _VieoPlayerWidgetState extends State<VieoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      widget.url,
    );
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio:
          9 / 12, // Adjust the aspect ratio as per your video dimensions
      autoInitialize: true,
      autoPlay: true, // Auto play the video
      looping: false,
      showControls: false, // Loop the video
      allowedScreenSleep: false, // Prevent screen sleep while playing
      fullScreenByDefault: false, // Start in full screen mode
      // Other ChewieController configurations can be added here
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
