 import 'package:flutter/material.dart';
import 'package:news/pdfLesson.dart';
import 'package:news/progressService.dart';

import 'lessonModel.dart';
import 'lessonScreen.dart';
// import 'package:news/lessonModel.dart';
//
// import 'lessonScreen.dart';
//
// class LessonTile extends StatefulWidget {
//   final Lesson lesson;
//
//   const LessonTile({super.key, required this.lesson});
//
//   @override
//   State<LessonTile> createState() => _LessonTileState();
// }
//
// class _LessonTileState extends State<LessonTile> {
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Icon(
//         widget.lesson.isCompleted ? Icons.check_circle : Icons.play_circle,
//         color: widget.lesson.isCompleted ? Colors.green : Colors.blue,
//       ),
//       title: Text(widget.lesson.title),
//       subtitle: Text(widget.lesson.duration),
//       trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//       onTap: () {
//
//
//
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => LessonScreen(lesson: widget.lesson),
//             ),
//           );
//         },
//
//     );
//   }
// }




 class LessonTile extends StatefulWidget {
   final Lesson lesson;

   const LessonTile({super.key, required this.lesson});

   @override
   State<LessonTile> createState() => _LessonTileState();
 }


class _LessonTileState extends State<LessonTile> {
  bool completed = false;
  late final Lesson lesson;


  @override
  void initState() {
    super.initState();
    checkCompleted();
  }

  void checkCompleted() async {
    completed = await ProgressService.isCompleted(widget.lesson.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          completed ? Icons.check_circle : Icons.play_circle,
          color: completed ? Colors.green : Colors.blue,
        ),
        title: Text(widget.lesson.title),
        subtitle: Text(widget.lesson.duration),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () async {
        await Navigator.push(
        context,
        MaterialPageRoute(
        builder: (_) => LessonScreen(lesson: widget.lesson),


        // onTap: () {
        //   if (lesson.type == LessonType.video) {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (_) => LessonScreen(lesson: lesson),
        //       ),
        //     );
        //   } else {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (_) => PdfLessonScreen(lesson: lesson),
        //       ),
        )


    );
        }


    );
  }
  }

