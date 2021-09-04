import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final Icon? icone;
  final bool isPassword;
  const CustomTextField(
      {Key? key,
      this.controller,
      this.placeholder,
      this.icone,
      required this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new TextField(
        controller: this.controller,
        obscureText: this.isPassword,
        decoration: InputDecoration(
          prefixIcon: this.icone,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: this.placeholder,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
