// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoLesson extends StatefulWidget {
//   final String path;
//   const VideoLesson({super.key, required this.path});
//
//   @override
//   State<VideoLesson> createState() => _VideoLessonState();
// }
//
// class _VideoLessonState extends State<VideoLesson> {
//   late VideoPlayerController controller;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = VideoPlayerController.asset("assets/vedio/Firestore Adding - Getting User To Manageg User Specific 01.mp4")
//       ..initialize().then((_) {
//         setState(() {});
//         controller.play();
//       });
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (!controller.value.isInitialized) {
//       return const Center(child: CircularProgressIndicator());
//     }
//
//     return Center(
//       child: AspectRatio(
//         aspectRatio: controller.value.aspectRatio,
//         child: VideoPlayer(controller),
//       ),
//     );
//   }
// }

/////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPage extends StatefulWidget {

  final String url;
  final String title;

  const VideoPage({super.key, required this.url, required this.title});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {

  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {

    super.initState();

    videoPlayerController = VideoPlayerController.network(widget.url);

    videoPlayerController.initialize().then((_) {

      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: false,
      );

      setState(() {});

    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text(widget.title)),

      body: Center(

        child: chewieController == null
            ? const CircularProgressIndicator()
            : Chewie(controller: chewieController!),

      ),

    );

  }

}