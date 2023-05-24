import 'package:flutter/material.dart';

class GameMenuScreen extends StatelessWidget {
  void _inviteFriend() {
    // Logique pour inviter un ami
    print('Inviter un ami');
  }

  void _requestToJoin() {
    // Logique pour demander à rejoindre
    print('Demander à rejoindre');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu du jeu'),
      ),
      body: Center(
        child: Text('Contenu de votre jeu ici'),
      ),
      // Menu à trois points
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Inviter un ami'),
              onTap: _inviteFriend,
            ),
            ListTile(
              leading: Icon(Icons.group_add),
              title: Text('Demander à rejoindre'),
              onTap: _requestToJoin,
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: GameMenuScreen(),
  ));
}
