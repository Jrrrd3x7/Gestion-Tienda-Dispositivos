import 'package:gestion_tienda/models/dispositivo.dart';
import 'package:gestion_tienda/models/ordenador.dart';
import 'package:gestion_tienda/models/relojinteligente.dart';
import 'package:gestion_tienda/models/tablet.dart';
import 'package:gestion_tienda/models/servidor.dart';

import 'dart:io';

Map<String, Dispositivo> dispositivos = {
  'D1': Ordenador('D1', 'Lenovo', 'thinkpad', 2020, 16, 1000),
  'D2': RelojInteligente('D2', 'Apple', 'm26', 2020, 'ios', 78),
  'D3': Servidor('D3', 'Dell', '26', 2020, 'ubuntu', 7),
  'D4': Tablet('D4', 'Huawei', 'plus', 2020, 'android', 256),
};
void main(List<String> arguments) {
  int? menu;

  do {
    print(dispositivos);
    print("1 - Crear dispositivo: ");
    print("2 - Eliminar dispositivo: ");
    print("3 - Modificar dispositivo: ");
    print("4 - Salir");
    stdout.write('Elige una opcion: ');
    menu = int.parse(stdin.readLineSync()!);

    switch (menu) {
      case 1:
        crearDispositivo();
        break;
      case 2:
        eliminarDispositivo();
        break;
      case 3:
        modificarDispositivo();
        break;
      case 4:
        print("Hasta Luego!");
        break;
      default:
        print('Eleccion no disponible!');
        break;
    }
  } while (menu != 4);

}

void crearDispositivo() {
  int? menu;
  do {
    print('1 - Ordenador');
    print('2 - Tablet');
    print('3 - Reloj inteligente');
    print('4 - Servidor');
    print('5 - Salir');
    stdout.write('Que dispositivo desea crear? ');
    menu = int.parse(stdin.readLineSync()!);

    if (menu == 5) {
      print('Bye!');
      break;
    }
    if (menu < 1 || menu > 5) {
      continue;
    }

    stdout.write('Introduce ID: ');
    String id = stdin.readLineSync()!;
    if (!buscarPorId(id)) {
      print('Todo va bien Jordi');

      stdout.write('Intrudce la marca: ');
      String marca = stdin.readLineSync()!;

      stdout.write('Introduce el modelo: ');
      String modelo = stdin.readLineSync()!;

      stdout.write('Introduce el Año: ');
      int anio = int.parse(stdin.readLineSync()!);

      switch (menu) {
        case 1:
          stdout.write('Introduce la RAM: ');
          int ram = int.parse(stdin.readLineSync()!);

          stdout.write("Introduce el almacenamiento: ");
          int almacenamiento = int.parse(stdin.readLineSync()!);

          Dispositivo ordenador = Ordenador(
            id,
            marca,
            modelo,
            anio,
            ram,
            almacenamiento,
          );
          dispositivos[id] = ordenador;
          print(ordenador);
          print('---------------------------------');
          print(dispositivos);
          break;
        case 2:
          stdout.write('Introduce el SO: ');
          String so = stdin.readLineSync()!;

          stdout.write('Introduce almacenamiento: ');
          int almacenamiento = int.parse(stdin.readLineSync()!);

          Dispositivo tablet = Tablet(
            id,
            marca,
            modelo,
            anio,
            so,
            almacenamiento,
          );
          dispositivos[id] = tablet;
          print(tablet);
          print('---------------------------------');
          print(dispositivos);

          break;
        case 3:
          stdout.write('Introduce el SO del reloj: ');
          String so = stdin.readLineSync()!;

          stdout.write('Introduce las pulsaciones: ');
          int pulsaciones = int.parse(stdin.readLineSync()!);

          Dispositivo reloj = RelojInteligente(
            id,
            marca,
            modelo,
            anio,
            so,
            pulsaciones,
          );
          dispositivos[id] = reloj;
          print(reloj);
          print('---------------------------------');
          print(dispositivos);
          break;
        case 4:
          stdout.write('Introduce el SO del servidor: ');
          String so = stdin.readLineSync()!;

          stdout.write('Introduce los puertos: ');
          int puertos = int.parse(stdin.readLineSync()!);

          Dispositivo servidor = Servidor(id, marca, modelo, anio, so, puertos);
          dispositivos[id] = servidor;
          print(servidor);
          print('---------------------------------');
          print(dispositivos);
          break;
        default:
          print('Eleccion no disponible');
          break;
      }
    } else {
      print('El dispositivo ya existe');
    }
  } while (menu != 5);
}

void eliminarDispositivo() {
  stdout.write('Id del dispositivo a eliminar');
  String id = stdin.readLineSync()!.toUpperCase();
  if (buscarPorId(id)) {
    dispositivos.remove(id);
    print('Dispositivo eliminado correctamente');
  } else {
    print('El dispositivo no existe');
  }
}

void modificarDispositivo() {
  stdout.write('ID de dispositivo a modificar: ');
  String id = stdin.readLineSync()!.toUpperCase();

  if (!buscarPorId(id)) {
    print('El dispositivo no existe.');
    return;
  }

  //Recupero el objeto
  Dispositivo dispositivo = dispositivos[id]!;
  int menu;
  do {
    print('Modificar datos: ');
    print('1- Marca');
    print('2- Modelo');
    print('3- Modificar un dispositivo en especifico');
    print('0- Salir');
    print('Elige una opcion:');
    menu = int.parse(stdin.readLineSync()!);
    switch (menu) {
      case 0:
        print('Hasta luego!');
        break;
      case 1:
        stdout.write('Escribe la nueva marca: ');
        dispositivo.marca = stdin.readLineSync()!;
        break;
      case 2:
        stdout.write('Escriba el nuevo modelo: ');
        dispositivo.modelo = stdin.readLineSync()!;
        break;
      case 3:
        switch (dispositivo) {
          case Ordenador ordenador:
            print('Modificar datos especificos del ordenador: ');
            print('1- Modificar Ram: ');
            print('2- Modificar el Almacenamiento: ');
            print('Que dato quieres modificar? ');
            int pc = int.parse(stdin.readLineSync()!);
            switch (pc) {
              case 1:
                print('Introduce la ram: ');
                ordenador.ram = int.parse(stdin.readLineSync()!);
                print('Ram modificada');
                print(ordenador);
                break;
              case 2:
                print('Introduce el almacenamiento: ');
                ordenador.almacenamiento = int.parse(stdin.readLineSync()!);
                print('Almacenamiento modificado!');
                print(ordenador);
                break;
              default:
                print('Eleccion no disponible');
                break;
            }
            break;
          case Tablet tablet:
            print('Modificar datos especificos de la tablet: ');
            print('1- Modificar Sistema Operativo');
            print('2- Modificar almacenamiento');
            print('Que dato quieres modificar? ');
            int tab = int.parse(stdin.readLineSync()!);
            switch (tab) {
              case 1:
                print('Introduce el nuevo Sistema Operativo: ');
                tablet.sistemaOperativo = stdin.readLineSync()!;
                print('Sistema operativo modificado!');
                print(tablet);
                break;
              case 2:
                print('Introduce el nuevo almacenamiento: ');
                tablet.almacenamiento = int.parse(stdin.readLineSync()!);
                print('Almacenamiento modificado!');
                print(tablet);
                break;
              default:
                print('Eleccion no disponible');
                break;
            }
            break;
          case RelojInteligente reloj:
            print('Modificar datos especificos del reloj: ');
            print('1- Modificar Sistema Operativo');
            print('2- Modificar pulsaciones');
            print('Que dato quieres modificar? ');
            int rel = int.parse(stdin.readLineSync()!);
            switch (rel) {
              case 1:
                print('Introduce el nuevo Sistema Operativo: ');
                reloj.sistemaOperativo = stdin.readLineSync()!;
                print('Sistema operativo del reloj modificado!');
                print(reloj);
                break;
              case 2:
                print('Introduce las nuevas pulsaciones: ');
                reloj.pulsaciones = int.parse(stdin.readLineSync()!);
                print('Pulsaciones modificados!');
                print(reloj);
                break;
              default:
                print('Eleccion no disponible');
                break;
            }
            break;
          case Servidor servidor:
            print('Modificar datos especificos del servidor: ');
            print('1- Modificar Sistema Operativo');
            print('2- Moodificar puertos');
            print('Que dato quieres modificar? ');
            int server = int.parse(stdin.readLineSync()!);
            switch (server) {
              case 1:
                print('Introduce el nuevo Sistema Operativo: ');
                servidor.sistemaOperativo = stdin.readLineSync()!;
                print('Sistema Operativo del servidor modificado!');
                print(servidor);
                break;
              case 2:
                print('Introduce nueva cantidad de puertos: ');
                servidor.puertos = int.parse(stdin.readLineSync()!);
                print('Puertos del servidor modificados!');
                print(servidor);
                break;
              default:
                print('Eleccion no disponible');
                break;
            }
            break;
        }
      default:
        print('Eleccion no disponible!');
        break;
    }
  } while (menu != 0);
}

//Metodo para buscar los dispositivos ID
bool buscarPorId(String id) {
  return dispositivos.containsKey(id.toUpperCase());
}
