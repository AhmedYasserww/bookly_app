import 'package:bookly_app1/Core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/assets.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18,top:30,bottom: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AssetsData.logo,height:30,),
          IconButton(onPressed:(){
            GoRouter.of(context).push(AppRouter.kSearchView);
          }, icon:const Icon(FontAwesomeIcons.magnifyingGlass,size: 24,)),
        ],
      ),
    );
  }
}
