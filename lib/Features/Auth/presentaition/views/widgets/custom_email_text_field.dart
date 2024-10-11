import 'package:flutter/material.dart';

import '../../../../search/presentation/views/widgets/custom_text_field.dart';
class EmailField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: "Email",
      controller: emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is required';
        }
        final bool emailValid = RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        ).hasMatch(value);
        return emailValid ? null : 'Email format must be valid';
      },
      prefixIcon: Icons.email,

    );
  }
}