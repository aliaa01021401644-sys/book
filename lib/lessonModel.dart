import 'package:news/GlassaryModel.dart';

enum LessonType{video,pdf}

  class Lesson {
  final String id;
  final String title;
  final String duration;
  final LessonType type;
  final String contentUrl;
  final String vedioUrl;
  final bool isCompleted;
  final List<Glossary>lessonGlossary;
  Lesson({
    required this.id,
    required this.title,
    required this.duration,
    required this.type,
    required this.vedioUrl,
    required this.contentUrl,
    required this.lessonGlossary,
    this.isCompleted = false,
  });
}