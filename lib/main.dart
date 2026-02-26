// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// class NewsPage extends StatefulWidget {
//   const NewsPage({super.key});
//   @override
//   State<NewsPage> createState() => _NewsPageState();
// }
// class _NewsPageState extends State<NewsPage> {
//   List articles = [];
//   bool loading = true;
//   // ■■ ■■■■■■ ■■■ ■
//   final String apiKey = '17b124b4b2d74d6a89d43354d1944cfa';
//   @override
//   void initState() {
//     super.initState();
//     fetchNews();
//   }
//   Future<void> fetchNews() async {
//     final url = Uri.parse(
//         'https://api.allorigins.win/raw?url=https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey');
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           articles = data['articles'];
//           loading = false;
//         });
//       } else {
//         throw Exception('Failed to load news');
//       }
//     } catch (e) {
//       setState(() {
//         loading = false;
//       });
//       print('Error: $e');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Latest News ■')),
//       body: loading
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.builder(
//         itemCount: articles.length,
//         itemBuilder: (context, index) {
//           final a = articles[index];
//           return Card(
//             margin: const EdgeInsets.all(10),
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15)),
//             child: ListTile(
//               leading: a['urlToImage'] != null
//                   ? Image.network(a['urlToImage'],
//                   width: 80, fit: BoxFit.cover)
//                   : const Icon(Icons.image_not_supported),
//               title: Text(
//                 a['title'] ?? '',
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(a['source']?['name'] ?? ''),
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (_) => AlertDialog(
//                     title: Text(a['title'] ?? ''),
//                     content: Text(a['description'] ?? 'No details'),
//                     actions: [
//                       TextButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: const Text('Close'),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news/screen.dart';


import 'config/theme/thememanager.dart';
import 'core/routesManager/routesmanager.dart';
import 'package:news/courseScreen.dart';
import 'package:news/courseCard.dart';
void main(){
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: RoutesManager.routes,
      //initialRoute: RoutesManager.Lessonscreen,
      initialRoute: RoutesManager.courseScreen,
      // initialRoute: RoutesManager.firstScreen,
      theme: ThemeManager.light,
      themeMode: ThemeMode.light,
    );
  }
}

// import 'package:flutter/material.dart';
// //import 'screens/courses/courses_screen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CoursesScreen(),
//     );
//   }
// }
//













