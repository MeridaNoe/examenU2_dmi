import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examenu2/modules/entities/carros.dart';
import 'package:examenu2/widgets/gastos/detail_carros.dart';
import 'package:examenu2/widgets/gastos/list_carros_data.dart';
import 'package:flutter/material.dart';

class GastosView extends StatefulWidget {
  const GastosView({super.key});

  @override
  State<GastosView> createState() => _GastosViewState();
}

class _GastosViewState extends State<GastosView> {
  final db = FirebaseFirestore.instance;
  List<Carros> carros = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    db.collection("carros").snapshots().listen((event) {
      final List<Carros> carrosList = [];
      for (var doc in event.docs) {
        final data = Carros(
          doc.data()['numPoliza'] ?? '',
          doc.data()['nombre'] ?? '',
          doc.data()['modelo'] ?? '',
          (doc.data()['fechaExp'] as Timestamp).toDate(), 
          doc.data()['imagen'] ?? '',
        );
        carrosList.add(data);
      }
      if (mounted) {
        setState(() {
          carros = carrosList;
          loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('CARROS', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.amber,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(context, '/add_gastos'),
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: carros.length,
        itemBuilder: (BuildContext context, int index) {
          return ListCarrosData(
              carros: carros[index],
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailCarros(
                              carros: carros[index],
                            )));
              });
        },
      ),
    );
  }
}
