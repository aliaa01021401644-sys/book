import 'package:news/lessonModel.dart';

import 'GlassaryModel.dart';

class Course {
  final String title;
  final String description;
  final String image;
  final List<Lesson>lessons;
  final List<Glossary>glossary;
  Course({
    required this.title,
    required this.description,
    required this.image,
    required this.lessons,
    required this.glossary,
  });
}