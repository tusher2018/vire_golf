import 'package:flutter/material.dart';

Widget buildDot(bool isActive) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 4),
    width: isActive ? 10 : 8,
    height: isActive ? 10 : 8,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isActive ? Colors.black : Colors.grey.shade400,
    ),
  );
}
