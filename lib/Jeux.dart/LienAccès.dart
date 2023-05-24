import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GameInvitationScreen extends StatelessWidget {
  final String gameInviteLink = 'https://www.monlienjeu.com'; // Lien d'invitation du jeu

  void _inviteOthersToGame() async {
    if (await canLaunch(gameInviteLink)) {
      await launch(gameInviteLink);
    } else {
      throw 'Impossible de lancer le lien : $gameInviteLink';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invitation au jeu'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _inviteOthersToGame,
          child: Text('Inviter les autres au jeu'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: GameInvitationScreen(),
  ));
}
