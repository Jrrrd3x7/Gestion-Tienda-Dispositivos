import 'dispositivo.dart';
import '../mixins/inalambrico.dart';
import '../mixins/sincronizacionNube.dart';

class Ordenador extends Dispositivo with Inalambrico, SincronizacionNube {
  int ram;
  int almacenamiento;

  Ordenador(
    String id,
    String marca,
    String modelo,
    int anioFabricacion,
    this.ram,
    this.almacenamiento,
  ) : super(id, marca, modelo, anioFabricacion);

  @override
  String toString() {
    return super.toString() +
        'RAM: $ram GB, '
            'Almacenamiento: $almacenamiento GB\n';
  }

  void compilarCodigo() {
    print('Compilando codigo......');
  }
}
