import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HumorApp(),
  ));
}

class HumorApp extends StatefulWidget {
  @override
  _HumorAppState createState() => _HumorAppState();
}

class _HumorAppState extends State<HumorApp> {
  int humor = 0; // 0 = feliz, 1 = neutro, 2 = bravo

  void alternarHumor() {
    setState(() {
      humor = (humor + 1) % 3;
    });
  }

  Color get corFundo {
    switch (humor) {
      case 0: return Color(0xFFFFF9C4); // amarelo claro
      case 1: return Color(0xFFE0E0E0); // cinza
      case 2: return Color(0xFFFFCDD2); // vermelho claro
      default: return Colors.white;
    }
  }

  Color get corPrimaria {
    switch (humor) {
      case 0: return Color(0xFFF9A825); // amarelo
      case 1: return Color(0xFF757575); // cinza escuro
      case 2: return Color(0xFFC62828); // vermelho escuro
      default: return Colors.black;
    }
  }

  IconData get icone {
    switch (humor) {
      case 0: return Icons.sentiment_very_satisfied;
      case 1: return Icons.sentiment_neutral;
      case 2: return Icons.sentiment_very_dissatisfied;
      default: return Icons.sentiment_neutral;
    }
  }

  String get nomeHumor {
    switch (humor) {
      case 0: return 'Feliz 😄';
      case 1: return 'Neutro 😐';
      case 2: return 'Bravo 😠';
      default: return '';
    }
  }

  String get mensagem {
    switch (humor) {
      case 0: return 'Que dia incrível!';
      case 1: return 'Tudo bem por aqui.';
      case 2: return 'Me deixa em paz!';
      default: return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corFundo,
      appBar: AppBar(
        backgroundColor: corPrimaria,
        title: Text(
          'Alterador de Humor',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icone,
              size: 120,
              color: corPrimaria,
            ),
            SizedBox(height: 16),
            Text(
              nomeHumor,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: corPrimaria,
              ),
            ),
            SizedBox(height: 8),
            Text(
              mensagem,
              style: TextStyle(
                fontSize: 18,
                color: corPrimaria.withOpacity(0.8),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: alternarHumor,
              style: ElevatedButton.styleFrom(
                backgroundColor: corPrimaria,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Mudar Humor',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}