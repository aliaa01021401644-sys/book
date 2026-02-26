import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:news/progressService.dart';

import 'lessonModel.dart';


class PdfLessonScreen extends StatelessWidget {
  final Lesson lesson;

  const PdfLessonScreen({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: PDFView(
              filePath: lesson.contentUrl,
              enableSwipe: true,
              swipeHorizontal: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
              onPressed: () async {
                await ProgressService.markCompleted(lesson.id);
                Navigator.pop(context);
              },
              child: const Text("Mark as Completed"),
            ),
          )
        ],
      ),
    );
  }
}