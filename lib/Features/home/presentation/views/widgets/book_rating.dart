import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Core/utils/styles.dart';
class BookRating extends StatelessWidget {
  const BookRating({super.key,this.mainAxisAlignment=MainAxisAlignment.start,required this.rating,required this.count});
final num rating ;
final int count ;
  @override
  final MainAxisAlignment mainAxisAlignment;
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: mainAxisAlignment,
      children:  [
        Icon(  FontAwesomeIcons.solidStar,color:Color(0xffFFDD4F),size: 17,),
        SizedBox(width:6.3,),
        Text('$rating',style:Styles.textStyle16,),
        SizedBox(width: 9,),
        Opacity(
          opacity: .5,
            child: Text("($count)",style: Styles.textStyle14.copyWith(
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.w600),
            )),
      ],
    );
  }
}
