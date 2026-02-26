// import 'package:flutter/material.dart';
// import 'lesson2.dart';
//
//
// class CoursePage extends StatelessWidget {
//   const CoursePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber,
//       appBar: AppBar(title: const Text("Lessons")),
//
//       body: ListView(
//         children: [
//
//           ListTile(
//             title: const Text("Lesson Video"),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => const LessonPage(
//                     title: "Intro Video",
//                     type: "video",
//                     path: "assets/vedio/Firestore Adding - Getting User To Manageg User Specific 01.mp4",
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           ListTile(
//             title: const Text("Lesson PDF"),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => const LessonPage(
//                     title: "Chapter 1",
//                     type: "pdf",
//                     path: "assets/pdf/Bank Management System.docx2.docx",
//                   ),
//                 ),
//               );
//             },
//           ),
//
//         ],
//       ),
//     );
//   }
// }

///
/// using url

import 'package:flutter/material.dart';


import 'lesson2.dart';
import 'lessonmodel2.dart';


class CoursePage extends StatelessWidget {
  CoursePage({super.key});

  final List<Lesson> lessons = [
    Lesson(
      title: "Intro Video",
      type: "video",
      path: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    ),
    Lesson(
      title: "Chapter 1 PDF",
      type: "pdf",
      path: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lessons")),
      body: ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];
          return ListTile(
            title: Text(lesson.title),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LessonPage(
                    title: lesson.title,
                    type: lesson.type,
                    url: lesson.path,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}