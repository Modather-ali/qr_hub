import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SuperTextField extends StatelessWidget {
  SuperTextField({
    Key? key,
    this.fieldName = '',
    required this.textInputType,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.focusNode,
  }) : super(key: key);

  final String fieldName;
  final TextInputType? textInputType;
  TextInputAction? textInputAction;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool obscureText;
  TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        validator: validator,
        scrollPadding: const EdgeInsets.all(50),
        keyboardType: textInputType,
        textInputAction: textInputAction,
        focusNode: focusNode,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purple,
              width: 2.0,
            ),
          ),
          border: const OutlineInputBorder(borderSide: BorderSide(width: 2.0)),
          hintText: fieldName,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        obscureText: obscureText,
      ),
    );
  }
}
