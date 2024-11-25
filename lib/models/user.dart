class User {
<<<<<<< HEAD
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
=======
  final String id; // Identificador único do usuário. Normalmente gerado automaticamente.
  final String nome; // Nome completo do usuário.
  final String email; // E-mail do usuário.
  final String numero; // Número de telefone no formato internacional (e.g., +55 (62) 91234-1234).
  String icone; // URL do avatar do usuário. Pode ser alterada dinamicamente.

  // Construtor da classe `User`.
   User({
    this.id = '', // Define um valor padrão vazio para `id` se não for fornecido.
    required this.nome, // `nome` é obrigatório.
    required this.email, // `email` é obrigatório.
    required this.numero, // `numero` é obrigatório.
    required this.icone, // `icone` é obrigatório, mas pode ser alterado posteriormente.
>>>>>>> d2b590c (Descrição das mudanças realizadas)
  });
}
