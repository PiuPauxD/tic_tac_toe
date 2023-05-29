// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool onTurn = true;
  List<String> displayExOh = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  int onScore = 0;
  int exScore = 0;
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 29, 59),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                  Text(
                    'Scoreboard',
                    style: GoogleFonts.lato(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 218, 219, 189),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Player X',
                              style: GoogleFonts.lato(
                                fontSize: 24,
                                fontStyle: FontStyle.italic,
                                color: Color.fromARGB(255, 218, 219, 189),
                              ),
                            ),
                            Text(
                              exScore.toString(),
                              style: GoogleFonts.lato(
                                fontSize: 24,
                                fontStyle: FontStyle.italic,
                                color: Color.fromARGB(255, 218, 219, 189),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Player O',
                              style: GoogleFonts.lato(
                                fontSize: 24,
                                fontStyle: FontStyle.italic,
                                color: Color.fromARGB(255, 218, 219, 189),
                              ),
                            ),
                            Text(
                              onScore.toString(),
                              style: GoogleFonts.lato(
                                fontSize: 24,
                                fontStyle: FontStyle.italic,
                                color: Color.fromARGB(255, 218, 219, 189),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (() {
                    _tapped(index);
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 218, 219, 189),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        displayExOh[index],
                        style: TextStyle(
                          color: Color.fromARGB(255, 216, 33, 72),
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'TIC TAC TOE',
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 218, 219, 189),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (onTurn && displayExOh[index] == '') {
        displayExOh[index] = 'O';
        filledBoxes += 1;
      } else if (!onTurn && displayExOh[index] == '') {
        displayExOh[index] = 'X';
        filledBoxes += 1;
      }
      onTurn = !onTurn;
      _winner();
    });
  }

  void _winner() {
    //1st row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _dialogWinner(displayExOh[0]);
    }

    //2nd row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _dialogWinner(displayExOh[3]);
    }

    //3rd row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _dialogWinner(displayExOh[6]);
    }
    //1st column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _dialogWinner(displayExOh[0]);
    }
    //2nd column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _dialogWinner(displayExOh[1]);
    }
    //3rd column
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _dialogWinner(displayExOh[2]);
    }
    //show diagonal
    if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != '') {
      _dialogWinner(displayExOh[6]);
    }
    //show diagonal
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _dialogWinner(displayExOh[0]);
    } else if (filledBoxes == 9) {
      _drawDialog();
    }
  }

  void _drawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text('DRAW'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
              child: Text('Play Again!'),
            ),
          ],
        );
      },
    );
  }

  void _dialogWinner(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text('Winner is: $winner'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
              child: Text('Play Again!'),
            ),
          ],
        );
      },
    );
    if (winner == 'O') {
      onScore += 1;
    } else if (winner == 'X') {
      exScore += 1;
    }
    _clearBoard();
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
    });
    filledBoxes = 0;
  }
}
