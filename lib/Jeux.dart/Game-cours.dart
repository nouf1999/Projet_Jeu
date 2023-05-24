import 'package:flutter/material.dart';
import 'package:projet_jeu/Jeux.dart/GamedetailPage.dart';
import 'package:projet_jeu/Jeux.dart/Game.dart';

import 'Joindre-jeux.dart';

class CurrentGamesPage extends StatelessWidget {
  List<Game> currentGames = [
    Game(id: '1', name: 'Jeu 1', status: 'En cours'),
    Game(id: '2', name: 'Jeu 2', status: 'En cours'),
    Game(id: '3', name: 'Jeu 3', status: 'En cours'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jeux en cours'),
        
          ),
      body: Center(   
      child: 
          
          
      
      ListView.builder(
        itemCount: currentGames.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(currentGames[index].name),
            subtitle: Text(currentGames[index].status),
            onTap: () {
              // Action lorsque l'utilisateur sélectionne un jeu en cours
              String gameId = currentGames[index].id;
              // Naviguer vers la page du jeu en cours avec l'ID du jeu
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GameDetailsPage(gameId)),
              );
            },
          );
        },
      ),
  
    ),
      );
        
  }
}
