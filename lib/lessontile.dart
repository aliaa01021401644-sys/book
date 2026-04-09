 import 'package:flutter/material.dart';
import 'package:news/pdfLesson.dart';
import 'package:news/progressService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'lessonModel.dart';
import 'lessonScreen.dart';
import 'package:news/lessonModel.dart';

import 'lessonScreen.dart';

class LessonTile extends StatefulWidget {
  final Lesson lesson;

  const LessonTile({super.key, required this.lesson});

  @override
  State<LessonTile> createState() => _LessonTileState();
}

class _LessonTileState extends State<LessonTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        widget.lesson.isCompleted ? Icons.check_circle : Icons.play_circle,
        color: widget.lesson.isCompleted ? Colors.green : Colors.blue,
      ),
      title: Text(widget.lesson.title),
      subtitle: Text(widget.lesson.duration),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {



          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => LessonScreen(lesson: widget.lesson),
            ),
          );
        },

    );
  }
}




 class ProgressService {
   static const String completedLessonsKey = "completed_lessons";

   static Future<void> markCompleted(String lessonId) async {
     final prefs = await SharedPreferences.getInstance();
     final completed = prefs.getStringList(completedLessonsKey) ?? [];
     if (!completed.contains(lessonId)) {
       completed.add(lessonId);
       await prefs.setStringList(completedLessonsKey, completed);
     }
   }

   static Future<bool> isCompleted(String lessonId) async {
     final prefs = await SharedPreferences.getInstance();
     final completed = prefs.getStringList(completedLessonsKey) ?? [];
     return completed.contains(lessonId);
   }
 }