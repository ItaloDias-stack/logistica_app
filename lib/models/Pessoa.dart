class Pessoa {
  String _nome = "";
  int? _id;

  Pessoa();
  Pessoa.pessoa(this._nome, this._id);

  void setNome(String nome) {
    this._nome = nome;
  }

  String getNome() {
    return this._nome;
  }

  void setId(int id) {
    this._id = id;
  }

  int? getId() {
    return this._id;
  }

  Pessoa.fromJson(Map<String, dynamic> json)
      : this._id = json["id"],
        this._nome = json["nome"];

  @override
  String toString() {
    // TODO: implement toString
    return getNome();
  }
}
