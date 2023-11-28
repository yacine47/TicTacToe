import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/player_model.dart';
import 'package:tic_tac_toe/widgets/custom_bottom_sheet.dart';

import '../models/game_button.dart';

class ManualPlayView extends StatefulWidget {
  const ManualPlayView({super.key});
  static String id = 'ManualPlayView';

  @override
  State<ManualPlayView> createState() => _ManualPlayViewState();
}

class _ManualPlayViewState extends State<ManualPlayView> {
  final random = Random();
  String? winner;
  bool endGame = false;
  int counter = 0;
  String turn = "X";
  List<GameButton> listButtons = <GameButton>[
    GameButton(),
    GameButton(),
    GameButton(),
    GameButton(),
    GameButton(),
    GameButton(),
    GameButton(),
    GameButton(),
    GameButton(),
  ];

  List<PlayerModel> listPlayer = [
    PlayerModel(playerName: 'A', score: 0),
    PlayerModel(playerName: 'B', score: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World'.toString()),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0),
                itemCount: listButtons.length,
                itemBuilder: (context, index) {
                  return TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        backgroundColor: listButtons[index].clr),
                    onPressed: () {
                      counter++;
                      setState(() {
                        if (!listButtons[index].played!) {
                          listButtons[index].played = true;

                          listButtons[index].play = turn;

                          if (turn == 'X') {
                            turn = 'O';
                            listButtons[index].clr = Colors.red;
                          } else {
                            turn = 'X';
                            listButtons[index].clr = Colors.blue;
                          }
                          checkWinA();

                          if (endGame == false) {
                            checkWinB();
                          }
                        }
                      });
                    },
                    child: Text(
                      listButtons[index].play!,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 78,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    listPlayer[0].playerName,
                    style: const TextStyle(fontSize: 78),
                  ),
                  Text(
                    listPlayer[0].score.toString(),
                    style: const TextStyle(
                      fontSize: 56,
                    ),
                  )
                ],
              ),
              const Text(
                '-',
                style: TextStyle(fontSize: 78),
              ),
              Column(
                children: [
                  Text(
                    listPlayer[1].playerName,
                    style: const TextStyle(fontSize: 78),
                  ),
                  Text(
                    listPlayer[1].score.toString(),
                    style: const TextStyle(
                      fontSize: 56,
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 78,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[800],
        onPressed: () {
          restartGame();
        },
        child: const Text("click"),
      ),
    );
  }

  void restartGame() {
    turn = "X";
    counter = 0;
    for (int i = 0; i < listButtons.length; i++) {
      listButtons[i].clr = Colors.blueGrey;
      listButtons[i].played = false;
      listButtons[i].play = "";
    }
    setState(() {});
  }

  void playBoot() {
    GameButton player = listButtons[random.nextInt(listButtons.length)];
    if (player.play == "") {
      player.clr = Colors.blue;
      player.play = turn;
      player.played = true;
      turn = "X";
      setState(() {});
    } else {
      playBoot();
    }
  }

  void checkWinA() {
    if (listButtons[0].play == "X" &&
            listButtons[1].play == "X" &&
            listButtons[2].play == "X" ||
        listButtons[3].play == "X" &&
            listButtons[4].play == "X" &&
            listButtons[5].play == "X" ||
        listButtons[6].play == "X" &&
            listButtons[7].play == "X" &&
            listButtons[8].play == "X" ||
        listButtons[0].play == "X" &&
            listButtons[3].play == "X" &&
            listButtons[6].play == "X" ||
        listButtons[1].play == "X" &&
            listButtons[4].play == "X" &&
            listButtons[7].play == "X" ||
        listButtons[2].play == "X" &&
            listButtons[5].play == "X" &&
            listButtons[8].play == "X" ||
        listButtons[0].play == "X" &&
            listButtons[4].play == "X" &&
            listButtons[8].play == "X" ||
        listButtons[2].play == "X" &&
            listButtons[4].play == "X" &&
            listButtons[6].play == "X") {
      winner = listPlayer[0].playerName;
      listPlayer[0].score++;
      endGame = true;
      showModalBottomSheet(
        context: context,
        builder: (context) => CustomBottomSheet(
          winnerPlayer: winner!,
          onPressed: () {
            Navigator.pop(context);
            restartGame();
          },
        ),
      );
    }
  }

  void checkWinB() {
    if (listButtons[0].play == "O" &&
            listButtons[1].play == "O" &&
            listButtons[2].play == "O" ||
        listButtons[3].play == "O" &&
            listButtons[4].play == "O" &&
            listButtons[5].play == "O" ||
        listButtons[6].play == "O" &&
            listButtons[7].play == "O" &&
            listButtons[8].play == "O" ||
        listButtons[0].play == "O" &&
            listButtons[3].play == "O" &&
            listButtons[6].play == "O" ||
        listButtons[1].play == "O" &&
            listButtons[4].play == "O" &&
            listButtons[7].play == "O" ||
        listButtons[2].play == "O" &&
            listButtons[5].play == "O" &&
            listButtons[8].play == "O" ||
        listButtons[0].play == "O" &&
            listButtons[4].play == "O" &&
            listButtons[8].play == "O" ||
        listButtons[2].play == "O" &&
            listButtons[4].play == "O" &&
            listButtons[6].play == "O") {
      winner = listPlayer[1].playerName;
      listPlayer[1].score++;
      showModalBottomSheet(
        context: context,
        builder: (context) => CustomBottomSheet(
          winnerPlayer: winner!,
          onPressed: () {
            Navigator.pop(context);
            restartGame();
          },
        ),
      );
    }
  }
}
