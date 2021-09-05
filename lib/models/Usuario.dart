import 'package:logistica_app/models/Estoque.dart';

import 'Pessoa.dart';

class Usuario {
  int? _id;
  String? _login, _senha, _email, _token;
  Pessoa _pessoa = new Pessoa();
  List<Estoque> _estoques = [];

  Usuario();
  Usuario.usuario(this._id, this._email, this._login, this._pessoa, this._senha,
      this._token, this._estoques);

  void setEstoques(List<Estoque> estoques) {
    this._estoques = estoques;
  }

  List<Estoque> getEstoques() {
    return this._estoques;
  }

  void setToken(String token) {
    this._token = token;
  }

  String? getToken() {
    return this._token;
  }

  void setPessoa(Pessoa pessoa) {
    this._pessoa = pessoa;
  }

  Pessoa getPessoa() {
    return this._pessoa;
  }

  void setEmail(String email) {
    this._email = email;
  }

  String? getEmail() {
    return this._email;
  }

  void setId(int id) {
    this._id = id;
  }

  int? getId() {
    return this._id;
  }

  void setLogin(String login) {
    this._login = login;
  }

  String? getLogin() {
    return this._login;
  }

  void setSenha(String senha) {
    this._senha = senha;
  }

  String? getSenha() {
    return this._senha;
  }

  Usuario.fromJson(Map<String, dynamic> json)
      : this._login = json['login'],
        this._senha = json['senha'],
        this._id = json['id'],
        this._email = json['email'],
        this._pessoa = Pessoa.fromJson(json["pessoa"]);

  Map<String, dynamic> toJson() => {
        'login': this._login,
        'senha': this._senha,
        "email": this._email,
        "pessoa": this._pessoa.toJson()
      };

  @override
  String toString() {
    // TODO: implement toString
    return getPessoa().getNome();
  }
}
