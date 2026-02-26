class Lesson {
  final String title;
  final String type; // "video" أو "pdf"
  final String path; // path داخل assets

  Lesson({
    required this.title,
    required this.type,
    required this.path,
  });
}