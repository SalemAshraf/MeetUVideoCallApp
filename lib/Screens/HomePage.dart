// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetu/Resources/GoogleAuth.dart';
import 'package:meetu/Screens/MeetPage.dart';
import 'package:meetu/main.dart';

final String randomRoomId =
    (Random().nextInt(1000000000) * 10 + Random().nextInt(10))
        .toString()
        .padLeft(10, '0');

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController conferenceIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(500),
                        child: Image.network(
                          GoogleAuth().user.photoURL ?? '',
                          width: 40,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome!',
                            style: GoogleFonts.rubik(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            '${GoogleAuth().user.displayName}',
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.settings)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black12)),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.amber[50],
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.amber[100],
                        ),
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.amber[200],
                        ),
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.amber[300],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daily StandUp',
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Your last meeting is still in progress',
                          style: GoogleFonts.rubik(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          'ReJoin',
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Evolving with our Business',
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            '10 Feb 2023, 12:10 PM',
                            style: GoogleFonts.rubik(
                              fontSize: 14,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.more_vert_outlined)
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Facing the Future - Together',
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            '09 April 2023, 05:15 PM',
                            style: GoogleFonts.rubik(
                              fontSize: 14,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.more_vert_outlined)
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Next Generation Leadership',
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            '04 Sep 2023, 11:05 PM',
                            style: GoogleFonts.rubik(
                              fontSize: 14,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.more_vert_outlined)
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Success through Synergy',
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            '25 Mar 2023, 10:10 PM',
                            style: GoogleFonts.rubik(
                              fontSize: 14,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.more_vert_outlined)
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  )
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: const Size(
                      double.infinity,
                      50,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Join a Meeting Now',
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () => _show(context)),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(
                    double.infinity,
                    50,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Make a New Meeting',
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                onPressed: () => jumpToMeetingPage(
                  context,
                  conferenceId: randomConferenceId,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  // Go to Meeting Page
  jumpToMeetingPage(BuildContext context, {required String conferenceId}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoConferencePage(
          conferenceID: conferenceId,
        ),
      ),
    );
  }

  void _show(BuildContext ctx) {
    showModalBottomSheet(
      elevation: 0,
      context: ctx,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      builder: (ctx) => Container(
        width: 300,
        height: 250,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                cursorColor: Colors.black,
                // maxLength: 10,
                keyboardType: TextInputType.number,
                controller: conferenceIdController,
                decoration: InputDecoration(
                    labelStyle: GoogleFonts.rubik(fontSize: 12),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black)),
                    hintText: 'Enter Meeting ID',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  minimumSize: const Size(
                    double.infinity,
                    50,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Join a Meeting Now',
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                onPressed: () => jumpToMeetingPage(
                  context,
                  conferenceId: conferenceIdController.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
