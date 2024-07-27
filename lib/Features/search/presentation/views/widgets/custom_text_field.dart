import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {

  const CustomTextField({super.key,});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: () {
          },
          icon: Opacity(
            opacity: .6,
            child: const Icon(FontAwesomeIcons.magnifyingGlass, size: 24),
          ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
