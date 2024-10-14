import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4, // Maintain the aspect ratio
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: imageUrl.isNotEmpty && Uri
            .tryParse(imageUrl)
            ?.hasAbsolutePath == true
            ? CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          errorWidget: (context, url, error) =>
              Image.network('https://dummyimage.com/150x150/cccccc/000000&text=No+Image',fit: BoxFit.fill,),
        )
            : Image.asset('images/null.png'),
      ),
    );
  }
}