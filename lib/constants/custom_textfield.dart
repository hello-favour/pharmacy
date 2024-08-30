import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    required this.keyboardType,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableSuggestions: true,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.black,
          size: 20,
        ),
        alignLabelWithHint: true,
      ),
      validator: validator,
    );
  }
}
