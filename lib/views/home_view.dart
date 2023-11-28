import 'package:flutter/material.dart';
import 'package:tic_tac_toe/views/auto_paly_view.dart';
import 'package:tic_tac_toe/views/manual_play_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World'.toString()),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Tic Tac Tae',
              style: TextStyle(
                fontSize: 52,
              ),
            ),
          ),
          Column(
            children: [
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 42),
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AutoPlayView.id);
                  },
                  icon: const Icon(Icons.android),
                  label: const Text(
                    'Auto Play',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 42),
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, ManualPlayView.id);
                  },
                  icon: const Icon(Icons.people),
                  label: const Text(
                    'Manual Play',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
              const SizedBox(
                height: 12,
              ),
            ],
          )
        ],
      ),
    );
  }
}
