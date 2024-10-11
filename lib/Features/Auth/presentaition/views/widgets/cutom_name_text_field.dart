import 'package:flutter/material.dart';
import '../../../../search/presentation/views/widgets/custom_text_field.dart';
class NameField extends StatelessWidget {
  final TextEditingController nameController;

  const NameField({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: "UserName",
      controller: nameController,
      validator: (value) => value == null || value.isEmpty ? 'Field is required' : null,
      prefixIcon: Icons.person,
    );
  }
}