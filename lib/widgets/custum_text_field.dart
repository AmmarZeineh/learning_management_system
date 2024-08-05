import 'package:flutter/material.dart';

//
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.obs = false,
    this.textInputType,
    required this.fillColor,
    this.controller,
  });
  final Function(String)? onChanged;

  final String? hintText;
  final bool? obs;
  final TextInputType? textInputType;
  final Color fillColor;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obs!,
      validator: (data) {
        if (data!.isEmpty) {
          return "field is requierd";
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: const TextStyle(),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
