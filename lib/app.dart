import 'package:flutter/material.dart';
import 'screens/video_feed_screen.dart';

class GishTubeApp extends StatelessWidget {
  const GishTubeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GishTube',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const VideoFeedScreen(),
    );
  }
}
