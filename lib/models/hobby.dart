import 'package:flutter/material.dart';

class Hobby {
  final String name;
  final IconData icon;
  final String hoverText;
  final String backgroundImageUrl;
  final String favoriteText;

  const Hobby({
    required this.name,
    required this.icon,
    required this.hoverText,
    required this.backgroundImageUrl,
    required this.favoriteText,
  });
}