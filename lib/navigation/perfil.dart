import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

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
        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.brown,
              radius: 100,
              backgroundImage: NetworkImage('/assets/perfil.png'),
            ),
            const SizedBox(height: 16),
            const Text('Nombre: Noe Merida'),
            const SizedBox(height: 16),
            const Text('Correo: noemerida975@gmail.com'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () async{
                  await FirebaseAuth.instance.signOut();
                  print('Sesión cerrada');
                  Navigator.pushNamed(context, '/');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                child: const Text('Cerrar sesión', style: TextStyle(color: Colors.black)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
