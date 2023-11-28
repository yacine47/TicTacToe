import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/player_model.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {super.key, required this.onPressed, required this.winnerPlayer});
  final VoidCallback? onPressed;
  final String winnerPlayer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 42,
        ),
        const Text(
          'The Winner is : ',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 78,
        ),
        Text(
          winnerPlayer,
          style: const TextStyle(
            fontSize: 88,
          ),
        ),
        const SizedBox(
          height: 78,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: onPressed,
          child: const Text('Restart Game'),
        )
      ],
    );
  }
}
