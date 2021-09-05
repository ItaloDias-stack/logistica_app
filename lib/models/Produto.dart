class Produto {
  String? _nome, _codigo;
  int? _id;
  double? _preco;

  Produto();
  Produto.produto(this._id, this._preco, this._nome, this._codigo);
  void setCodigo(String codigo) {
    this._codigo = codigo;
  }

  String? getCodigo() {
    return this._codigo;
  }

  void setPreco(double preco) {
    this._preco = preco;
  }

  double? getPreco() {
    return this._preco;
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
}
