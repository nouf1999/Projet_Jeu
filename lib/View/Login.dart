
import 'package:flutter/material.dart';
import 'package:projet_jeu/Home.dart';
import 'package:projet_jeu/Jeux.dart/Creer-jeux.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Gérer la soumission du formulaire
      print('Nom: $_username, Nom de pass: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nom utilisateur',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir votre nom utilisateur';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mot de pass',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir votre mot de pass';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirmer le Mot de pass',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir votre mot de pass';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              


             SizedBox(height: 32.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                       onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateJeux()));
                
                  
                // Code à exécuter lorsqu'on appuie sur le bouton d'inscription
              },
                      //_submitForm,
                      child: Text('Valider'),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implémenter la logique du bouton "Annuler"
                        print('Annuler');
                      },
                      child: Text('Annuler'),
                    ),
                  ),
                
                ],
              ),
            ],
          ),
        ),
      ),
    );

}
}



