

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final String url;

  const VideoScreen({required this.url, Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController controller;
  bool isReady = false;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {
          isReady = true;
        });
        controller.play();
      }).catchError((e) {
        // لو فيه مشكلة في التحميل نعرض الخطأ
        setState(() {
          isReady = false;
        });
        debugPrint('Video init error: $e');
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool canUseController = isReady && controller.value.isInitialized;
    return Scaffold(
      appBar: AppBar(title: Text("Playing Video")),
      body: Center(
        child: canUseController
            ? AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        )
            : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 12),
            Text("Loading video..."),
          ],
        ),
      ),
      floatingActionButton: canUseController
          ? FloatingActionButton(
        child: Icon(controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
        onPressed: () {
          setState(() {
            controller.value.isPlaying ? controller.pause() : controller.play();
          });
        },
      )
          : null,
    );
  }
}

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'video_screen.dart';
//
// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: JsonViewerScreen(),
//   ));


class JsonScreen extends StatefulWidget {
  @override
  State<JsonScreen> createState() => _JsonViewerScreenState();
}

class _JsonViewerScreenState extends State<JsonScreen> {
  Map<String, dynamic>? jsonData;

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  Future<void> loadJson() async {
    try {
      String jsonString = await rootBundle.loadString('images/data/SmartObjectSample.json');
      setState(() {
        jsonData = json.decode(jsonString) as Map<String, dynamic>;
      });
    } catch (e) {
      debugPrint('Error loading JSON: $e');
      setState(() {
        jsonData = {}; // عشان الواجهة ماتقعش لو فيه مشكلة
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (jsonData == null) {
      return Scaffold(
        appBar: AppBar(title: Text("Loading...")),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Use safe casts and default to empty lists
    List<dynamic> keywords = (jsonData!["keywords"] is List) ? jsonData!["keywords"] as List<dynamic> : [];
    List<dynamic> audioList = (jsonData!["audioList"] is List) ? jsonData!["audioList"] as List<dynamic> : [];
    List<dynamic> vttList = (jsonData!["vttList"] is List) ? jsonData!["vttList"] as List<dynamic> : [];
    List<dynamic> availableLanguages = (jsonData!["availableLanguages"] is List) ? jsonData!["availableLanguages"] as List<dynamic> : [];

    return Scaffold(
      appBar: AppBar(title: Text("Database Viewer")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Keywords
          Text("Keywords", style: titleStyle),
          if (keywords.isEmpty) Text("- no keywords found"),
          ...keywords.map((k) => Text("- ${k ?? ''}")),

          SizedBox(height: 25),

          // Audio List
          Text("Audio List", style: titleStyle),
          if (audioList.isEmpty) Text("No audio items"),
          ...audioList.map((item) {
            final lang = item is Map ? (item['langCode'] ?? 'unknown') : 'unknown';
            final url = item is Map ? (item['url'] ?? '') : '';
            final rawDuration = item is Map ? item['duration'] : null;
            final int durationSec = parseToIntSafe(rawDuration);
            return Card(
              child: ListTile(
                title: Text("$lang (${formatDuration(durationSec)})"),
                subtitle: Text(url.toString()),
              ),
            );
          }).toList(),

          SizedBox(height: 25),

          // VTT List (Videos)
          Text("Video List", style: titleStyle),
          if (vttList.isEmpty) Text("No videos"),
          ...vttList.map((v) {
            final url = v is Map ? (v['url'] ?? '') : (v ?? '');
            final rawDuration = v is Map ? v['duration'] : null;
            final int durationSec = parseToIntSafe(rawDuration);
            return InkWell(
              onTap: () {
                final finalUrl = url?.toString() ?? '';
                if (finalUrl.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Video URL is empty')));
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => VideoScreen(url: finalUrl)),
                );
              },
              child: Card(
                child: ListTile(
                  title: Text("Duration: ${formatDuration(durationSec)}"),
                  subtitle: Text(url.toString()),
                ),
              ),
            );
          }).toList(),

          SizedBox(height: 25),

          // Available Languages
          Text("Available Languages", style: titleStyle),
          if (availableLanguages.isEmpty) Text("No languages"),
          Wrap(
            spacing: 10,
            children: availableLanguages.map((lang) => Chip(label: Text(lang.toString()))).toList(),
          ),
        ],
      ),
    );
  }

  TextStyle get titleStyle => TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

  /// Safely parse dynamic value to int. Handles int, double, numeric String, null.
  static int parseToIntSafe(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) {
      // remove non-digit except minus
      final cleaned = value.trim();
      return int.tryParse(cleaned) ?? double.tryParse(cleaned)?.toInt() ?? 0;
    }
    // fallback
    return 0;
  }

  /// Convert seconds → HH:MM:SS
  String formatDuration(int seconds) {
    if (seconds <= 0) return "00:00:00";
    Duration d = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inHours)}:${twoDigits(d.inMinutes % 60)}:${twoDigits(d.inSeconds % 60)}";
  }
}