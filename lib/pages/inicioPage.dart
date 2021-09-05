import 'package:flutter/material.dart';
import 'package:logistica_app/models/Usuario.dart';

/*class InicioWidget extends StatelessWidget {
  final Usuario? usuario;
  const InicioWidget({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InicioPage(usuario: this.usuario),
      theme: ThemeData.light(),
    );
  }
}*/

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
            ? ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: Colors.white,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text('${usuario.getEstoques()[index].getNome()}'),
                        )),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: usuario.getEstoques().length)
            : Center(child: Text("Nenhum estoque adicionado")));
  }
}
