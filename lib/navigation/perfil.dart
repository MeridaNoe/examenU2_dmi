import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          const CircleAvatar(
            backgroundColor: Colors.brown,
            radius: 100,
            backgroundImage: NetworkImage('/assets/perfil.png'),
          ),
          const Text('Nombre: Noe Merida'),
          const Text('Correo: noemerida975@gmail.com '),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () async {
                try {
                 final FirebaseAuth _auth = FirebaseAuth.instance;
                  await _auth.signOut();
                  Navigator.pushNamed(context, '/');
                } on FirebaseAuthException catch (e) {
                  print(e.message);
                }
              },
              child: const Text('Cerrar sesión'),
            ),
          )
        ]),
      ),
    );
  }
}
