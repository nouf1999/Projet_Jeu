import 'package:flutter/material.dart';

void main() {
  runApp(ScoreApp());
}

class ScoreApp extends StatelessWidget {
  int scorePartie1 = 0;
  int scorePartie2 = 0;

  void incrementerScore(int partie, int points) {
    if (partie == 1) {
      scorePartie1 += points;
    } else if (partie == 2) {
      scorePartie2 += points;
    }
  }

  void resetScores() {
    scorePartie1 = 0;
    scorePartie2 = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scores',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scores'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Score Partie 1: $scorePartie1'),
            Text('Score Partie 2: $scorePartie2'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => incrementerScore(1, 10),
                  child: Text('Augmenter Score Partie 1'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => incrementerScore(2, 5),
                  child: Text('Augmenter Score Partie 2'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: resetScores,
              child: Text('Réinitialiser les Scores'),
            ),
          ],
        ),
      ),
    );
  }
}
