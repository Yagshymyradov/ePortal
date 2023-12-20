import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../utils/assets.dart';
import '../../utils/navigation.dart';

final List channels = [
  ['https://horjuntv.com.tm/chanel2/ch007.m3u8', AppIcons.tmSport.jpegPicture, 'Turkmenistan Sport'],
  ['https://horjuntv.com.tm/chanel2/ch052.m3u8', AppIcons.football1.jpegPicture, 'Football1'],
  ['https://horjuntv.com.tm/chanel2/ch093.m3u8', AppIcons.football.jpegPicture, 'Football'],
  ['https://horjuntv.com.tm/chanel/ch040.m3u8', AppIcons.varzishtv.jpegPicture, 'Varzish Tv'],
];

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 60),
        children: channels
            .map(
              (e) => ListTile(
                onTap: () => navigateToScreen(context, VideoWidget(channel: e[0] as String)),
                title: Text(e[2] as String),
                trailing: Padding(padding: const EdgeInsets.all(3),
                child: ClipRRect(borderRadius: BorderRadius.circular(5),child: e[1] as Widget)),
              ),
            )
            .toList(growable: false),
      ),
    );
  }
}

class VideoWidget extends StatefulWidget {
  final String channel;

  const VideoWidget({super.key, required this.channel});

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoPlayerController? _controller;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.channel[0]),
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    chewieController = ChewieController(
      videoPlayerController: _controller!,
      autoPlay: true,
      looping: true,
      aspectRatio: 19/9,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Chewie(controller: chewieController!)),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
    chewieController?.dispose();
  }
}
