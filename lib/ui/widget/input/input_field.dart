import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({super.key, required this.controller, this.hintText, this.labelText});

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText ?? 'Email Address',
        hintText: widget.hintText ?? "Email Address",
        prefixIcon:
        const Icon(Icons.email, color: Color(0xFFB0BEC5)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8)),
      ),
      validator: (value) {
        if (value == null || !value.contains('@')) {
          return 'Enter a valid email';
        }
        return null;
      },
    );
  }
}
