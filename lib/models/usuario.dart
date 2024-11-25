class Usuario {
  final int id;
  final String nome;
  final String email;
  final String numero; //+55 (62) 91234-1234
  final int icone;

  const Usuario({
    this.id = 0,
    required this.nome,
    required this.email,
    required this.numero,
    required this.icone,
  });

  Map<String, Object?> toMap() {
    return {
      //'id': this.id,
      'nome': this.nome,
      'email': this.email,
      'numero': this.numero,
      'icone': this.icone,
    };
  }

  @override
  String toString() {
    return 'Usuario{id: $id, nome: $nome, email: $email, numero: $numero, icone: $icone}';
  }
}
