
import 'package:flutter/material.dart';
import 'package:news/progressService.dart';

import 'lessonModel.dart';


class CourseProgress extends StatefulWidget {
  final List<Lesson> lessons;

  const CourseProgress({super.key, required this.lessons});

  @override
  State<CourseProgress> createState() => _CourseProgressState();
}

class _CourseProgressState extends State<CourseProgress> {
  double progress = 0;

  @override
  void initState() {
    super.initState();
    calculateProgress();
  }

  void calculateProgress() async {
    int completed = 0;

    for (var lesson in widget.lessons) {
      bool done = await ProgressService.isCompleted(lesson.id);
      if (done) completed++;
    }

    setState(() {
      progress = completed / widget.lessons.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Course Progress ${(progress * 100).toStringAsFixed(0)}%",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(value: progress),
      ],
    );
  }
}