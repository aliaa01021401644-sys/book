//
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'dart:async';
// import 'package:http/http.dart' as http;
//
// class VideoWidget extends StatefulWidget {
// const VideoWidget({super.key});
//
// @override
// State<VideoWidget> createState() => _VideoWidgetState();
// }
//
// class _VideoWidgetState extends State<VideoWidget> {
// VideoPlayerController? _controller;
// bool _isInitialized = false;
//
// // --- الترجمات: هنا اللينكات حسب اللغة ---
// final Map<String, String> subtitlesMap = {
// "ar": "https://api.themoviedb.org/3/account/null/favorite/movies?language=en-US&page=1&sort_by=created_at.asc",
// "en": "https://api.themoviedb.org/3/account/null/favorite/movies?language=en-US&page=1&sort_by=created_at.asc",
// };
//
// String selectedLang = "ar";
// List<_Subtitle> subtitles = [];
//
// final String videoUrl = "https://api.themoviedb.org/3/account/null/favorite/movies?language=en-US&page=1&sort_by=created_at.asc";
//
// @override
// void initState() {
// super.initState();
// _setupVideo();
// }
//
// Future<void> _setupVideo() async {
// _controller = VideoPlayerController.network(videoUrl);
// try {
// await _controller!.initialize();
// _controller!.play();
// setState(() {
// _isInitialized = true;
// });
// } catch (e) {
// debugPrint("Error initializing video: $e");
// }
//
// _loadSubtitles();
// }
//
// Future<void> _loadSubtitles() async {
// final url = subtitlesMap[selectedLang];
// if (url == null) return;
//
// try {
// final response = await http.get(Uri.parse(url));
// if (response.statusCode == 200) {
// subtitles = _parseSRT(response.body);
// setState(() {});
// }
// } catch (_) {}
// }
//
// List<_Subtitle> _parseSRT(String srt) {
// final List<_Subtitle> list = [];
// final lines = srt.split("\n");
//
// for (int i = 0; i < lines.length; i++) {
// final line = lines[i].trim();
// if (line.isEmpty) continue;
// if (line.contains("-->")) {
// try {
// final timeLine = line.split(" --> ");
// final start = _parseTime(timeLine[0]);
// final end = _parseTime(timeLine[1]);
//
// String text = "";
// int j = i + 1;
// while (j < lines.length && lines[j].trim().isNotEmpty) {
// text += lines[j] + "\n";
// j++;
// }
// text = text.trim();
// list.add(_Subtitle(start, end, text));
// i = j;
// } catch (_) {}
// }
// }
// return list;
// }
//
// Duration _parseTime(String t) {
// t = t.replaceAll(',', '.');
// final parts = t.split(':');
// final secParts = parts[2].split('.');
// return Duration(
// hours: int.parse(parts[0]),
// minutes: int.parse(parts[1]),
// seconds: int.parse(secParts[0]),
// milliseconds: int.parse(secParts[1].padRight(3, '0')),
// );
// }
//
// String getCurrentSubtitle() {
// if (!_isInitialized || _controller == null) return "";
// final current = _controller!.value.position;
// for (var s in subtitles) {
// if (current >= s.start && current <= s.end) return s.text;
// }
// return "";
// }
//
// @override
// Widget build(BuildContext context) {
// return
//   Scaffold(
//     body:  Column(
//     children: [
//     _isInitialized && _controller != null
//     ? AspectRatio(
//     aspectRatio: _controller!.value.aspectRatio,
//     child: VideoPlayer(_controller!),
//     )
//       : const CircularProgressIndicator(),
//
//     const SizedBox(height: 20),
//
//     DropdownButton<String>(
//     value: selectedLang,
//     items: subtitlesMap.keys
//       .map((lang) => DropdownMenuItem(
//     value: lang,
//     child: Text(lang),
//     ))
//       .toList(),
//     onChanged: (value) {
//     if (value != null) {
//     selectedLang = value;
//     _loadSubtitles();
//     setState(() {});
//     }
//     },
//     ),
//
//     const SizedBox(height: 10),
//
//     Text(
//     getCurrentSubtitle(),
//     textAlign: TextAlign.center,
//     style: const TextStyle(
//     fontSize: 20,
//     color: Colors.white,
//     backgroundColor: Colors.black54,
//     ),
//     ),
//     ],
//     ),
//   );
// }
//
// @override
// void dispose() {
// _controller?.dispose();
// super.dispose();
// }
// }
//
// class _Subtitle {
// final Duration start;
// final Duration end;
// final String text;
//
// _Subtitle(this.start, this.end, this.text);
// }





















///////////////////////////////////////////




import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:subtitle_wrapper_package/subtitle_wrapper_package.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: VideoScreen(),
//     );
//   }
// }

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();

    // رابط الفيديو
    _videoController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    )
      ..initialize().then((_) {
        setState(() {});
        _videoController.play(); // تشغيل الفيديو مباشرة
        _videoController.setLooping(true); // لتكرار الفيديو لو حبيت
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video with Subtitles")),
      body: Center(
        child: _videoController.value.isInitialized
            ? SubtitleWrapper(
          videoPlayerController: _videoController,
          subtitleController: SubtitleController(
            subtitleUrl:
            'https://example.com/subtitle_en.vtt', // رابط الترجمة
            showSubtitles: true,
          ),
          videoChild: AspectRatio(
            aspectRatio: _videoController.value.aspectRatio,
            child: VideoPlayer(_videoController),
          ),
        )
            : CircularProgressIndicator(),
      ),
    );
  }
}
