import 'package:flutter/material.dart';

void main() {
  runApp(const RockInRioApp());
}

class RockInRioApp extends StatelessWidget {
  const RockInRioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rock in Rio",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Atracao {
  final String nome;
  final int dia;
  final List<String> tags;

  const Atracao(this.nome, this.dia, this.tags);
}

const listaAtracoes = [
  Atracao("Avenged Sevenfold", 1, ["Espetaculo", "LIBAD", "NovoAlbum"]),
  Atracao("Iron Maiden", 2, ["Influente", "top", "Show"]),
  Atracao("Guns N' Roses", 8, ["Sucesso", "jungle", "Fas"]),
  Atracao("Slipknot", 1, ["2019", "NovoAlbum", "Fas"]),
  Atracao("Green Day", 8, ["Sucesso", "top", "Fas"]),
  Atracao("Ghost", 3, ["Espetaculo", "NovoAlbum"]),
  Atracao("Metallica", 5, ["Influente", "top", "Show"]),
  Atracao("Cold Play", 6, ["Sucesso", "Fas"]),
  Atracao("Bullet For My Valentine", 4, ["2019", "TearsDontFall", "Fas"]),
  Atracao("Linkin Park", 7, ["Sucesso", "Crawling", "Fas"]),
];