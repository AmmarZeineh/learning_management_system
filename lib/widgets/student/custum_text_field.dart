import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.obs = false,
  });
  final Function(String)? onChanged;

  final String? hintText;
  final bool? obs;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obs!,
      validator: (data) {
        if (data!.isEmpty) {
          return "field is requierd";
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(),
        ),
        border: const OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}