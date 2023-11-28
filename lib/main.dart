import 'package:flutter/material.dart';
import 'package:tic_tac_toe/views/auto_paly_view.dart';
import 'package:tic_tac_toe/views/home_view.dart';
import 'package:tic_tac_toe/views/manual_play_view.dart';

void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: HomeView.id,
      routes: {
        HomeView.id: (context) => const HomeView(),
        AutoPlayView.id: (context) => const AutoPlayView(),
        ManualPlayView.id: (context) => const ManualPlayView(),
      },
    );
  }
}
