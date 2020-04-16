import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_handling/providers/dog_notifier.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 24),
            const Text("DogApi"),
            const SizedBox(height: 24),
            const Text("DogNotifier"),
            const SizedBox(height: 24),
            RaisedButton(
              onPressed: () => Provider.of<DogNotifier>(context, listen: false).fetchDog(),
              child: const Text("FETCH"),
            ),
            Consumer<DogNotifier>(
              builder: (context, dogNotifier, _) {
                return Image.network(
                  dogNotifier.dog.image,
                  gaplessPlayback: true,
                  height: 400,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
