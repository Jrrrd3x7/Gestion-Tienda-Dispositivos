import 'package:gestion_tienda/mixins/vibrar.dart';

import 'dispositivo.dart';

class RelojInteligente extends Dispositivo with vibrar {
  String sistemaOperativo;
  int pulsaciones;

  RelojInteligente(
    String id,
    String marca,
    String modelo,
    int anioFabricacion,
    this.sistemaOperativo,
    this.pulsaciones,
  ) : super(id, marca, modelo, anioFabricacion);

  @override
  String toString() {
    return super.toString() +
        'Sistema operativo: $sistemaOperativo, '
            'Pulsaciones: $pulsaciones';
  }

  void mostrarNotificaciones() {
    print("Mostrando notificaciones en el reloj inteligente");
  }
}
