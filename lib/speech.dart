import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:translator/translator.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: VideoFromLinkScreen(),
//     );
//   }
//}

class VideoFromLinkScreen extends StatefulWidget {
  const VideoFromLinkScreen({super.key});

  @override
  State<VideoFromLinkScreen> createState() => _VideoFromLinkScreenState();
}

class _VideoFromLinkScreenState extends State<VideoFromLinkScreen> {
  late VideoPlayerController _controller;
  late stt.SpeechToText _speech;

  String subtitleText = "اضغطي تشغيل لبدء الترجمة";
  bool isListening = false;

  // 🔗 لينك الفيديو هنا
  final String videoUrl =
      "https://scube-applications-media54cbabfc-u3d19945rbtv.s3.eu-west-1.amazonaws.com/media/azharengineering2020/ut1/323d56a3-f469-42d5-9d45-b2abaf392d0d_80f447bb-dac0-4a8a-8613-c730f4f47e8b_Molecular_Structure_intro_video.mp4'";

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) {
        setState(() {});
      });

    _speech = stt.SpeechToText();
  }

  Future<void> startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      setState(() => isListening = true);

      _speech.listen(
        localeId: 'en_US', // ar_EG للعربي
        onResult: (result) async {
          final translator = GoogleTranslator();
          var translated = await translator.translate(
            result.recognizedWords,
            from: 'en',
            to: 'ar',
          );

          setState(() {
            subtitleText = translated.text;
          });
        },
      );
    }
  }

  void stopListening() {
    _speech.stop();
    setState(() => isListening = false);
  }

  @override
  void dispose() {
    _controller.dispose();
    _speech.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ترجمة فيديو من لينك"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          if (_controller.value.isInitialized)
            Expanded(
              child: Stack(
                children: [
                  VideoPlayer(_controller),
                  Positioned(
                    bottom: 20,
                    left: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.black54,
                      child: Text(
                        subtitleText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            const Expanded(
              child: Center(child: CircularProgressIndicator()),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _controller.play();
                  startListening();
                },
                child: const Text("تشغيل"),
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.pause();
                  stopListening();
                },
                child: const Text("إيقاف"),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}