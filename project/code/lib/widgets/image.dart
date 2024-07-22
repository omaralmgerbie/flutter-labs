import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius borderRadius;

  const ImageWidget({
    super.key,
    required this.imageUrl,
    this.width = double.infinity,
    this.height = 200.0,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return Center(
            child: Icon(
              Icons.error,
              color: Theme.of(context).colorScheme.error,
            ),
          );
        },
      ),
    );
  }
}
