import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String channel;

  const VideoWidget({super.key, required this.channel});

  @override
  VideoWidgetState createState() => VideoWidgetState();
}

class VideoWidgetState extends State<VideoWidget> {
  VideoPlayerController? videoController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    initialChannel();
  }

  void initialChannel() {
    videoController = VideoPlayerController.networkUrl(
      Uri.parse(widget.channel),
    )..initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
    });
    chewieController = ChewieController(
      videoPlayerController: videoController!,
      autoPlay: true,
      looping: true,
      aspectRatio: 19 / 9,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Theme(
            data: ThemeData().copyWith(
              platform: TargetPlatform.iOS,
            ),
            child: Chewie(controller: chewieController!),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoController?.dispose();
    chewieController?.dispose();
  }
}
