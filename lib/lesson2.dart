import 'package:flutter/material.dart';
import 'package:news/vedio2.dart';
import 'package:video_player/video_player.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
// class LessonPage extends StatefulWidget {
//   final String title;
//   final String type; // video / pdf
//   final String path;
//
//   const LessonPage({
//     super.key,
//     required this.title,
//     required this.type,
//     required this.path,
//   });
//
//   @override
//   State<LessonPage> createState() => _LessonPageState();
// }
//
// class _LessonPageState extends State<LessonPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body: buildContent(),
//     );
//   }
//
//   Widget buildContent() {
//
//
//     if (widget.type == "video") {
//       return VideoLesson(path: widget.path);
//     }
//
//
//     else if (widget.type == "pdf") {
//       return SfPdfViewer.asset(widget.path);
//     }
//
//     return const Center(child: Text("No Content"));
//   }
// }
///////////////////////////////////////////////////////////////////
//using Url
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class LessonPage extends StatefulWidget {
  final String title;
  final String type; // "video" أو "pdf"
  final String url;  // URL كامل

  const LessonPage({
    super.key,
    required this.title,
    required this.type,
    required this.url,
  });

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  VideoPlayerController? videoController;

  @override
  void initState() {
    super.initState();

    if (widget.type == "video") {
      videoController = VideoPlayerController.networkUrl(Uri.parse(widget.url))
        ..initialize().then((_) {
          setState(() {});
          videoController!.play();
          videoController!.setLooping(true);
        });
    }
  }

  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: buildContent(),
    );
  }

  Widget buildContent() {
    if (widget.type == "video") {
      if (videoController == null || !videoController!.value.isInitialized) {
        return const Center(child: CircularProgressIndicator());
      }
      return Center(
        child: AspectRatio(
          aspectRatio: videoController!.value.aspectRatio,
          child: VideoPlayer(videoController!),
        ),
      );
    } else if (widget.type == "pdf") {
      return SfPdfViewer.network(widget.url);
    }

    return const Center(child: Text("No Content"));
  }
}