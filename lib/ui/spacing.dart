import 'package:flutter/material.dart';

class Space {
  static List<Widget> spaceBetween(
      List<Widget> children, EdgeInsetsGeometry space) {
    final spaced = <Widget>[];
    for (int i = 0; i < children.length - 1; i++) {
      spaced.add(Padding(padding: space, child: children[i]));
    }
    return spaced;
  }
}
