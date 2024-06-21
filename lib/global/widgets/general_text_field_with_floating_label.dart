import 'package:flutter/material.dart';

class GeneralTextFormField extends StatelessWidget {
  const GeneralTextFormField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.onChanged,
      required this.validator });
  final TextEditingController controller;
  final String labelText;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      style: const TextStyle(
          fontWeight: FontWeight.w400,fontSize: 14,color: Colors.black,decoration: TextDecoration.none
      ),

      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
            fontWeight: FontWeight.w400,fontSize: 14,color: Color.fromRGBO(153, 153, 153, 0.56)
        ),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(width: 1,color: Color(0xFF999999))),
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(width: 1,color: Color(0xFF999999))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: const BorderSide(width: 1,color: Color(0xFF602465))),

      ),
    );


  }
}
