import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(
            Uri.parse('https://www.youtube.com/watch?v=X1gOXZNry34')));
  }

  @override
  void dispose() {
    super.dispose();
    flickManager.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlickVideoPlayer(flickManager: flickManager);
  }
}
