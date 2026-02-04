// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// import 'screens/video_feed_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'GishTube',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       home: const VideoFeedScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'screens/video_feed_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GishTube',
      theme: ThemeData(primarySwatch: Colors.red),

      // ✅ ROUTES FOR NAVIGATION
      routes: {
        "/videos": (_) => const VideoFeedScreen(),
        "/login": (_) => const LoginScreen(),
        "/signup": (_) => const SignupScreen(),
      },

      // ✅ START APP ON VIDEO SCREEN
      home: const VideoFeedScreen(),
    );
  }
}
