import 'dart:io';
import 'dart:math';

enum Choice {
  Piedra,
  Papel,
  Tijeras,
}

class Player {
  final String nickname;
  final String id;

  Player(this.nickname, this.id);
}

class Game {
  final int rounds;
  final Player host;
  final List<Player> players;

  Game(this.rounds, this.host, this.players);

  void start() {
    print(
        '\n¡Bienvenido ${host.nickname}! Vamos a jugar piedra, papel o tijera.\n');

    final Map<String, Map<String, int>> scores = {};

    for (int i = 0; i < rounds; i++) {
      print('\n\n=== Ronda ${i + 1} ===\n');

      for (final player in players) {
        final choice = getPlayerChoice(player);
        final machineChoice = getMachineChoice();
        final result = getResult(choice, machineChoice);

        print('${player.nickname} escogió $choice\n');
        print('La máquina escogió $machineChoice\n');
        print('Resultado: $result\n');

        scores.putIfAbsent(
            player.id, () => {'wins': 0, 'losses': 0, 'ties': 0});

        if (result == 'Gana') {
          scores[player.id]!['wins']!;
        } else if (result == 'Pierde') {
          scores[player.id]!['losses']!;
        } else {
          scores[player.id]!['ties']!;
        }
      }
    }

    print('Resultados finales:\n');
    print('');

    for (final player in players) {
      print('${player.nickname}:');
      print('Victorias: ${scores[player.id]!['wins']}');
      print('Derrotas: ${scores[player.id]!['losses']}');
      print('Empates: ${scores[player.id]!['ties']}');
      print('');
    }
  }

  String getPlayerChoice(Player player) {
    String choice;

    do {
      print('${player.nickname}, ¿piedra, papel o tijera?');
      choice = stdin.readLineSync()!.toLowerCase();
    } while (choice != 'piedra' && choice != 'papel' && choice != 'tijera');

    return choice;
  }

  String getMachineChoice() {
    final random = Random();
    final index = random.nextInt(3);

    return Choice.values[index].toString().split('.').last;
  }

  String getResult(String choice, String machineChoice) {
    if (choice == machineChoice) {
      return 'Empata';
    } else if (choice == 'piedra' && machineChoice == 'tijera' ||
        choice == 'papel' && machineChoice == 'piedra' ||
        choice == 'tijera' && machineChoice == 'papel') {
      return 'Gana';
    } else {
      return 'Pierde';
    }
  }
}

//¿Cómo hago para obtener por entrada del usuario, sus nombres y sus id?
void main() {
  final host = Player('Juan', 'juan123');
  final players = [Player('Pedro', 'pedro456'), Player('Ana', 'ana789')];
  final game = Game(3, host, players);

  game.start();
}
