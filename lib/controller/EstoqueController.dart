import 'package:http/http.dart' as http;
import 'package:logistica_app/models/Estoque.dart';
import 'dart:convert';

import 'package:logistica_app/models/Usuario.dart';

String url = "http://192.168.0.8:8080/estoque/";

Future<Map<String, dynamic>> cadastrarEstoque(
    Usuario u, Estoque estoque) async {
  final uri = Uri.parse(url + u.getId().toString() + "/salvar");
  var j = estoque.toJson();

  final response = await http.post(uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': "application/json; charset=UTF-8",
        'connection': 'keep-alive',
        'Accept-Encoding': 'gzip, deflate, br',
        "Authorization": "Bearer " + u.getToken()
      },
      body: jsonEncode(j));

  print(response.body);
  if (response.statusCode == 200) {
    var datauser = json.decode(response.body);
    Estoque estoqueResponse = Estoque.fromJson(datauser);
    u.getEstoques().add(estoqueResponse);
    return {"estado": true, "obj": u};
  }
  return {"estado": false, "obj": null};
}
