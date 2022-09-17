import '../schema/state/state.dart';
import 'package:flutter/material.dart';

extension PositionColor on DevicePosition {
  List<Color> get onPrimary {
    switch (this) {
      case DevicePosition.projector1:
        return [
          const Color.fromARGB(255, 89, 191, 179),
          const Color.fromARGB(255, 65, 92, 179),
        ];
      case DevicePosition.projector2:
        return [
          const Color.fromARGB(255, 65, 92, 179),
          const Color.fromARGB(255, 179, 115, 179),
        ];
      case DevicePosition.projector3:
        return [
          const Color.fromARGB(255, 255, 114, 16),
          const Color.fromARGB(255, 191, 184, 43),
        ];
    }
  }
}
