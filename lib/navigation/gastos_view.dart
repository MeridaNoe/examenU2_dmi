import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examenu2/modules/entities/gastos.dart';
import 'package:examenu2/widgets/gastos/detail_gastos.dart';
import 'package:examenu2/widgets/gastos/list_gastos_data.dart';
import 'package:flutter/material.dart';

class GastosView extends StatefulWidget {
  const GastosView({super.key});

  @override
  State<GastosView> createState() => _GastosViewState();
}

class _GastosViewState extends State<GastosView> {
  final db = FirebaseFirestore.instance;
  List<Gastos> gastos = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    db.collection("gastos").snapshots().listen((event) {
      final List<Gastos> gastosList = [];
      for (var doc in event.docs) {
        final data = Gastos(
          doc.data()['nombre'],
          doc.data()['descripcion'],
          doc.data()['cantidad'],
          doc.data()['imagen'],
        );
        gastosList.add(data);
      }
      if (mounted) {
        setState(() {
          gastos = gastosList;
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
        title: const Text('Gastos', style: TextStyle(color: Colors.black)),
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
        itemCount: gastos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListGastosData(
              gastos: gastos[index],
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailGastos(
                              gastos: gastos[index],
                            )));
              });
        },
      ),
    );
  }
}
