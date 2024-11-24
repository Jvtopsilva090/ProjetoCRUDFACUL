class User {
  final String id;
  final String nome;
  final String email;
  final String numero; //+55 (62) 91234-1234
  final String icone;

  const User({
    this.id = '',
    required this.nome,
    required this.email,
    required this.numero,
    required this.icone,
  });
}
