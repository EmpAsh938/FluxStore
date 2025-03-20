import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatefulWidget {
  const ImageItem({
    super.key,
    this.onTap,
    required this.image,
  });

  final Function()? onTap;
  final ImageProvider image;

  @override
  State<ImageItem> createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap?.call(),
      child: FittedBox(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.2),
                spreadRadius: -8,
                blurRadius: 12,
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: ExtendedImage(
              image: widget.image,
              fit: BoxFit.contain,
              handleLoadingProgress: true,
            ),
          ),
        ),
      ),
    );
  }
}
