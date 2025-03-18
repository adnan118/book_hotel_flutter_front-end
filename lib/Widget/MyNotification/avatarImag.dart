import 'package:avatar_glow/avatar_glow.dart';
import 'package:book_hotel/LinksConnect/LinksAPI.dart';
import 'package:flutter/material.dart';

class AvatarImag extends StatelessWidget {
  final Color color;
  final String img;
    AvatarImag({Key? key, required this.color, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      startDelay: const Duration(milliseconds: 1000),
      glowColor: color,
      glowShape: BoxShape.circle,
      curve: Curves.easeInCirc,
      child:   Material(
        elevation: 8.0,
        shape: CircleBorder(),
        color: Colors.transparent,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage("${LinksApp.linkImagProfile}/$img"),
          radius: 50.0,
        ),
      ),
    );
  }
}
