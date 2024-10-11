import 'package:bookly_app1/Core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class CustomAppBarBookDetails extends StatelessWidget {
  const CustomAppBarBookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed:(){
          GoRouter.of(context).pop();
        }, icon:const Icon(Icons.close)),
        IconButton(
            onPressed:(){
GoRouter.of(context).push(AppRouter.kFavoriteView);
        },
    icon:const Icon(Icons.favorite,size: 32,color: Colors.red,)),



      ],
    );
  }
}
