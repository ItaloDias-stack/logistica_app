import 'package:flutter/material.dart';

class CreateUserWidget extends StatelessWidget {
  const CreateUserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CadastroUsuarioPage(),
      theme: ThemeData.light(),
    );
  }
}

class CadastroUsuarioPage extends StatefulWidget {
  const CadastroUsuarioPage({Key? key}) : super(key: key);

  @override
  _CadastroUsuarioPageState createState() => _CadastroUsuarioPageState();
}

class _CadastroUsuarioPageState extends State<CadastroUsuarioPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
