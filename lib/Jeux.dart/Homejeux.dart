import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'LienAccès.dart';

class Homejeux extends StatefulWidget {
  const Homejeux({super.key});

  @override
  State<Homejeux> createState() => _HomejeuxState();
}

class _HomejeuxState extends State<Homejeux> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
      ),
    body: Center(

      
      child:  IconButton(
          icon: Icon(Icons.person_add),
          onPressed: () {
Navigator.of(context).push(MaterialPageRoute(builder: (context) =>GameInvitationScreen ()));
          }

    

 

    ),
     )   ); 
    
}
}