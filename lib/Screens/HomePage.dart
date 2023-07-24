// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetu/Resources/GoogleAuth.dart';
import 'package:meetu/Screens/MeetPage.dart';
import 'package:meetu/Utils/colorsApp.dart';
import 'package:meetu/Widgets/ButtonUs.dart';

final String randomRoomId =
    (Random().nextInt(1000000000) * 10 + Random().nextInt(10))
        .toString()
        .padLeft(10, '0');

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GoogleAuth googleAuth = GoogleAuth();
  final TextEditingController roomIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                googleAuth.signOut();
              },
              icon: Icon(
                Icons.login_rounded,
                color: Colors.black,
              ))
        ],
        title: Text(
          'Let\'s Go',
          style: GoogleFonts.rubik(
            fontSize: 22,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextFormField(
                cursorColor: Colors.black,
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: roomIdController,
                decoration: InputDecoration(
                    labelStyle: GoogleFonts.rubik(fontSize: 12),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black)),
                    hintText: 'Enter Room ID',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            CustomButton(
              text: 'Join a Meeting Now',
              onPressed: () => GoToMeetingPage(
                context,
                text: roomIdController.text,
              ),
              color: Colors.white,
              bgColor: footerColor,
            ),
            CustomButton(
              text: 'Sign Up With Google',
              onPressed: () => GoToMeetingPage(
                context,
                text: randomRoomId,
              ),
              color: Colors.black,
              bgColor: buttonColor,
            ),
          ],
        ),
      ),
    );
  }

  GoToMeetingPage(BuildContext context, {required String text}) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MettingPage(roomId: text),
        ));
  }
}
