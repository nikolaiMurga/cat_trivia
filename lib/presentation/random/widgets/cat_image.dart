import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_trivia/presentation/common/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

class CatImage extends StatelessWidget {
  final String imageUrl;

  const CatImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (context, url) => const Padding(
          padding: EdgeInsets.all(25.0),
          child: LoadingIndicator(),
        ),
        errorWidget: (context, url, error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
