import 'dart:convert';
import 'package:logistica_app/models/Estoque.dart';
import 'package:logistica_app/models/Pessoa.dart';
import 'package:logistica_app/models/Usuario.dart';
import 'package:http/http.dart' as http;

String url = "http://192.168.0.8:8080/usuario/";

Future<Usuario> login(Usuario usuario) async {
  final uri = Uri.parse(url + "login");
  final response = await http.post(uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': "application/json; charset=UTF-8",
        'connection': 'keep-alive',
        'Accept-Encoding': 'gzip, deflate, br',
      },
      body: jsonEncode(usuario));
  if (response.statusCode == 200) {
    var dataUser = json.decode(response.body);
    Usuario usuarioResponse = Usuario.fromJson(dataUser["usuario"]);
    usuarioResponse.setToken(dataUser["jwtToken"]);
    List<Estoque> estoques = [];
    print(dataUser["usuario"]["estoques"]);
    for (var i in dataUser["usuario"]["estoques"]) {
      Estoque estoque = new Estoque();
      estoque.setId(i["estoque"]["id"]);
      estoque.setNome(i["estoque"]["nome"]);
      estoques.add(estoque);
    }
    usuarioResponse.setEstoques(estoques);
    //print(dataUser);
    return usuarioResponse;
  } else {
    return new Usuario();
  }
}

Future<bool> cadastrarUsuario(Usuario usuario) async {
  final uri = Uri.parse(url + "salvar");
  var j = usuario.toJson();
  final response = await http.post(uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': "application/json; charset=UTF-8",
        'connection': 'keep-alive',
        'Accept-Encoding': 'gzip, deflate, br',
      },
      body: jsonEncode(j));

  print(response.body);
  if (response.statusCode == 200) {
    //var datauser = json.decode(response.body);
    //Usuario usuarioResponse = Usuario.fromJson(datauser["usuario"]);
    //pessoa.setNome(datauser['pessoa']['nome']);
    //usuarioResponse.setPessoa(pessoa);

    return true;
  } else {
    return false;
  }
}
