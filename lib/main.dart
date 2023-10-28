import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      theme: ThemeData(primarySwatch: Colors.indigo, textTheme: GoogleFonts.comfortaaTextTheme(),),
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
  final List<Atracao> _listaFavoritos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rock in Rio", style: GoogleFonts.nosifer(fontSize: 23)),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, top: 15, bottom: 5),
            alignment: Alignment.centerLeft,
            child: Text("Dias & Atrações", style: GoogleFonts.pacifico(fontSize: 25,)),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 15),
              itemCount: listaAtracoes.length,
              itemBuilder: (context, index) {
                final isFavorito = _listaFavoritos.contains(listaAtracoes[index]);
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AtracaoPage(atracao: listaAtracoes[index])));
                  },
                  title: Text(listaAtracoes[index].nome, style: const TextStyle(fontSize: 15)),
                  subtitle: Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: listaAtracoes[index]
                        .tags
                        .map((tag) => Chip(label: Text('#$tag')))
                        .toList(),
                  ),
                  leading: CircleAvatar(
                    child: Text('${listaAtracoes[index].dia}'),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        if (isFavorito) {
                          _listaFavoritos.remove(listaAtracoes[index]);
                        } else {
                          _listaFavoritos.add(listaAtracoes[index]);
                        }
                      });
                    },
                    icon: isFavorito
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_border),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AtracaoPage extends StatelessWidget {
  final Atracao atracao;
  const AtracaoPage({super.key, required this.atracao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(atracao.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var tag in atracao.tags) Chip(label: Text("#$tag")),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Voltar"))
          ],
        ),
      ),
    );
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
  Atracao("Guns N' Roses", 3, ["Sucesso", "jungle", "Fas"]),
  Atracao("Bullet For My Valentine", 4, ["2019", "TearsDontFall", "Fas"]),
  Atracao("Green Day", 4, ["Sucesso", "top", "Fas"]),
  Atracao("Ghost", 5, ["Espetaculo", "NovoAlbum"]),
  Atracao("Metallica", 6, ["Influente", "top", "Show"]),
  Atracao("Cold Play", 7, ["Sucesso", "Fas"]),
  Atracao("Slipknot", 7, ["2019", "NovoAlbum", "Fas"]),
  Atracao("Linkin Park", 8, ["Sucesso", "Crawling", "Fas"]),
];
