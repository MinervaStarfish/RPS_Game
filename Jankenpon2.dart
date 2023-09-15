import 'dart:io';
import 'dart:math';

enum Choice {
  Piedra,
  Papel,
  Tijeras,
}

var nombre;
var id;
var host;
var rounds;
var participantes;
var resultado; // Debería hacerla como una lista para cada persona para poder elegir cuál ver

void main(List<String> args) {
  stdout.write('Ingrese el nombre del host de la partida: ');
  host = stdin.readLineSync();
  stdout.write('Ingrese la cantidad de rouds que desea jugar: ');
  rounds = stdin.readLineSync();
  print(players());
  print(nombre);
  print(id);
}

// Función para la cantidad  de participantes, los nombres y los ID
List<Map<String, String>> players() {
  // Preguntar la cantidad de participantes
  stdout.write('Ingrese la cantidad de participantes: ');
  var cantidad = int.parse(stdin.readLineSync()!);

  // Crear la lista vacía de participantes
  participantes = <Map<String, String>>[]; //Usamos un map

  // Preguntar el nombre y el ID de cada participante
  for (var i = 1; i <= cantidad; i++) {
    stdout.write(
        'Ingrese el nombre y el ID del participante ${i + 1} separados por una coma: ');
    var input = stdin.readLineSync()!;
    var values = input.split(',');
    nombre = values[0].trim();
    id = values[1].trim();

    participantes.add({
      'Nombre': nombre,
      'ID': id,
    });
  }

  // Imprimir la lista de participantes
  return (participantes);
}

void start() {
  print('\n¡Bienvenido $host! Vamos a jugar piedra, papel o tijera.\n');
  for (int i = 0; i < rounds; i++) {
    print('\n\n=== Ronda ${i + 1} ===\n');

    for (int j = 0; j = participantes.length; j++) {
      print(
          'El participante ${participantes[j]} escogió: '); // DEBO AÑADIR MI ELECCIÓN DADA POR CONSOLA
      print('La máquina escogió '); // DEBO AÑADIR LA ELECCIÓN DE LA MÁQUINA
      print('Resultado: '); // DEBO AÑADIR EL RESULTADO
    }
  }
}

String? getPlayerChoice() {
  String choice;
  for (int j = 0; j = participantes.length; j++) {
    do {
      print('${participantes[j]}, ¿piedra, papel o tijera?');
      choice = stdin.readLineSync()!.toLowerCase();
    } while (choice != 'piedra' && choice != 'papel' && choice != 'tijera');

    return choice;
  }
}
