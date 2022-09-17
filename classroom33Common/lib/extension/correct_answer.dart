import 'package:flutter/material.dart';

extension CorrectAnswerColor on int {
  Color get correctAnswerColor => this == 1
      ? const Color.fromARGB(255, 255, 157, 157)
      : this == 2
          ? const Color.fromARGB(255, 178, 149, 255)
          : this == 3
              ? const Color.fromARGB(255, 255, 197, 130)
              : const Color.fromARGB(255, 119, 255, 141);
}
