
class Icone {

  final String dir;

  bool selected = false;

  Icone({required this.dir});

  static final List<Icone> _icones = [
    Icone(dir: 'avatar-1300331_1280.png'),
    Icone(dir: 'avatar-1295429_960_720.png'),
    Icone(dir: 'avatar-1295430_1280.png'),
    Icone(dir: 'gangster-154425_960_720.png'),
    Icone(dir: 'female-306407_1280.png'),
    Icone(dir: 'man-7473745_960_720.jpg'),
    Icone(dir: 'woman-6193184_1280.jpg'),
    Icone(dir: 'ai-generated-8083323_1280.jpg'),
    Icone(dir: 'man-156584_1280.png'),
    Icone(dir: '1k38PmUEbJR64Tbdz6sPNjA.jpg'),
  ];

  static List<Icone> get list {
    return _icones;
  }
}