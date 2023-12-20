import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppIcons{
  tv('tv'),
  tmSport('tmSport'),
  football1('football1'),
  football('football'),
  varzishtv('varzishtv'),
  eye('eye'),
  bookmark('bookmark'),
  home('home'),
  globe('globe'),
  settings('settings');

  final String path;

  const AppIcons(this.path);

  String get _svg => 'assets/icons/$path.svg';

  String get _png => 'assets/icons/$path.png';

  String get _jpg => 'assets/icons/$path.jpg';

  String get _jpeg => 'assets/icons/$path.jpeg';

  Widget svgPicture({
    double? height,
    double? width,
    Color? color,
  }) =>
      SvgPicture.asset(
        _svg,
        height: height,
        width: width,
        color: color,
      );
  Widget get pngPicture => Image.asset(_png);

  Widget get jpgPicture => Image.asset(_jpg);

  Widget get jpegPicture => Image.asset(_jpeg);
}
