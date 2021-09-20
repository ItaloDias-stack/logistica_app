import 'package:flutter/material.dart';
import 'package:logistica_app/components/TextFields.dart';
import 'package:logistica_app/components/buttons.dart';
import 'package:logistica_app/components/customLoader.dart';
import 'package:logistica_app/controller/EstoqueController.dart';
import 'package:logistica_app/models/Estoque.dart';
import 'package:logistica_app/models/Usuario.dart';
import 'package:logistica_app/pages/inicioPage.dart';
import 'package:toast/toast.dart';

class CadastroEstoque extends StatefulWidget {
  final Usuario user;
  const CadastroEstoque({Key? key, required this.user}) : super(key: key);

  @override
  _CadastroEstoqueState createState() =>
      _CadastroEstoqueState(usuario: this.user);
}

class _CadastroEstoqueState extends State<CadastroEstoque> {
  Usuario usuario;

  _CadastroEstoqueState({required this.usuario});

  @override
  Widget build(BuildContext context) {
    TextEditingController nomeEstoque = new TextEditingController();

    final estoqueNomeField = CustomTextField(
        isPassword: false,
        controller: nomeEstoque,
        placeholder: 'Nome do estoque');

    final estoqueButton = SimpleRoundButton(
      cor: Colors.cyan.shade700,
      texto: Text(
        "CADASTRAR ESTOQUE",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () async {
        if (nomeEstoque.text == "") {
          Toast.show(
              'É necessário informar o nome do estoque para poder realizar o cadastro.',
              context,
              duration: Toast.LENGTH_LONG,
              backgroundColor: Colors.red,
              gravity: Toast.BOTTOM);
        } else {
          loading(context);
          Estoque estoque = new Estoque();
          estoque.setNome(nomeEstoque.text);
          Map<String, dynamic> res = await cadastrarEstoque(usuario, estoque);
          Navigator.pop(context);
          if (res["estado"]) {
            this.usuario = res["obj"];
            Toast.show("Estoque cadastrado com sucesso", context,
                backgroundColor: Colors.green.shade300,
                textColor: Colors.white,
                gravity: Toast.BOTTOM,
                duration: Toast.LENGTH_LONG);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InicioPage(usuario: usuario)));
          } else {
            nomeEstoque.text = "";
            Toast.show("Nome do estoque inválido", context,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                gravity: Toast.BOTTOM,
                duration: Toast.LENGTH_LONG);
          }
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
          title: Text("Cadastro de estoque"),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.cyan.shade700),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 25),
                Align(
                    child: Row(
                      children: [
                        Text(
                          "* ",
                          style: TextStyle(color: Colors.red),
                        ),
                        Text("Nome do estoque")
                      ],
                    ), // ,
                    alignment: Alignment.centerLeft),
                SizedBox(
                  height: 2,
                ),
                estoqueNomeField,
                SizedBox(
                  height: 25,
                ),
                estoqueButton
              ],
            ),
          )
        ],
      ),
    );
  }
}
