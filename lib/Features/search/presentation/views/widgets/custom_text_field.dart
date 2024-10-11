import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onSaved,
    this.onChanged,
    this.controller,
    required this.hintText,
    this.onPressed,
    this.onSubmitted,  this.suffixIcon, this.prefixIcon, this.validator,  this.obscureText =false

  });

  final void Function(String?)? onSaved;
  final void Function(String)? onChanged; // على onChanged أن يكون نوعه String وليس String?
  final TextEditingController? controller;
  final String hintText;
  final void Function()? onPressed;
  final void Function(String?)? onSubmitted;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final bool obscureText ;



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator:validator ,
      onSaved:onSubmitted ,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon,color: Colors.white,),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
