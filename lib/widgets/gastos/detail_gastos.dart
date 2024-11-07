import 'package:examenu2/modules/entities/gastos.dart';
import 'package:flutter/material.dart';

class DetailGastos extends StatelessWidget {
  final Gastos gastos;

  const DetailGastos({super.key, required this.gastos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del gasto', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: gastos.cantidad >= 1000
                        ? Colors.red
                        : gastos.cantidad < 500
                            ? Colors.green
                            : Colors.yellow,
                  ),
                  child: Text(
                    gastos.cantidad >= 1000
                        ? 'Gasto alto'
                        : gastos.cantidad < 500
                            ? 'Poco gasto'
                            : 'Cuidado',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            Center(
              child: Image.network(
                gastos.imagen.isNotEmpty
                    ? gastos.imagen
                    : 'https://via.placeholder.com/150x150.png',
                width: 150,
                height: 150,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.warning),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const SizedBox(height: 16),
                Text(
                  'Nombre: ${gastos.nombre}',
                  style: const TextStyle(fontSize: 16),
                ),
                const Spacer(),
                Text(
                  'Cantidad: ${gastos.cantidad}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Descripción: ${gastos.descripcion}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
