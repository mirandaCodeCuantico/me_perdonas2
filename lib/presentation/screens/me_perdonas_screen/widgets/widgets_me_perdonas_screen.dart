import 'package:flutter/material.dart';

class TomaTuDesicion extends StatelessWidget {
  final Color color;
  final String text;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const TomaTuDesicion({
    super.key, 
    required this.color,
    required this.text,
    required this.width,
    required this.height,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        width: width,
        height: height,
        duration: const Duration(milliseconds: 400),
        curve: Curves.bounceOut,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: color,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero)),
          child: Text(text),
        )
      );
  }
}

class PlayAndPause extends StatelessWidget {

  final VoidCallback? onPressed;
  final Icon icon;

  const PlayAndPause({
    super.key, 
    this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 100,
      height: 100,
      //color: Colors.lightBlueAccent,
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(50)
      ),
      child: IconButton(
        onPressed: onPressed, 
        icon: icon
      ),
    );
  }
}