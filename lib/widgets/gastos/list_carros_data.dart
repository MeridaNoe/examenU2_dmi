import 'package:examenu2/modules/entities/carros.dart';
import 'package:flutter/material.dart';

class ListCarrosData extends StatelessWidget {
  const ListCarrosData({super.key, required this.carros, required this.onTap});

  final Carros carros;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Image.network(
            carros.image.isNotEmpty
                ? carros.image
                : 'https://via.placeholder.com/50x50.png',
            width: 50,
            height: 50,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.warning),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Numero de poliza: ${carros.numPoliza}',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                carros.nombre,
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(
                carros.modelo,
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(
                'Fecha de expiracion: ${carros.fechaExp}',
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
         /* const Spacer(),
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
              carros.fechaExp >= 1000
                  ? 'Gasto alto'
                  : gastos.cantidad < 500
                      ? 'Poco gasto'
                      : 'Cuidado',
              style: const TextStyle(color: Colors.black),
            ),
          )*/
        ],
      ),
    );
  }
}
