import 'package:examenu2/modules/entities/gastos.dart';
import 'package:flutter/material.dart';

class ListGastosData extends StatelessWidget {
  const ListGastosData({super.key, required this.gastos, required this.onTap});

  final Gastos gastos;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Image.network(
            gastos.imagen.isNotEmpty
                ? gastos.imagen
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
                gastos.cantidad.toString(),
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                gastos.descripcion,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
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
              style: const TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
