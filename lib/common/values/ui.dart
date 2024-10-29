import 'package:flutter/rendering.dart';

class Borders {
  static const BorderSide primaryBorder = BorderSide(
    color: Color.fromARGB(255, 230, 230, 231),
    width: 1,
    style: BorderStyle.solid,
  );
}

class Radii {
  static const BorderRadiusGeometry k6pxRadius =
      BorderRadius.all(Radius.circular(6));
}

class Shadows {
  static const BoxShadow primaryShadow = BoxShadow(
    color: Color.fromARGB(38, 27, 27, 29),
    offset: Offset(0, 5),
    blurRadius: 10,
  );
}
