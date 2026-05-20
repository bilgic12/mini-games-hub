import 'package:flutter/material.dart';
import 'games/guess_number_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Games Hub',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Arial',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> games = const [
    {
      "title": "Guess Number",
      "icon": Icons.numbers,
    },
    {
      "title": "Rock Paper Scissors",
      "icon": Icons.back_hand,
    },
    {
      "title": "Math Game",
      "icon": Icons.calculate,
    },
    {
      "title": "Memory Game",
      "icon": Icons.psychology,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff141E30),
              Color(0xff243B55),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              children: [

                const SizedBox(height: 20),

                const Text(
                  "MINI GAMES HUB",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Choose your game",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 30),

                Expanded(
                  child: GridView.builder(
                    itemCount: games.length,

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                    ),

                    itemBuilder: (context, index) {

                      return GestureDetector(

                        onTap: () {

                          if (games[index]["title"] ==
                              "Guess Number") {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const GuessNumberScreen(),
                              ),
                            );
                          }
                        },

                        child: Container(

                          decoration: BoxDecoration(

                            borderRadius:
                                BorderRadius.circular(25),

                            gradient: LinearGradient(
                              colors: [
                                Colors.deepPurple.shade400,
                                Colors.blue.shade400,
                              ],
                            ),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.4),
                                blurRadius: 12,
                                spreadRadius: 2,
                              ),
                            ],
                          ),

                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center,

                            children: [

                              Icon(
                                games[index]["icon"],
                                size: 55,
                              ),

                              const SizedBox(height: 15),

                              Text(
                                games[index]["title"],

                                textAlign: TextAlign.center,

                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}