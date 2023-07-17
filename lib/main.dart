import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Random random = Random();
  int guess = 0;
  int winningNumber = 4;

  bool flag = false;

  String message = "Tap to Guess!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Guess Game")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 250,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        flag
                            ? const Icon(
                                Icons.done_all,
                                color: Colors.green,
                                size: 35,
                              )
                            : const Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 35,
                              ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'You Guessed $guess.',
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        flag
                            ? Text(
                                message,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(message,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          guess = int.parse(random.nextInt(10).toString());

          if (guess == winningNumber) {
            message = "You Won!";
            flag = true;
          } else {
            message = "You Lost, Try Again!";
            flag = false;
          }

          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
