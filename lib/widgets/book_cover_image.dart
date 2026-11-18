import 'package:flutter/material.dart';

class BookCoverImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final Color? fallbackColor;
  final Widget? fallbackChild;
  final double? width;
  final double? height;

  const BookCoverImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.fallbackColor,
    this.fallbackChild,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final placeholder = Container(
      width: width,
      height: height,
      color: fallbackColor ?? const Color(0xFFA34E1C),
      child: fallbackChild ??
          const Center(
            child: Icon(Icons.menu_book, color: Colors.white, size: 24),
          ),
    );

    if (imageUrl.startsWith('assets/')) {
      return Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (_, _, _) => placeholder,
      );
    }

    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, _, _) => placeholder,
    );
  }
}
