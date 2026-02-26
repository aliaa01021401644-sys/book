import 'package:shared_preferences/shared_preferences.dart';

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