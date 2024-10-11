import 'package:bookly_app1/Features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  final bool visible;
  final VoidCallback toggleVisibility;

  const PasswordField({
    super.key,
    required this.passwordController,
    required this.visible,
    required this.toggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: "Password",
      controller: passwordController,
      obscureText: visible,
      validator: (value) => value == null || value.isEmpty ? 'Field is required' : null,
      prefixIcon: Icons.password,
      suffixIcon: IconButton(
        onPressed: toggleVisibility,
        icon: Opacity(
          opacity: .6,
            child: Icon(visible ? Icons.visibility_off : Icons.visibility,color: Colors.white,)),
      ),
    );
  }
}