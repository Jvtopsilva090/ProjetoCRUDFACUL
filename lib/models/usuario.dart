class Usuario {
  final String? id;
  final String nome;
  final String email;
  final String numero;
  final String icone;

  const Usuario({
    this.id,
    required this.nome,
    required this.email,
    required this.numero,
    required this.icone,
  });
}