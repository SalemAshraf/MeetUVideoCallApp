// // ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_key_in_widget_constructors, unused_local_variable, avoid_print, use_build_context_synchronously

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:meetu/Resources/GoogleAuth.dart';
// import 'package:meetu/Screens/HomePage.dart';
// import 'package:meetu/Screens/LoginPage.dart';
// import 'package:meetu/firebase_options.dart';
// import 'package:provider/provider.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   await dotenv.load(fileName: '.env');
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarIconBrightness: Brightness.dark));
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//           ChangeNotifierProvider.value(
//             value: GoogleAuth(),
//           ),
//         ],
//       child: MaterialApp(
//         title: 'MeetU',
//         debugShowCheckedModeBanner: false,
//         routes: {
//           '/LoginPage': (context) => LoginPage(),
//           '/HomePage': (context) => HomePage()
//         },
//         home: StreamBuilder(
//           stream: GoogleAuth().authChanges,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             if (snapshot.hasData) {
//               return HomePage();
//             }
//             return LoginPage();
//           },
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_key_in_widget_constructors, unused_local_variable, avoid_print, use_build_context_synchronously

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meetu/Resources/GoogleAuth.dart';
import 'package:meetu/Screens/HomePage.dart';
import 'package:meetu/Screens/LoginPage.dart';
import 'package:meetu/firebase_options.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: '.env');
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: GoogleAuth(),
        ),
      ],
      child: MaterialApp(
        title: 'MeetU',
        debugShowCheckedModeBanner: false,
        routes: {
          '/LoginPage': (context) => LoginPage(),
          '/HomePage': (context) => HomePage()
        },
        home: StreamBuilder(
          stream: GoogleAuth().authChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return HomePage();
            }
            return LoginPage();
          },
        ),
      ),
    );
  }
}

// Generate userId with 6 digit length
// Generate conferenceId with 10 digit length
final String userId = Random().nextInt(900000 + 100000).toString();
final String randomConferenceId =
    (Random().nextInt(1000000000) * 10 + Random().nextInt(10))
        .toString()
        .padLeft(10, '0');
