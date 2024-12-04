class Usuario {
  final int? id;
  final String nome;
  final String email;
  final String numero;
  String icone;

  Usuario({
    this.id,
    required this.nome,
    required this.email,
    required this.numero,
    required this.icone,
  });

  Map<String, Object?> toMap() {
    return {
      'nome': nome,
      'email': email,
      'numero': numero,
      'icone': icone,
    };
  }

  @override
  String toString() {
    return
        'User(id: $id, nome: $nome, email: $email, numero: $numero, icone: $icone)';
  }
}