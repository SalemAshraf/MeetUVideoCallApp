// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, use_build_context_synchronously, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetu/Resources/GoogleAuth.dart';
import 'package:meetu/Utils/colorsApp.dart';
import 'package:meetu/Widgets/ButtonUs.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleAuth googleAuth = GoogleAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 150, horizontal: 16),
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to MeetU',
                  style: GoogleFonts.rubik(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Make video calls to friends and family, or create and join meetings, all in one app',
                  style: GoogleFonts.rubik(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                CachedNetworkImage(
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    imageUrl:
                        'https://i.postimg.cc/xdq7Pqgw/Connected-world-cuate.png'),
                // Image.asset('assets/images/Connected world-cuate.png'),
                CustomButton(
                  text: 'Join a Meeting',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/HomePage');
                  },
                  color: Colors.white,
                  bgColor: footerColor,
                ),
                CustomButton(
                  text: 'Sign Up With Google',
                  onPressed: () {
                    googleAuth.SignIn(context);
                    //Navigator.of(context).pushNamed('/HomePage');
                  },
                  color: Colors.black,
                  bgColor: buttonColor,
                )
              ]),
        ),
      ),
    );
  }
}
