class Usuario {
  String _nome;
  String _localizacao;
  String _endereco;
  String _numero;
  String _cep;
  String _complemento;
  String _bairro;
  String _email;
  String _senha;

  Usuario(this._complemento, this._nome, this._localizacao, this._endereco,
      this._numero, this._cep, this._bairro, this._email, this._senha);

  Usuario.vazio();

  String get complemento => _complemento;

  set complemento(String value) {
    _complemento = value;
  }

  @override
  String toString() {
    return _nome;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get Localizacao => _localizacao;

  set Localizacao(String value) {
    _localizacao = value;
  }

  String get endereco => _endereco;

  set endereco(String value) {
    _endereco = value;
  }

  String get numero => _numero;

  set numero(String value) {
    _numero = value;
  }

  String get cep => _cep;

  set cep(String value) {
    _cep = value;
  }

  String get bairro => _bairro;

  set bairro(String value) {
    _bairro = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }
}
