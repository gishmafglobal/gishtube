// // // // import 'package:flutter/material.dart';
// // // // import 'package:gishtube/screens/video_library_screen.dart';
// // // // import '../services/tmdb_service.dart';
// // // // import '../services/background_music.dart';
// // // // import '../services/auth_service.dart';
// // // // import 'login_screen.dart';
// // // // import 'video_player_screen.dart';

// // // // class VideoFeedScreen extends StatefulWidget {
// // // //   const VideoFeedScreen({super.key});

// // // //   @override
// // // //   State<VideoFeedScreen> createState() => _VideoFeedScreenState();
// // // // }

// // // // class _VideoFeedScreenState extends State<VideoFeedScreen> {
// // // //   late Future<List<dynamic>> featured;
// // // //   late Future<List<dynamic>> action;
// // // //   late Future<List<dynamic>> comedy;
// // // //   late Future<List<dynamic>> horror;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();

// // // //     featured = TmdbService.fetchTrending();
// // // //     action = TmdbService.fetchByGenre(28);
// // // //     comedy = TmdbService.fetchByGenre(35);
// // // //     horror = TmdbService.fetchByGenre(27);

// // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // //       BackgroundMusic.play();
// // // //     });
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     BackgroundMusic.stop();
// // // //     super.dispose();
// // // //   }

// // // //   /// 🔐 Require login before playing video
// // // //   // void _requireLoginAndPlay() async {
// // // //   //   BackgroundMusic.pause();

// // // //   //   Navigator.push(
// // // //   //     context,
// // // //   //     MaterialPageRoute(builder: (_) => const LoginScreen()),
// // // //   //   ).then((_) async {
// // // //   //     // After login screen closes
// // // //   //     if (await AuthService.isLoggedIn()) {
// // // //   //       Navigator.push(
// // // //   //         context,
// // // //   //         MaterialPageRoute(
// // // //   //           builder: (_) => const VideoPlayerScreen(
// // // //   //             videoUrl:
// // // //   //                 "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
// // // //   //           ),
// // // //   //         ),
// // // //   //       ).then((_) => BackgroundMusic.play());
// // // //   //     } else {
// // // //   //       BackgroundMusic.play();
// // // //   //     }
// // // //   //   });
// // // //   // }
// // // //   void _requireLoginAndOpenLibrary() async {
// // // //   BackgroundMusic.pause();

// // // //   Navigator.push(
// // // //     context,
// // // //     MaterialPageRoute(builder: (_) => const LoginScreen()),
// // // //   ).then((_) async {
// // // //     if (await AuthService.isLoggedIn()) {
// // // //       Navigator.push(
// // // //         context,
// // // //         MaterialPageRoute(
// // // //           builder: (_) => const VideoLibraryScreen(),
// // // //         ),
// // // //       ).then((_) => BackgroundMusic.play());
// // // //     } else {
// // // //       BackgroundMusic.play();
// // // //     }
// // // //   });
// // // // }

// // // //   /// 🚪 Logout
// // // //   void _logout() async {
// // // //     await AuthService.signOut();

// // // //     ScaffoldMessenger.of(
// // // //       context,
// // // //     ).showSnackBar(const SnackBar(content: Text("Logged out successfully")));
// // // //   }

// // // //   /// 🎬 HERO BANNER
// // // //   Widget _heroBanner() {
// // // //     return FutureBuilder<List<dynamic>>(
// // // //       future: featured,
// // // //       builder: (context, snapshot) {
// // // //         if (!snapshot.hasData) {
// // // //           return const SizedBox(
// // // //             height: 420,
// // // //             child: Center(child: CircularProgressIndicator()),
// // // //           );
// // // //         }

// // // //         final movie = snapshot.data!.first;
// // // //         final image = movie['backdrop_path'] ?? movie['poster_path'];

// // // //         return GestureDetector(
// // // //           onTap: _requireLoginAndPlay,
// // // //           child: Stack(
// // // //             children: [
// // // //               SizedBox(
// // // //                 height: 420,
// // // //                 width: double.infinity,
// // // //                 child: Image.network(
// // // //                   TmdbService.imageUrl(image),
// // // //                   fit: BoxFit.cover,
// // // //                 ),
// // // //               ),
// // // //               Container(
// // // //                 height: 420,
// // // //                 decoration: BoxDecoration(
// // // //                   gradient: LinearGradient(
// // // //                     begin: Alignment.topCenter,
// // // //                     end: Alignment.bottomCenter,
// // // //                     colors: [
// // // //                       Colors.transparent,
// // // //                       Colors.black.withOpacity(0.85),
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //               Positioned(
// // // //                 bottom: 30,
// // // //                 left: 20,
// // // //                 right: 20,
// // // //                 child: Column(
// // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // //                   children: [
// // // //                     Text(
// // // //                       movie['title'] ?? '',
// // // //                       style: const TextStyle(
// // // //                         color: Colors.white,
// // // //                         fontSize: 26,
// // // //                         fontWeight: FontWeight.bold,
// // // //                       ),
// // // //                     ),
// // // //                     const SizedBox(height: 12),
// // // //                     ElevatedButton.icon(
// // // //                       style: ElevatedButton.styleFrom(
// // // //                         backgroundColor: Colors.redAccent,
// // // //                       ),
// // // //                       onPressed: _requireLoginAndPlay,
// // // //                       icon: const Icon(Icons.play_arrow),
// // // //                       label: const Text("Play"),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         );
// // // //       },
// // // //     );
// // // //   }

// // // //   /// 🎞 MOVIE ROW
// // // //   Widget _movieRow(String title, Future<List<dynamic>> future) {
// // // //     return Column(
// // // //       crossAxisAlignment: CrossAxisAlignment.start,
// // // //       children: [
// // // //         Padding(
// // // //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// // // //           child: Text(
// // // //             title,
// // // //             style: const TextStyle(
// // // //               color: Colors.white,
// // // //               fontSize: 20,
// // // //               fontWeight: FontWeight.bold,
// // // //             ),
// // // //           ),
// // // //         ),
// // // //         SizedBox(
// // // //           height: 210,
// // // //           child: FutureBuilder<List<dynamic>>(
// // // //             future: future,
// // // //             builder: (context, snapshot) {
// // // //               if (!snapshot.hasData) {
// // // //                 return const Center(child: CircularProgressIndicator());
// // // //               }

// // // //               return ListView.builder(
// // // //                 scrollDirection: Axis.horizontal,
// // // //                 padding: const EdgeInsets.symmetric(horizontal: 12),
// // // //                 itemCount: snapshot.data!.length,
// // // //                 itemBuilder: (_, i) {
// // // //                   final movie = snapshot.data![i];
// // // //                   final poster = movie['poster_path'];

// // // //                   if (poster == null) return const SizedBox(width: 140);

// // // //                   return GestureDetector(
// // // //                     onTap: _requireLoginAndPlay,
// // // //                     child: Container(
// // // //                       width: 140,
// // // //                       margin: const EdgeInsets.symmetric(horizontal: 6),
// // // //                       child: ClipRRect(
// // // //                         borderRadius: BorderRadius.circular(10),
// // // //                         child: Image.network(
// // // //                           TmdbService.imageUrl(poster),
// // // //                           fit: BoxFit.cover,
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                   );
// // // //                 },
// // // //               );
// // // //             },
// // // //           ),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: const Color(0xFF121212),
// // // //       appBar: AppBar(
// // // //         backgroundColor: Colors.black,
// // // //         title: Row(
// // // //           children: [
// // // //             Image.asset("assets/gishtube_logo.png", height: 28),
// // // //             const SizedBox(width: 8),
// // // //             const Text(
// // // //               "GishTube",
// // // //               style: TextStyle(fontWeight: FontWeight.bold),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //         actions: [
// // // //           IconButton(onPressed: _logout, icon: const Icon(Icons.logout)),
// // // //         ],
// // // //       ),
// // // //       body: ListView(
// // // //         children: [
// // // //           _heroBanner(),
// // // //           _movieRow("🔥 Trending Now", featured),
// // // //           _movieRow("🎬 Action Movies", action),
// // // //           _movieRow("😂 Comedy Hits", comedy),
// // // //           _movieRow("😱 Horror Picks", horror),
// // // //           const SizedBox(height: 30),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:gishtube/screens/video_library_screen.dart';
// // // import '../services/tmdb_service.dart';
// // // import '../services/background_music.dart';
// // // import '../services/auth_service.dart';
// // // import 'login_screen.dart';

// // // class VideoFeedScreen extends StatefulWidget {
// // //   const VideoFeedScreen({super.key});

// // //   @override
// // //   State<VideoFeedScreen> createState() => _VideoFeedScreenState();
// // // }

// // // class _VideoFeedScreenState extends State<VideoFeedScreen> {
// // //   late Future<List<dynamic>> featured;
// // //   late Future<List<dynamic>> action;
// // //   late Future<List<dynamic>> comedy;
// // //   late Future<List<dynamic>> horror;

// // //   @override
// // //   void initState() {
// // //     super.initState();

// // //     featured = TmdbService.fetchTrending();
// // //     action = TmdbService.fetchByGenre(28);
// // //     comedy = TmdbService.fetchByGenre(35);
// // //     horror = TmdbService.fetchByGenre(27);

// // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // //       BackgroundMusic.play();
// // //     });
// // //   }

// // //   @override
// // //   void dispose() {
// // //     BackgroundMusic.stop();
// // //     super.dispose();
// // //   }

// // //   /// 🔐 Require login → Open Video Library
// // //   void _requireLoginAndOpenLibrary() async {
// // //     BackgroundMusic.pause();

// // //     Navigator.push(
// // //       context,
// // //       MaterialPageRoute(builder: (_) => const LoginScreen()),
// // //     ).then((_) async {
// // //       if (await AuthService.isLoggedIn()) {
// // //         Navigator.push(
// // //           context,
// // //           MaterialPageRoute(builder: (_) => const VideoLibraryScreen()),
// // //         ).then((_) => BackgroundMusic.play());
// // //       } else {
// // //         BackgroundMusic.play();
// // //       }
// // //     });
// // //   }

// // //   /// 🚪 Logout
// // //   void _logout() async {
// // //     await AuthService.signOut();

// // //     ScaffoldMessenger.of(
// // //       context,
// // //     ).showSnackBar(const SnackBar(content: Text("Logged out successfully")));
// // //   }

// // //   /// 🎬 HERO BANNER
// // //   Widget _heroBanner() {
// // //     return FutureBuilder<List<dynamic>>(
// // //       future: featured,
// // //       builder: (context, snapshot) {
// // //         if (!snapshot.hasData) {
// // //           return const SizedBox(
// // //             height: 420,
// // //             child: Center(child: CircularProgressIndicator()),
// // //           );
// // //         }

// // //         final movie = snapshot.data!.first;
// // //         final image = movie['backdrop_path'] ?? movie['poster_path'];

// // //         return GestureDetector(
// // //           onTap: _requireLoginAndOpenLibrary,
// // //           child: Stack(
// // //             children: [
// // //               SizedBox(
// // //                 height: 420,
// // //                 width: double.infinity,
// // //                 child: Image.network(
// // //                   TmdbService.imageUrl(image),
// // //                   fit: BoxFit.cover,
// // //                 ),
// // //               ),
// // //               Container(
// // //                 height: 420,
// // //                 decoration: BoxDecoration(
// // //                   gradient: LinearGradient(
// // //                     begin: Alignment.topCenter,
// // //                     end: Alignment.bottomCenter,
// // //                     colors: [
// // //                       Colors.transparent,
// // //                       Colors.black.withOpacity(0.85),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //               Positioned(
// // //                 bottom: 30,
// // //                 left: 20,
// // //                 right: 20,
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     Text(
// // //                       movie['title'] ?? '',
// // //                       style: const TextStyle(
// // //                         color: Colors.white,
// // //                         fontSize: 26,
// // //                         fontWeight: FontWeight.bold,
// // //                       ),
// // //                     ),
// // //                     const SizedBox(height: 12),
// // //                     ElevatedButton.icon(
// // //                       style: ElevatedButton.styleFrom(
// // //                         backgroundColor: Colors.redAccent,
// // //                       ),
// // //                       onPressed: _requireLoginAndOpenLibrary,
// // //                       icon: const Icon(Icons.play_arrow),
// // //                       label: const Text("Play"),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         );
// // //       },
// // //     );
// // //   }

// // //   /// 🎞 MOVIE ROW
// // //   Widget _movieRow(String title, Future<List<dynamic>> future) {
// // //     return Column(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         Padding(
// // //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// // //           child: Text(
// // //             title,
// // //             style: const TextStyle(
// // //               color: Colors.white,
// // //               fontSize: 20,
// // //               fontWeight: FontWeight.bold,
// // //             ),
// // //           ),
// // //         ),
// // //         SizedBox(
// // //           height: 210,
// // //           child: FutureBuilder<List<dynamic>>(
// // //             future: future,
// // //             builder: (context, snapshot) {
// // //               if (!snapshot.hasData) {
// // //                 return const Center(child: CircularProgressIndicator());
// // //               }

// // //               return ListView.builder(
// // //                 scrollDirection: Axis.horizontal,
// // //                 padding: const EdgeInsets.symmetric(horizontal: 12),
// // //                 itemCount: snapshot.data!.length,
// // //                 itemBuilder: (_, i) {
// // //                   final movie = snapshot.data![i];
// // //                   final poster = movie['poster_path'];

// // //                   if (poster == null) return const SizedBox(width: 140);

// // //                   return GestureDetector(
// // //                     onTap: _requireLoginAndOpenLibrary,
// // //                     child: Container(
// // //                       width: 140,
// // //                       margin: const EdgeInsets.symmetric(horizontal: 6),
// // //                       child: ClipRRect(
// // //                         borderRadius: BorderRadius.circular(10),
// // //                         child: Image.network(
// // //                           TmdbService.imageUrl(poster),
// // //                           fit: BoxFit.cover,
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //               );
// // //             },
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: const Color(0xFF121212),
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.black,
// // //         title: Row(
// // //           children: [
// // //             Image.asset("assets/gishtube_logo.png", height: 28),
// // //             const SizedBox(width: 8),
// // //             const Text(
// // //               "GishTube",
// // //               style: TextStyle(fontWeight: FontWeight.bold),
// // //             ),
// // //           ],
// // //         ),
// // //         actions: [
// // //           IconButton(onPressed: _logout, icon: const Icon(Icons.logout)),
// // //         ],
// // //       ),
// // //       body: ListView(
// // //         children: [
// // //           _heroBanner(),
// // //           _movieRow("🔥 Trending Now", featured),
// // //           _movieRow("🎬 Action Movies", action),
// // //           _movieRow("😂 Comedy Hits", comedy),
// // //           _movieRow("😱 Horror Picks", horror),
// // //           const SizedBox(height: 30),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:gishtube/screens/video_library_screen.dart';
// // import '../services/tmdb_service.dart';
// // import '../services/background_music.dart';
// // import '../services/auth_service.dart';
// // import 'login_screen.dart';

// // class VideoFeedScreen extends StatefulWidget {
// //   const VideoFeedScreen({super.key});

// //   @override
// //   State<VideoFeedScreen> createState() => _VideoFeedScreenState();
// // }

// // class _VideoFeedScreenState extends State<VideoFeedScreen> {
// //   late Future<List<dynamic>> featured;
// //   late Future<List<dynamic>> action;
// //   late Future<List<dynamic>> comedy;
// //   late Future<List<dynamic>> horror;

// //   @override
// //   void initState() {
// //     super.initState();

// //     featured = TmdbService.fetchTrending();
// //     action = TmdbService.fetchByGenre(28);
// //     comedy = TmdbService.fetchByGenre(35);
// //     horror = TmdbService.fetchByGenre(27);

// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       BackgroundMusic.play();
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     BackgroundMusic.stop();
// //     super.dispose();
// //   }

// //   /// LOGIN → LIBRARY FLOW (unchanged logic)
// //   void _requireLoginAndOpenLibrary() async {
// //     BackgroundMusic.pause();

// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(builder: (_) => const LoginScreen()),
// //     ).then((_) async {
// //       if (await AuthService.isLoggedIn()) {
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(builder: (_) => const VideoLibraryScreen()),
// //         ).then((_) => BackgroundMusic.play());
// //       } else {
// //         BackgroundMusic.play();
// //       }
// //     });
// //   }

// //   /// Safe image loader (prevents release crash)
// //   Widget _safeImage(
// //     String? path, {
// //     double height = 200,
// //     double width = double.infinity,
// //   }) {
// //     if (path == null) {
// //       return Container(height: height, width: width, color: Colors.black26);
// //     }

// //     return Image.network(
// //       TmdbService.imageUrl(path),
// //       height: height,
// //       width: width,
// //       fit: BoxFit.cover,
// //       errorBuilder: (_, __, ___) =>
// //           Container(height: height, width: width, color: Colors.black26),
// //     );
// //   }

// //   /// HERO BANNER
// //   Widget _heroBanner() {
// //     return FutureBuilder<List<dynamic>>(
// //       future: featured,
// //       builder: (context, snapshot) {
// //         if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //           return const SizedBox(
// //             height: 420,
// //             child: Center(child: CircularProgressIndicator()),
// //           );
// //         }

// //         final movie = snapshot.data!.first;
// //         final image = movie['backdrop_path'] ?? movie['poster_path'];

// //         return GestureDetector(
// //           onTap: _requireLoginAndOpenLibrary,
// //           child: Stack(
// //             children: [
// //               _safeImage(image, height: 420),
// //               Container(
// //                 height: 420,
// //                 decoration: BoxDecoration(
// //                   gradient: LinearGradient(
// //                     begin: Alignment.topCenter,
// //                     end: Alignment.bottomCenter,
// //                     colors: [
// //                       Colors.transparent,
// //                       Colors.black.withOpacity(0.85),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               Positioned(
// //                 bottom: 30,
// //                 left: 20,
// //                 child: ElevatedButton.icon(
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Colors.redAccent,
// //                   ),
// //                   onPressed: _requireLoginAndOpenLibrary,
// //                   icon: const Icon(Icons.play_arrow),
// //                   label: const Text("Play"),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   /// MOVIE ROW
// //   Widget _movieRow(String title, Future<List<dynamic>> future) {
// //     return FutureBuilder<List<dynamic>>(
// //       future: future,
// //       builder: (context, snapshot) {
// //         if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //           return const SizedBox();
// //         }

// //         return Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// //               child: Text(
// //                 title,
// //                 style: const TextStyle(
// //                   color: Colors.white,
// //                   fontSize: 20,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ),
// //             SizedBox(
// //               height: 210,
// //               child: ListView.builder(
// //                 scrollDirection: Axis.horizontal,
// //                 padding: const EdgeInsets.symmetric(horizontal: 12),
// //                 itemCount: snapshot.data!.length,
// //                 itemBuilder: (_, i) {
// //                   final poster = snapshot.data![i]['poster_path'];

// //                   return GestureDetector(
// //                     onTap: _requireLoginAndOpenLibrary,
// //                     child: Container(
// //                       width: 140,
// //                       margin: const EdgeInsets.symmetric(horizontal: 6),
// //                       child: ClipRRect(
// //                         borderRadius: BorderRadius.circular(10),
// //                         child: _safeImage(poster, height: 210, width: 140),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFF121212),
// //       appBar: AppBar(
// //         backgroundColor: Colors.black,
// //         title: Row(
// //           children: [
// //             Image.asset("assets/gishtube_logo.png", height: 28),
// //             const SizedBox(width: 8),
// //             const Text(
// //               "GishTube",
// //               style: TextStyle(fontWeight: FontWeight.bold),
// //             ),
// //           ],
// //         ),
// //       ),
// //       body: ListView(
// //         children: [
// //           _heroBanner(),
// //           _movieRow("🔥 Trending Now", featured),
// //           _movieRow("🎬 Action Movies", action),
// //           _movieRow("😂 Comedy Hits", comedy),
// //           _movieRow("😱 Horror Picks", horror),
// //           const SizedBox(height: 30),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:gishtube/screens/video_library_screen.dart';
// import '../services/tmdb_service.dart';
// import '../services/background_music.dart';
// import '../services/auth_service.dart';
// import 'login_screen.dart';

// class VideoFeedScreen extends StatefulWidget {
//   const VideoFeedScreen({super.key});

//   @override
//   State<VideoFeedScreen> createState() => _VideoFeedScreenState();
// }

// class _VideoFeedScreenState extends State<VideoFeedScreen> {
//   late Future<List<dynamic>> featured;
//   late Future<List<dynamic>> action;
//   late Future<List<dynamic>> comedy;
//   late Future<List<dynamic>> horror;

//   @override
//   void initState() {
//     super.initState();

//     featured = TmdbService.fetchTrending();
//     action = TmdbService.fetchByGenre(28);
//     comedy = TmdbService.fetchByGenre(35);
//     horror = TmdbService.fetchByGenre(27);

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       try {
//         BackgroundMusic.play();
//       } catch (e) {
//         debugPrint("BackgroundMusic failed: $e");
//       }
//     });
//   }

//   @override
//   void dispose() {
//     try {
//       BackgroundMusic.stop();
//     } catch (_) {}
//     super.dispose();
//   }

//   /// LOGIN → LIBRARY FLOW
//   void _requireLoginAndOpenLibrary() async {
//     try {
//       BackgroundMusic.pause();
//     } catch (_) {}

//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const LoginScreen()),
//     ).then((_) async {
//       if (await AuthService.isLoggedIn()) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const VideoLibraryScreen()),
//         ).then((_) {
//           try {
//             BackgroundMusic.play();
//           } catch (_) {}
//         });
//       } else {
//         try {
//           BackgroundMusic.play();
//         } catch (_) {}
//       }
//     });
//   }

//   /// Safe image loader
//   Widget _safeImage(
//     String? path, {
//     double height = 200,
//     double width = double.infinity,
//   }) {
//     if (path == null)
//       return Container(height: height, width: width, color: Colors.black26);

//     return Image.network(
//       TmdbService.imageUrl(path),
//       height: height,
//       width: width,
//       fit: BoxFit.cover,
//       errorBuilder: (_, __, ___) =>
//           Container(height: height, width: width, color: Colors.black26),
//     );
//   }

//   /// HERO BANNER
//   Widget _heroBanner() {
//     return FutureBuilder<List<dynamic>>(
//       future: featured,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return SizedBox(
//             height: 420,
//             child: Center(
//               child: Text(
//                 'Failed to load movies',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           );
//         }

//         if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const SizedBox(
//             height: 420,
//             child: Center(child: CircularProgressIndicator()),
//           );
//         }

//         final movie = snapshot.data!.first;
//         final image = movie['backdrop_path'] ?? movie['poster_path'];

//         return GestureDetector(
//           onTap: _requireLoginAndOpenLibrary,
//           child: Stack(
//             children: [
//               _safeImage(image, height: 420),
//               Container(
//                 height: 420,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Colors.transparent,
//                       Colors.black.withOpacity(0.85),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 30,
//                 left: 20,
//                 child: ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.redAccent,
//                   ),
//                   onPressed: _requireLoginAndOpenLibrary,
//                   icon: const Icon(Icons.play_arrow),
//                   label: const Text("Play"),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   /// MOVIE ROW
//   Widget _movieRow(String title, Future<List<dynamic>> future) {
//     return FutureBuilder<List<dynamic>>(
//       future: future,
//       builder: (context, snapshot) {
//         if (snapshot.hasError ||
//             snapshot.data == null ||
//             snapshot.data!.isEmpty) {
//           return const SizedBox();
//         }

//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: Text(
//                 title,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 210,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (_, i) {
//                   final poster = snapshot.data![i]['poster_path'];

//                   return GestureDetector(
//                     onTap: _requireLoginAndOpenLibrary,
//                     child: Container(
//                       width: 140,
//                       margin: const EdgeInsets.symmetric(horizontal: 6),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: _safeImage(poster, height: 210, width: 140),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF121212),
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Row(
//           children: [
//             Image.asset("assets/gishtube_logo.png", height: 28),
//             const SizedBox(width: 8),
//             const Text(
//               "GishTube",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//       body: ListView(
//         children: [
//           _heroBanner(),
//           _movieRow("🔥 Trending Now", featured),
//           _movieRow("🎬 Action Movies", action),
//           _movieRow("😂 Comedy Hits", comedy),
//           _movieRow("😱 Horror Picks", horror),
//           const SizedBox(height: 30),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gishtube/screens/video_library_screen.dart';
import '../services/tmdb_service.dart';
import '../services/background_music.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class VideoFeedScreen extends StatefulWidget {
  const VideoFeedScreen({super.key});

  @override
  State<VideoFeedScreen> createState() => _VideoFeedScreenState();
}

class _VideoFeedScreenState extends State<VideoFeedScreen> {
  Future<List<dynamic>>? featured;
  Future<List<dynamic>>? action;
  Future<List<dynamic>>? comedy;
  Future<List<dynamic>>? horror;

  bool _loaded = false;

  @override
  void initState() {
    super.initState();

    /// VERY IMPORTANT: wait until first frame renders
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    try {
      setState(() {
        featured = TmdbService.fetchTrending();
        action = TmdbService.fetchByGenre(28);
        comedy = TmdbService.fetchByGenre(35);
        horror = TmdbService.fetchByGenre(27);
        _loaded = true;
      });

      BackgroundMusic.play();
    } catch (_) {}
  }

  @override
  void dispose() {
    try {
      BackgroundMusic.stop();
    } catch (_) {}
    super.dispose();
  }

  /// LOGIN → LIBRARY FLOW (your original concept)
  void _requireLoginAndOpenLibrary() async {
    try {
      BackgroundMusic.pause();
    } catch (_) {}

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    ).then((_) async {
      if (await AuthService.isLoggedIn()) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const VideoLibraryScreen()),
        ).then((_) {
          try {
            BackgroundMusic.play();
          } catch (_) {}
        });
      } else {
        try {
          BackgroundMusic.play();
        } catch (_) {}
      }
    });
  }

  /// SAFE IMAGE (prevents Android release crash)
  Widget _safeImage(
    String? path, {
    double height = 200,
    double width = double.infinity,
  }) {
    if (path == null) {
      return Container(height: height, width: width, color: Colors.black26);
    }

    return Image.network(
      TmdbService.imageUrl(path),
      height: height,
      width: width,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) =>
          Container(height: height, width: width, color: Colors.black26),
      frameBuilder: (context, child, frame, _) {
        if (frame == null) {
          return Container(height: height, width: width, color: Colors.black12);
        }
        return child;
      },
    );
  }

  /// HERO BANNER
  Widget _heroBanner() {
    return FutureBuilder<List<dynamic>>(
      future: featured,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox(
            height: 420,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final movie = snapshot.data!.first;
        final image = movie['backdrop_path'] ?? movie['poster_path'];

        return GestureDetector(
          onTap: _requireLoginAndOpenLibrary,
          child: Stack(
            children: [
              _safeImage(image, height: 420),
              Container(
                height: 420,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.85),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 20,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  onPressed: _requireLoginAndOpenLibrary,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// MOVIE ROW
  Widget _movieRow(String title, Future<List<dynamic>>? future) {
    if (future == null) return const SizedBox();

    return FutureBuilder<List<dynamic>>(
      future: future,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 210,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: snapshot.data!.length,
                itemBuilder: (_, i) {
                  final poster = snapshot.data![i]['poster_path'];

                  return GestureDetector(
                    onTap: _requireLoginAndOpenLibrary,
                    child: Container(
                      width: 140,
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: _safeImage(poster, height: 210, width: 140),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Image.asset("assets/gishtube_logo.png", height: 28),
            const SizedBox(width: 8),
            const Text(
              "GishTube",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          _heroBanner(),
          _movieRow("🔥 Trending Now", featured),
          _movieRow("🎬 Action Movies", action),
          _movieRow("😂 Comedy Hits", comedy),
          _movieRow("😱 Horror Picks", horror),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
