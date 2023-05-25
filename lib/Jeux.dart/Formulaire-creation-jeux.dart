import 'package:flutter/material.dart';
import 'package:projet_jeu/Jeux.dart/Game-cours.dart';
import 'package:projet_jeu/Jeux.dart/Homejeux.dart';
import 'package:projet_jeu/Jeux.dart/Menu.dart';


class CreateGamePage extends StatefulWidget {
  @override
  _CreateGamePageState createState() => _CreateGamePageState();
}

class _CreateGamePageState extends State<CreateGamePage> {
  TextEditingController _wordController = TextEditingController();
  TextEditingController _imageController = TextEditingController();

  @override
  void dispose() {
    _wordController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  void _createGame() {
    // Récupérer les valeurs du formulaire et effectuer les actions nécessaires
    String word = _wordController.text;
    String image = _imageController.text;
    
    // Exemple d'action : Enregistrer les informations du jeu dans une base de données ou effectuer une autre action de création de jeu
    // ...

    // Afficher une boîte de dialogue de succès ou effectuer une autre action de retour
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Succès'),
          content: Text('Le jeu a été créé avec succès.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                // Fermer la boîte de dialogue et retourner à la page d'accueil
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          
        title: Text('Créer un nouveau jeu'),
 
          
                  
      ),
      body: Padding(
      
          
        padding: EdgeInsets.all(16.0),
        child: Column(
         
          children: [
         
            TextFormField(
              controller: _wordController,
              decoration: InputDecoration(
                labelText: 'Mot',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _imageController,
              decoration: InputDecoration(
                labelText: 'URL de l\'image',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homejeux()));
                 
              },
              child: Text('Créer le jeu'),
            ),
          ],
        ),
      ),
    );
  }
}
