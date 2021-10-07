import 'package:flutter/material.dart';

class BgClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var roundnessFactor = 50.0;

    path.moveTo(0, size.height * 0.1);

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, roundnessFactor * 0.4);

    path.quadraticBezierTo(
        0, size.height * 0.33 + roundnessFactor, 0, size.height * 0.065 + 100);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CoolClip extends CustomClipper<Path> {
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;
    path.moveTo(0, 150);
    path.quadraticBezierTo(w * 0.85, 100, w * 3.5, 600);
    path.lineTo(w, 0);
    path.lineTo(w, h); //Sağ üstten aşağıya;
    path.lineTo(0, h); //sol alttan yukarıya;
    // path.closePath();
    return path;
  }

  bool shouldReclip(CoolClip oldClipper) => true;
}

class TopClip extends CustomClipper<Path> {
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = 300.0;
    path.moveTo(0, 0);
    path.lineTo(w, 0);
    path.lineTo(w, h * 0.4);
    path.quadraticBezierTo(w * 0.75, h * 0.50, w * 0.5, h * 0.4);
    path.quadraticBezierTo(w * 0.25, h * 0.30, 0, h * 0.4);
    path.lineTo(0, 0); //sol alttan yukarıya;
    return path;
  }

  bool shouldReclip(TopClip oldClipper) => true;
}

class EasyClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var roundnessFactor = 50.0;

    path.moveTo(0, size.height * 0.1);

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, roundnessFactor * 1.9);

    path.quadraticBezierTo(
        0, size.height * 0.1 + roundnessFactor, 0, size.height * 0.09 + 100);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;
    path.moveTo(0, h * 0.5);
    path.quadraticBezierTo(w * 0.25, h * 0.65, w * 0.5, h * 0.5);
    path.quadraticBezierTo(w * 0.75, h * 0.35, w, h * 0.47);
    path.lineTo(w, 0);
    path.lineTo(w, h); //Sağ üstten aşağıya;
    path.lineTo(0, h); //sol alttan yukarıya;
    // path.closePath();
    return path;
  }

  bool shouldReclip(BackgroundClipper oldClipper) => false;
}
