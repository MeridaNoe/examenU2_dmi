import 'package:examenu2/modules/entities/carros.dart';
import 'package:flutter/material.dart';

class DetailCarros extends StatelessWidget {
  final Carros carros;

  const DetailCarros({super.key, required this.carros});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de la poliza',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                carros.image.isNotEmpty
                    ? carros.image
                    : 'https://via.placeholder.com/150x150.png',
                width: 250,
                height: 250,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.warning),
              ),
            ),
            Row(
              children: [
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: DateTime.now().isAfter(carros.fechaExp)
                        ? Colors.red
                        : DateTime.now().isBefore(
                                carros.fechaExp.subtract(Duration(days: 30)))
                            ? Colors.yellow
                            : Colors.green,
                  ),
                  child: Text(
                    DateTime.now().isAfter(carros.fechaExp)
                        ? 'Poliza expirada'
                        : DateTime.now().isBefore(
                                carros.fechaExp.subtract(Duration(days: 30)))
                            ? 'Poliza proxima a expirar'
                            : 'Poliza al corriente',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Numero de poliza: ${carros.numPoliza}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Nombre: ${carros.nombre}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Modelo: ${carros.modelo}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Fecha de expiracion: ${carros.fechaExp}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
