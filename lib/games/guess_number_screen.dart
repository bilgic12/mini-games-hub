import 'dart:math';
import 'package:flutter/material.dart';

class GuessNumberScreen extends StatefulWidget {
  const GuessNumberScreen({super.key});

  @override
  State<GuessNumberScreen> createState() =>
      _GuessNumberScreenState();
}

class _GuessNumberScreenState
    extends State<GuessNumberScreen> {

  final TextEditingController controller =
      TextEditingController();

  int secretNumber = Random().nextInt(100) + 1;

 String message = "Guess a number between 1-100";

  void checkGuess() {

    if (controller.text.isEmpty) return;

    int guess = int.parse(controller.text);

    setState(() {

      if (guess == secretNumber) {
        message = "You Win 🎉";
      }
      else if (guess < secretNumber) {
        message = "Higher ⬆";
      }
      else {
        message = "Lower ⬇";
      }
    });

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text("Guess Number"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [

            Text(
              message,
              style: const TextStyle(
                fontSize: 26,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            TextField(
              controller: controller,
              keyboardType:
                  TextInputType.number,
              decoration: InputDecoration(
                hintText: "Tahmin gir",
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: checkGuess,
              child: const Text(
                "guess",
              ),
            ),
          ],
        ),
      ),
    );
  }
}