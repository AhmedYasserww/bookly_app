import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onSaved,
    this.onChanged,
    this.controller,
    required this.hintText,
    this.onPressed,
    this.onSubmitted,
  });

  final void Function(String?)? onSaved;
  final void Function(String)? onChanged; // على onChanged أن يكون نوعه String وليس String?
  final TextEditingController? controller;
  final String hintText;
  final void Function()? onPressed;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged, // تأكد من تمرير onChanged هنا
      onSubmitted: onSubmitted,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: const Opacity(
            opacity: .6,
            child: Icon(Icons.clear, size: 24),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
