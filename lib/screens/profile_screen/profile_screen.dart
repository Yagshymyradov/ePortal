import 'package:flutter/material.dart';
import '../../components/video_widget.dart';
import '../../utils/assets.dart';
import '../../utils/navigation.dart';

enum Channels {
  tmSport,
  football1,
  football,
  varzishtv;

  String get asValue {
    switch (this) {
      case Channels.tmSport:
        return 'Turkmenistan Sport';
      case Channels.football1:
        return 'Football1';
      case Channels.football:
        return 'Football';
      case Channels.varzishtv:
        return 'VarzishTv';
    }
  }

  String get asChannels {
    switch (this) {
      case Channels.tmSport:
        return 'https://horjuntv.com.tm/chanel2/ch007.m3u8';
      case Channels.football1:
        return 'https://horjuntv.com.tm/chanel2/ch052.m3u8';
      case Channels.football:
        return 'https://horjuntv.com.tm/chanel2/ch093.m3u8';
      case Channels.varzishtv:
        return 'https://horjuntv.com.tm/chanel/ch040.m3u8';
    }
  }

  Widget get asPhotos {
    switch (this) {
      case Channels.tmSport:
        return AppIcons.tmSport.jpegPicture;
      case Channels.football1:
        return AppIcons.football1.jpegPicture;
      case Channels.football:
        return AppIcons.football.jpegPicture;
      case Channels.varzishtv:
        return AppIcons.varzishtv.jpegPicture;
    }
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Каналы'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 60),
        children: Channels.values
            .map(
              (e) => ListTile(
                onTap: () => navigateToScreen(context, VideoWidget(channel: e.asChannels)),
                title: Text(e.asValue),
                trailing: Padding(
                  padding: const EdgeInsets.all(3),
                  child: ClipRRect(borderRadius: BorderRadius.circular(5), child: e.asPhotos),
                ),
              ),
            )
            .toList(growable: false),
      ),
    );
  }
}
