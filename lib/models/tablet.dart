import 'dispositivo.dart';
import '../mixins/vibrar.dart';
import '../mixins/inalambrico.dart';

class Tablet extends Dispositivo with vibrar, Inalambrico {
  String sistemaOperativo;
  int almacenamiento;

  Tablet(
    String id,
    String marca,
    String modelo,
    int anioFabricacion,
    this.sistemaOperativo,
    this.almacenamiento,
  ) : super(id, marca, modelo, anioFabricacion);

  void mostrarNotificaciones() {
    print("Mostrando notificaciones en la tablet");
  }

  @override
  String toString() {
    return super.toString() +
        'Sistema Operativo: $sistemaOperativo, '
            'Almacenamiento: $almacenamiento';
  }

  void modoNoche() {
    print("Modo no molestar.");
  }
}
