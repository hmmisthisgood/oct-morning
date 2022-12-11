import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      this.validator,
      this.onChanged,
      this.labelText,
      this.hintText,
      this.prefix,
      this.suffix});

  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  final String? labelText;
  final String? hintText;
  final Widget? prefix;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: true,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      // maxLines: 5,
      // maxLength: 10,

      onChanged: onChanged,
      validator: validator,

      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        // fillColor: Colors.white,
        // filled: true,
        prefixIcon: prefix,
        suffixIcon: suffix,
        border: InputBorder.none,
        focusedBorder: UnderlineInputBorder(),
        errorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        focusedErrorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        disabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
      ),
    );
  }
}
