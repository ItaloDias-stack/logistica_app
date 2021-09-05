import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final Icon? icone;
  final bool isPassword;
  final TextInputType? tipoTeclado;
  const CustomTextField(
      {Key? key,
      this.controller,
      this.placeholder,
      this.icone,
      required this.isPassword,
      this.tipoTeclado})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new TextField(
        keyboardType: this.tipoTeclado,
        controller: this.controller,
        obscureText: this.isPassword,
        decoration: InputDecoration(
          prefixIcon: this.icone,
          contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          hintText: this.placeholder,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
