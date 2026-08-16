import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.labelText,
      this.isHidden = false,
      this.onChanged,
      this.validator});
  final String labelText;
  final bool isHidden;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        obscureText: isHidden,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white),
          focusedBorder: _underLineInputBorder(),
          enabledBorder: _underLineInputBorder(),
          // errorBorder: _underLineInputBorder(),
        ),
      ),
    );
  }

  UnderlineInputBorder _underLineInputBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    );
  }
}
