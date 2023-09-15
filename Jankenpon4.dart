// Mariana Osorio Rojas 464679

import 'dart:io';
import 'dart:math';

enum Option { rock, paper, scissors }

class Player {
  String name;
  int id;
  int wins = 0;
  int losses = 0;
  int ties = 0;

  Player(this.name, this.id);
}

void main() {
  print('BIENVENIDO AL JUEGO DE PIEDRA PAPEL Y TIJERA \n');

  // Pedir al usuario que ingrese el número de jugadores
  stdout.write('Ingrese el número de jugadores: ');
  int numPlayers = int.parse(stdin.readLineSync()!);

  // Crear una lista de jugadores
  List<Player> players = [];
  for (int i = 0; i < numPlayers; i++) {
    stdout.write('Ingrese el nombre del jugador ${i + 1}: ');
    String playerName = stdin.readLineSync()!;
    players.add(Player(playerName, i + 1));
  }

  // Pedir al usuario que ingrese el número de rondas
  stdout.write('Ingrese el número de rondas: ');
  int numRounds = int.parse(stdin.readLineSync()!);

  // Iniciar el juego
  int currentRound = 1;
  while (currentRound <= numRounds) {
    print('\nRonda $currentRound:\n');

    // Pedir a cada jugador que elija una opción
    for (Player player in players) {
      stdout.write('${player.name}, elija piedra, papel o tijeras: ');
      var options;
      Option playerChoice =
          Option.values[options.indexOf(stdin.readLineSync()!.toLowerCase())];
      Option computerChoice = Option.values[Random().nextInt(3)];
      print('${player.name} ha elegido $playerChoice');
      print('El programa ha elegido $computerChoice');

      // Determinar el resultado de la ronda
      if (playerChoice == computerChoice) {
        print('Empate');
        player.ties++;
      } else if (playerChoice == Option.rock &&
              computerChoice == Option.scissors ||
          playerChoice == Option.paper && computerChoice == Option.rock ||
          playerChoice == Option.scissors && computerChoice == Option.paper) {
        print('${player.name} ha ganado');
        player.wins++;
      } else {
        print('${player.name} ha perdido');
        player.losses++;
      }
    }

    currentRound++;
  }

  // Imprimir los resultados finales
  print('\nResultados finales:\n');
  for (Player player in players) {
    print('${player.name} (ID ${player.id}):');
    print('Victorias: ${player.wins}');
    print('Derrotas: ${player.losses}');
    print('Empates: ${player.ties}\n');
  }
}
