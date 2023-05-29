/*import 'package:flutter/material.dart';


class CreateJeux extends StatefulWidget {
  const CreateJeux({super.key});

  @override
  State<CreateJeux> createState() => _CreateJeuxState();
}

class _CreateJeuxState extends State<CreateJeux> {
  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        
        title: Text('Bienvenue dans ce jeux pictionary'),
       
      ),
      body:Center (
        
       )

      
       
         );
        } 
        }*/
import 'package:flutter/material.dart';
import 'package:projet_jeu/Jeux/formulaire_creation_jeux.dart';
import 'package:projet_jeu/Jeux/game.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../View/auth_screen.dart';

class Transition extends StatefulWidget {
  const Transition({super.key});

  @override
  State<Transition> createState() => _TransitionState();
}

class _TransitionState extends State<Transition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, userSnapshot) {
        if (userSnapshot.hasData) {
          return CreateJeux();
        }
        return AuthScreen();
      },
    ));
  }
}

class CreateJeux extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil du jeu'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Card(
            child: ListTile(
              title: Text('Jeux en cours'),
              subtitle: Text('Découvrez vos jeux en cours'),
              trailing: Icon(Icons.play_arrow),
              onTap: () {
                // Action lorsque l'utilisateur appuie sur "Jeux en cours"
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CurrentGamesPage()),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Créer un nouveau jeu'),
              subtitle: Text('Commencez un nouveau jeu'),
              trailing: Icon(Icons.add),
              onTap: () {
                // Action lorsque l'utilisateur appuie sur "Créer un nouveau jeu"
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateGamePage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


/*class CurrentGamesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jeux en cours'),
      ),
      body: Center(
        child: Text('Liste des jeux en cours'),
      ),
    );
  }
}*/

/*class CreateGamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer un nouveau jeu'),
      ),
      body: Center(
        child: Text('Formulaire de création de jeu'),
      ),
    );
  }
}*/
