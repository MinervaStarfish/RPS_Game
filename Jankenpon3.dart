import 'dart:io';
import 'dart:math';

var host;

// Opciones de juego
enum OptionsRPS {
  PIEDRA, // [0]
  PAPEL, // [1]
  TIJERAS, // [2]
}

enum ResultadosRPS {
  GANA, // [0]
  PIERDE, // [1]
  EMPATA, // [2]
}

// USAMOS UN MAP PARA GUARDAR LOS ENUMS QUE PONE EL USUARIO
// OptionsRPS nombre= OptionsRPS.piedra; -> esto lo guardamos en un map porque van a ser varias rondas
void main() {
  // INFORMACIÓN PARTICIPANTES
  // 1. Preguntar al usuario la cantidad de participantes
  print("Ingrese la cantidad de participantes:");
  var numPlayers = int.parse(stdin.readLineSync()!);

  // 2. Crear una lista vacía para almacenar los mapas de cada participante
  var listaParticipantes = <Map<String, dynamic>>[];

  // 3. Iniciar un bucle para pedir la información de cada participante
  for (var i = 0; i < numPlayers; i++) {
    // 4. Pedir al usuario que ingrese la información del participante
    print("Ingrese el ID del participante ${i + 1}:");
    var id = stdin.readLineSync()!;
    print("Ingrese el nombre del participante ${i + 1}:");
    var nombre = stdin.readLineSync()!;

    // 5. Almacenar la información del participante en un mapa
    var participante = {
      'id': id,
      'nombre': nombre,
      'victorias': 0,
      'derrotas': 0,
      'empates': 0,
    };

    // 6. Agregar el mapa de participante a la lista de participantes
    listaParticipantes.add(participante);
  }

  // 7. Imprimir la lista de participantes
  print("Lista de participantes:");
  for (var participante in listaParticipantes) {
    print(
        "Nombre: ${participante['nombre']}, ID: ${participante['id']}, Edad: ${participante['edad']}");
  }

  // Simulación del juego
  print('Simulando...');
  print('');

  // Pregutamos por la catidad de jugadas
  print('Ingrese el número de veces que desea jugar:');
  int numJuegos = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < numJuegos; i++) {
    print('Juego ${i + 1}:');
    
  }
}

void userChoiceRPS() {
  print('Ingresar su elección');
  String? eleccion = stdin.readLineSync();
}

void machineChoiceRPS() {
  // int random = random.nextInt();
}

// Como relacioamos el enum y el maps de las userchoices : con un switch con 3
void asignarOptionsRPS() {}
