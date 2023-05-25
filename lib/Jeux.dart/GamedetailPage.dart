import 'package:flutter/material.dart';

import 'Joindre-jeux.dart';
import 'Menu.dart';

class GameDetailsPage extends StatelessWidget {
  final String gameId;

  GameDetailsPage(this.gameId);

  @override
  Widget build(BuildContext context) {
    // Utilisez l'ID du jeu pour récupérer les détails du jeu depuis une source de données
    // par exemple, une base de données ou une API

    // ... code pour récupérer les détails du jeu avec l'ID

    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du jeu'),

      ),
      body: Center(
         
        //child: Text('Détails du jeu $gameId'),
         child:  IconButton(
          icon: Icon(Icons.person_add),
          onPressed: () {
Navigator.of(context).push(MaterialPageRoute(builder: (context) => JoinGamePage()));
          }

        
      ),
    ) );
  }
}
