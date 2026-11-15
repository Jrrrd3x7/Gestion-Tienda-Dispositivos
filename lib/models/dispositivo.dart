class Dispositivo {
  String id;
  String marca;
  String modelo;
  int anioFabricacion;

  Dispositivo(this.id, this.marca, this.modelo, this.anioFabricacion);

  @override
  String toString() {
    return 'ID del dispositivo: $id, '
        'Marca: $marca, '
        'Modelo: $modelo, '
        'Año de fabricación: $anioFabricacion\n ';
  }
}
