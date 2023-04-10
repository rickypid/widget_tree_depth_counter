// Flutter imports:
import 'package:flutter/material.dart';

/// Class used to count current depth vale
class DepthCounter extends ChangeNotifier {
  final int _value;

  /// Get current depth value
  int get value => _value;
  DepthCounter(this._value);
}
