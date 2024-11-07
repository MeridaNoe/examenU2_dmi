import 'package:examenu2/firebase_options.dart';
import 'package:examenu2/modules/auth/login.dart';
import 'package:examenu2/modules/auth/register.dart';
import 'package:examenu2/navigation/gastos_view.dart';
import 'package:examenu2/navigation/navigation.dart';
import 'package:examenu2/navigation/perfil.dart';
import 'package:examenu2/widgets/gastos/agregar_gasto.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/register': (context) => const Register(),
        '/menu': (context) => const Navigation(),
        '/gastos': (context) => const GastosView(),
        '/perfil': (context) => const Perfil(),
        '/add_gastos': (context) => const AgregarGasto(),
        
      },
    );
  }
}