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
  final List<Atracao> _listaFavoritos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Atrações"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemCount: listaAtracoes.length,
        itemBuilder: (context, index) {
          final isFavorito = _listaFavoritos.contains(listaAtracoes[index]);
          return ListTile(
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => AtracaoPage(atracao: listaAtracoes[index]))
              );
            },
            title: Text(listaAtracoes[index].nome),
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
                ? const Icon(Icons.favorite, color: Colors.red,)
                : const Icon(Icons.favorite_border),
            ),
          );
        },
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
  Atracao("Guns N' Roses", 2, ["Sucesso", "jungle", "Fas"]),
  Atracao("Slipknot", 3, ["2019", "NovoAlbum", "Fas"]),
  Atracao("Green Day", 4, ["Sucesso", "top", "Fas"]),
  Atracao("Ghost", 4, ["Espetaculo", "NovoAlbum"]),
  Atracao("Metallica", 4, ["Influente", "top", "Show"]),
  Atracao("Cold Play", 5, ["Sucesso", "Fas"]),
  Atracao("Bullet For My Valentine", 4, ["2019", "TearsDontFall", "Fas"]),
  Atracao("Linkin Park", 6, ["Sucesso", "Crawling", "Fas"]),
];