// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/Pages/home_page.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 29, 59),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'TIC TAC TOE',
                  style: GoogleFonts.lato(
                    fontSize: 42,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: const Color.fromARGB(255, 218, 219, 189),
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 2,
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 103, 161, 124),
                radius: 160,
                child: Image(
                  image: AssetImage('img/tic-tac-toe.png'),
                  color: Color.fromARGB(255, 218, 219, 189),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: const Color.fromARGB(255, 103, 161, 124),
                      child: Center(
                        child: Text(
                          'PLAY',
                          style: GoogleFonts.lato(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            color: const Color.fromARGB(255, 218, 219, 189),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
