import 'dispositivo.dart';
import '../mixins/sincronizacionNube.dart';

class Servidor extends Dispositivo with SincronizacionNube {
  String sistemaOperativo;
  int puertos;

  Servidor(
    String id,
    String marca,
    String modelo,
    int anioFabricacion,
    this.sistemaOperativo,
    this.puertos,
  ) : super(id, marca, modelo, anioFabricacion);

  @override
  String toString() {
    return super.toString() +
        'Sistema operativo: $sistemaOperativo, '
            'Puertos: $puertos';
  }

  void actualizarLibrerias() {
    print("Actualizando el servidor");
  }
}
