import 'package:flutter/material.dart';
class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key, required this.text, required this.textButton,required this.onPressed});
final String text;
final String textButton;
final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
         FittedBox(
           fit: BoxFit.scaleDown,
           child: Opacity(
             opacity: .7,
             child: Text(
               text,
               style: const TextStyle(fontSize: 12),
             ),
           ),
         ),
        TextButton(
          onPressed: onPressed,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Opacity(
              opacity: .8,
              child:  Text(textButton,
                style: const TextStyle(fontSize: 12,color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );

  }
}
