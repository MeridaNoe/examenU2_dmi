import 'package:cloud_firestore/cloud_firestore.dart';

class Carros {
  final String _numPoliza;
  final String _nombre;
  final String _modelo;
  final DateTime _fechaExp;
  final String _image;

  Carros(this._numPoliza, this._nombre, this._modelo, this._fechaExp, this._image);

  String get numPoliza => _numPoliza;
  String get nombre => _nombre;
  String get modelo => _modelo;
  DateTime get fechaExp => _fechaExp;
  String get image => _image;
}