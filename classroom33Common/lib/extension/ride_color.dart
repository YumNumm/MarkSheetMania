import 'package:flutter/material.dart';

extension RideColor on int {
  Color get rideColor {
    switch (this) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.yellow;
      case 4:
        return Colors.green;
      case 5:
        return Colors.orange;
      case 6:
        return Colors.purple;
      default:
        return Colors.white;
    }
  }
}
