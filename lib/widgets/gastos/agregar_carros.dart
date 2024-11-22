import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AgregarGasto extends StatefulWidget {
  const AgregarGasto({super.key});

  @override
  State<AgregarGasto> createState() => _AgregarGastoState();
}

class _AgregarGastoState extends State<AgregarGasto> {
  final _formKey = GlobalKey<FormState>();
  final _numPolizaController = TextEditingController();
  final _nombreController = TextEditingController();
  final _modeloController = TextEditingController();
  final _fechaExpController = TextEditingController();
  final _imagenController = TextEditingController();

  @override
  void dispose() {
    _numPolizaController.dispose();
    _nombreController.dispose();
    _modeloController.dispose();
    _fechaExpController.dispose();
    _imagenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Agregar Carro', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _numPolizaController,
                decoration: InputDecoration(labelText: 'Numero de Poliza'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un numero de poliza';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _modeloController,
                decoration: InputDecoration(labelText: 'Modelo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un modelo';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _fechaExpController,
                decoration: InputDecoration(
                  labelText: 'Fecha de Expiración',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _fechaExpController.text =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                        });
                      }
                    },
                  ),
                ),
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una fecha de expiración';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imagenController,
                decoration: const InputDecoration(labelText: 'Imagen (URL)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una URL de imagen';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final numPoliza = _numPolizaController.text;
                    final nombre = _nombreController.text;
                    final modelo = _modeloController.text;
                    final fechaExp = DateTime.parse(
                        _fechaExpController.text);
                    final timestamp = Timestamp.fromDate(fechaExp);
                    final imagen = _imagenController.text;

                    await FirebaseFirestore.instance.collection('carros').add({
                      'numPoliza': numPoliza,
                      'nombre': nombre,
                      'modelo': modelo,
                      'fechaExp': timestamp,
                      'imagen': imagen,
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Gasto agregado exitosamente')),
                    );

                    _numPolizaController.clear();
                    _nombreController.clear();
                    _modeloController.clear();
                    _fechaExpController.clear();
                    _imagenController.clear();
                  }
                },
                child: const Text('Agregar Gasto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
