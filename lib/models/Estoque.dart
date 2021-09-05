import 'Produto.dart';

class Estoque {
  int? _id;
  String? _nome;
  List<Produto>? _produtos;

  Estoque();
  Estoque.estoque(this._id, this._nome, this._produtos);

  void setProdutos(List<Produto> produtos) {
    this._produtos = produtos;
  }

  List<Produto>? getProdutos() {
    return this._produtos;
  }

  void setNome(String nome) {
    this._nome = nome;
  }

  String? getNome() {
    return this._nome;
  }

  void setId(int id) {
    this._id = id;
  }

  int? getId() {
    return this._id;
  }

  Estoque.fromJson(Map<String, dynamic> json)
      : this._id = json['id'],
        this._nome = json['nome'];
}
