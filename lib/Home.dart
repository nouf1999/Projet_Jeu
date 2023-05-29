import 'package:flutter/material.dart';
import 'package:projet_jeu/Jeux/creer_jeux.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Transition()));
          },
          child: Image.asset('assets/Image4.jpg'),
        ),
      ),
    );
  }
}
