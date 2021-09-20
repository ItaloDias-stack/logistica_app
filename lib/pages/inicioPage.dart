import 'package:flutter/material.dart';
//import 'package:logistica_app/components/listView.dart';
import 'package:logistica_app/models/Usuario.dart';
import 'package:logistica_app/pages/cadastroEstoque.dart';

class InicioPage extends StatefulWidget {
  final Usuario usuario;
  const InicioPage({Key? key, required this.usuario}) : super(key: key);

  @override
  _InicioPageState createState() => _InicioPageState(usuario: this.usuario);
}

class _InicioPageState extends State<InicioPage> {
  Usuario usuario;

  _InicioPageState({required this.usuario});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Estoques"),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.cyan.shade700),
        body: usuario.getEstoques().length > 0
            ? new ListView.builder(
                padding: const EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: ListTile(
                      onTap: () {
                        print(usuario.getEstoques()[index]);
                      },
                      title: Text('${usuario.getEstoques()[index].toString()}'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  );
                },
                itemCount: usuario.getEstoques().length)
            : Center(child: Text("Nenhum estoque adicionado")),
        floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.add_rounded),
          backgroundColor: Colors.cyan.shade700,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CadastroEstoque(user: usuario)));
          },
        ));
  }
}
