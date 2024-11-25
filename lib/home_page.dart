import 'package:flutter/material.dart';

class SortearPalavra extends StatefulWidget {
  const SortearPalavra({super.key});

  @override
  State<SortearPalavra> createState() => _SortearPalavraState();
}

class _SortearPalavraState extends State<SortearPalavra> {
  final Map<String, String> _dicionario = {
    'flutter': 'Framework de desenvolvimento de apps.',
    'brasil': 'País do samba e do futebol.',
    'pizza': 'Prato italiano muito popular.',
    'montanha': 'Elevação natural do terreno.',
    'cachorro': 'Melhor amigo do homem.',
    'biblioteca': 'Lugar com muitos livros.',
    'computador': 'Máquina utilizada para processar dados.',
    'oceano': 'Grande lugar de água salgada.',
    'futebol': 'Esporte mais popular no Brasil.',
    'chocolate': 'Doce feito a partir do cacau.',
    'deserto': 'Região com pouca ou nenhuma precipitação.',
    'elefante': 'Maior mamífero terrestre.',
    'viagem': 'Ato de se deslocar para outro lugar.',
    'livro': 'Objeto usado para leitura.',
    'relógio': 'Instrumento para medir o tempo.',
    'teatro': 'Lugar onde são encenadas peças.',
  };
  String _dica = '';
  String _palavraCorreta = '';
  final TextEditingController _controller = TextEditingController();
  String _mensagem = '';

  @override
  void initState() {
    super.initState();
    _sortearPalavra();
  }

  void _sortearPalavra() {
    setState(() {
      final item = _dicionario.entries.toList()..shuffle();
      _palavraCorreta = item.first.key;
      _dica = item.first.value;
      _mensagem = '';
      _controller.clear();
    });
  }

  void _verificarResposta() {
    setState(() {
      if (_controller.text.trim().toLowerCase() == _palavraCorreta.toLowerCase()) {
        _mensagem = 'Parabéns! Você acertou!';
        _sortearPalavra();
      } else {
        _mensagem = 'Resposta errada! Tente novamente.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('App de Acertar Palavras'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Digite a palavra',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verificarResposta,
              child: const Text('Verificar'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/dica', arguments: _dica),
              child: const Text('Ver Dica'),
            ),
            const SizedBox(height: 20),
            Text(
              _mensagem,
              style: const TextStyle(fontSize: 18, color: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }
}
