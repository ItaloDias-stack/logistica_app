import 'package:flutter/material.dart';
import 'package:logistica_app/components/TextFields.dart';
import 'package:logistica_app/components/buttons.dart';
import 'package:logistica_app/components/customLoader.dart';
import 'package:logistica_app/controller/UsuarioController.dart';
import 'package:logistica_app/models/Pessoa.dart';
import 'package:logistica_app/models/Usuario.dart';
import 'package:toast/toast.dart';

import 'login.dart';

class CadastroUsuarioPage extends StatefulWidget {
  const CadastroUsuarioPage({Key? key}) : super(key: key);

  @override
  _CadastroUsuarioPageState createState() => _CadastroUsuarioPageState();
}

class _CadastroUsuarioPageState extends State<CadastroUsuarioPage> {
  @override
  Widget build(BuildContext context) {
    final icon = Icon(
      Icons.account_circle,
      color: Colors.cyan.shade700,
      size: 50,
    );

    TextEditingController loginController = TextEditingController();
    final loginField = CustomTextField(
      controller: loginController,
      isPassword: false,
      placeholder: "Digite o nome de usuário",
    );

    TextEditingController passController = TextEditingController();
    final passField = CustomTextField(
      isPassword: true,
      controller: passController,
      placeholder: "Digite a senha",
    );

    TextEditingController emailController = TextEditingController();
    final emailField = CustomTextField(
      isPassword: false,
      controller: emailController,
      placeholder: "Digite o seu e-mail",
      tipoTeclado: TextInputType.emailAddress,
    );

    TextEditingController pessoaController = TextEditingController();
    final pessoaField = CustomTextField(
        isPassword: false,
        controller: pessoaController,
        placeholder: "Digite o seu nome");

    final createAccountButton = SimpleRoundButton(
      cor: Colors.cyan.shade700,
      texto: Text(
        "CRIAR CONTA",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () async {
        if (pessoaController.text == "" ||
            passController.text == "" ||
            loginController.text == "") {
          Toast.show('Os campos marcados com "*" são obrigatórios', context,
              duration: Toast.LENGTH_LONG,
              backgroundColor: Colors.red,
              gravity: Toast.BOTTOM);
        } else {
          loading(context);
          Usuario usuario = new Usuario();
          usuario.setEmail(emailController.text);
          usuario.setLogin(loginController.text);
          usuario.setSenha(passController.text);
          Pessoa p = new Pessoa();
          p.setNome(pessoaController.text);
          usuario.setPessoa(p);

          bool response = await cadastrarUsuario(usuario);
          Navigator.pop(context);
          if (response) {
            //emailController.text = '';
            //loginController.text = '';
            //passController.text = '';
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginWidget()));
          } else {
            emailController.text = '';
            loginController.text = '';
            passController.text = '';
            pessoaController.text = "";
            Toast.show('Esse usuário já está cadastrado no sistema.', context,
                duration: Toast.LENGTH_LONG,
                backgroundColor: Colors.red,
                gravity: Toast.BOTTOM);
          }
        }
      },
    );
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: ListView(children: [
        new Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.cyan.shade700,
          alignment: Alignment.center,
          child: new Container(
            width: MediaQuery.of(context).size.width - 50,
            height: MediaQuery.of(context).size.height - 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  icon,
                  SizedBox(height: 10),
                  Align(
                    child: Row(
                      children: [
                        Text(
                          "* ",
                          style: TextStyle(color: Colors.red),
                        ),
                        Text("Login")
                      ],
                    ), // ,
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: 2),
                  loginField,
                  SizedBox(height: 10),
                  Align(
                    child: Row(
                      children: [
                        Text(
                          "* ",
                          style: TextStyle(color: Colors.red),
                        ),
                        Text("Senha")
                      ],
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: 2),
                  passField,
                  SizedBox(height: 10),
                  Align(
                    child: Text("E-mail"),
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: 2),
                  emailField,
                  SizedBox(height: 10),
                  Align(
                    child: Row(
                      children: [
                        Text(
                          "* ",
                          style: TextStyle(color: Colors.red),
                        ),
                        Text("Nome")
                      ],
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: 2),
                  pessoaField,
                  SizedBox(height: 15),
                  createAccountButton
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
