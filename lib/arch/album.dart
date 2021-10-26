import 'package:flutter/widgets.dart';

class Album {
  Album({
    required this.name,
    required this.image,
    required this.priceUSD,
    required this.releaseDate,
  });

  final String name;
  final Image image;
  final double priceUSD;
  final DateTime releaseDate;
}
