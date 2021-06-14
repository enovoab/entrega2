class Patente {
  final int id;
  final String patente;
  final String marca;
  final String precio;

  Patente({this.id, this.patente, this.marca, this.precio});

  Map<String, dynamic> toMap() {
    return {'id': id, 'patente': patente, 'marca': marca, 'precio ': precio};
  }
}
