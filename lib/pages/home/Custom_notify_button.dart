import 'package:flutter/material.dart';

class Custom_notify_button extends StatelessWidget {
  final String image_path;
  final Function()? onPressed;
  final double ic_size;
  const Custom_notify_button({
    Key? key,
    required this.image_path,
    this.onPressed,
    this.ic_size = 24.0,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: IconButton(
        onPressed: onPressed, 
      icon: ImageIcon(
        AssetImage(image_path),
        size: 24,
        ),
        ),
    );
  }
}