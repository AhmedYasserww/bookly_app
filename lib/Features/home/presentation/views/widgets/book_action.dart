import 'package:bookly_app1/Core/widgets/custom_button.dart';
import 'package:bookly_app1/Features/home/data/models/BookModel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Core/utils/launch_url.dart';
class BooksActions extends StatelessWidget {
  const BooksActions({super.key,required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(children: [
        Expanded(child: CustomButton(
          text: "Free",
          backgroundColor: Colors.white,
          textColor: Colors.black,
          borderRadius: BorderRadius.only(topLeft:Radius.circular(16),bottomLeft: Radius.circular(16)),

        )),
        Expanded(
            child: CustomButton(
          onPressed:()async{
            launchCustomUr(context, bookModel.volumeInfo.previewLink);

          },
          fontSize: 16,
          text:getText(bookModel),
          backgroundColor:Color(0xffEF8262),
          textColor: Colors.white,
          borderRadius: BorderRadius.only(topRight:Radius.circular(16),bottomRight: Radius.circular(16)),

        ))
      ],),
    );

  }
  String getText(BookModel bookModel){
    if(bookModel.volumeInfo.previewLink==null){
      return "Not Available";
    }
    else{
      return "Preview";
    }

  }
}