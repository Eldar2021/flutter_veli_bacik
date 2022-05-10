import 'package:flutter/material.dart';

extension BuildContextExtenison on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }

  double height() {
    return MediaQuery.of(this).size.height;
  }

  double width(double s) {
    return MediaQuery.of(this).size.width * s;
  }

  ThemeData theme() {
    return Theme.of(this);
  }

  ColorScheme colorScheme() {
    return Theme.of(this).colorScheme;
  }

  TextStyle eldar() {
    return TextStyle(
      fontSize: 30,
      color: Theme.of(this).errorColor,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle? displayLarge() {
    return Theme.of(this).textTheme.displayLarge;
  }

  TextStyle? headline6() {
    return Theme.of(this).textTheme.headline6;
  }
}
