class Gastos {
  final String _nombre;
  final String _descipcion;
  final int _cantidad;
  final String _imagen;

  Gastos(this._nombre, this._descipcion, this._cantidad,  this._imagen);

  String get nombre => _nombre;
  String get descripcion => _descipcion;
  int get cantidad => _cantidad;
  String get imagen => _imagen;
}