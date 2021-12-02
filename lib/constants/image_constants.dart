class ImageConstants {
  static ImageConstants? _instace;
  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  /// Png image
  String get matthew => toPng('matthew');
  String get elliot => toPng('elliot-small');

  String toPng(String name) => 'assets/images/$name.png';

  /// Svg icon
  String get user => toSvg('user');

  String toSvg(String name) => 'assets/icons/$name.svg';
}
