import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
class CustomBookItem extends StatelessWidget {
  const
  CustomBookItem({super.key,required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    //aspect ratio اديك قيمه واحده وانتى تظبطى على اساسها القيمه التانيه
    return AspectRatio(
      aspectRatio: 2.6/4,
      child:ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
        //  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const  Icon(Icons.error,size: 50,),
        ),
      ),
    );
  }
}