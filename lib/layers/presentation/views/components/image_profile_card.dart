import 'package:flutter/material.dart';

class ImageProfileCard extends StatelessWidget {
  const ImageProfileCard({super.key, required this.urlImage});

  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        child: Image.network(
          urlImage,
          fit: BoxFit.contain,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return const Center(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
