import 'package:bookly_app1/Core/utils/styles.dart';
import 'package:flutter/material.dart';
class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key,required this.errorMessage});
final String errorMessage ;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage,style: Styles.textStyle18(context),),);
  }
}
