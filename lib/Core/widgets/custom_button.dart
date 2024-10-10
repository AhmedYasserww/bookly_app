import 'package:bookly_app1/Core/utils/styles.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.borderRadius,
    required this.textColor,
    required this.backgroundColor,
    required this.text,
    this.fontSize,
    this.onPressed,
  });

  @override
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius ? borderRadius;
  final String text;
  final double ? fontSize;
  final void Function()? onPressed;
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onLongPress:onPressed ,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
            shape:RoundedRectangleBorder(
          borderRadius:borderRadius ??BorderRadius.circular(16),
        )),
          onPressed:(){}, child:Text(text,
        style:Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w900,
            color: textColor,
          fontSize:fontSize
        ))),
    );
  }
}
