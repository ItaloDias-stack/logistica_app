import 'package:flutter/material.dart';
import 'package:logistica_app/components/TextFields.dart';
import 'package:logistica_app/components/buttons.dart';
import 'package:toast/toast.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final icon = Icon(
      Icons.account_circle,
      color: Colors.cyan.shade700,
      size: 100,
    );

    TextEditingController textFildUserController = new TextEditingController();
    TextEditingController textFildPassController = new TextEditingController();

    final userField = CustomTextField(
        controller: textFildUserController,
        placeholder: "Digite o seu nome de usuário",
        icone: Icon(Icons.account_box),
        isPassword: false);

    final passwordField = CustomTextField(
      isPassword: true,
      icone: Icon(Icons.vpn_key),
      controller: textFildPassController,
      placeholder: "Digite a sua senha",
    );

    final loginButton = SimpleRoundButton(
      cor: Colors.cyan.shade700,
      texto: Text(
        "LOGIN",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        if (textFildPassController.text == "" ||
            textFildUserController.text == "") {
          Toast.show(
              "É obrigatório inserir um nome de usuário e senha", context,
              textColor: Colors.white,
              backgroundColor: Colors.red,
              duration: Toast.LENGTH_LONG,
              gravity: Toast.BOTTOM);
        }
      },
    );

    final createAccountButton = SimpleRoundButton(
      cor: Colors.white,
      texto: Text("CRIAR CONTA", style: TextStyle(color: Colors.cyan.shade700)),
      onPressed: () {
        print("criar acc");
      },
    );
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.cyan.shade700,
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery.of(context).size.width - 50,
          height: MediaQuery.of(context).size.height - 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 25),
                icon,
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nome de usuário",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 2),
                userField,
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Senha",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 2),
                passwordField,
                SizedBox(height: 25),
                loginButton,
                SizedBox(height: 2),
                createAccountButton
              ],
            ),
          ),
        ),
      ),
    );
  }
}
