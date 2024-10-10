import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Core/utils/styles.dart';
class BookRating extends StatelessWidget {
  const BookRating({super.key,this.mainAxisAlignment=MainAxisAlignment.start,required this.count});

final int count ;
  @override
  final MainAxisAlignment mainAxisAlignment;
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: mainAxisAlignment,
      children:  [
        const Icon(  FontAwesomeIcons.solidStar,color:Color(0xffFFDD4F),size: 17,),
        const SizedBox(width:6.3,),
        //Text('$rating',style:Styles.textStyle16,),
        const SizedBox(width: 9,),
        Opacity(
          opacity: .5,
            child: Text("($count)",style: Styles.textStyle14.copyWith(
                color: const Color(0xffFFFFFF),
                fontWeight: FontWeight.w600),
            )),
        IconButton(
          icon: const Icon(Icons.favorite_border, color: Colors.red,size: 32,),
          onPressed: () {

          },
        ),
      ],
    );
  }
}
