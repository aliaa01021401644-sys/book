import 'package:flutter/material.dart';
import 'package:news/GlossaryTab.dart';
import 'package:news/core/routesManager/routesmanager.dart';
import 'package:news/coures2.dart';
import 'package:news/progressService.dart';
import 'package:video_player/video_player.dart';
import 'package:news/lessonModel.dart';

import 'chapter2.dart' show Chapter2;

class LessonScreen extends StatefulWidget {
  final Lesson lesson;

  const LessonScreen({super.key, required this.lesson});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.lesson.vedioUrl)
      ..initialize().then((_) {
        setState(() {});
        //widget.lesson.vedioUrl
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.lesson.title),
      ),
      body: Column(
        children: [
          if (_controller.value.isInitialized)
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          else
            const Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(),
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: Text(
              _controller.value.isPlaying ? "Pause" : "Play",
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await ProgressService.markCompleted(widget.lesson.id);
              Navigator.pop(context, true);
            },


            child: const Text("Mark as Completed"),
          ),
          SizedBox(height: 50,),
          ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Chapter2()));}, child: Text("Pdf",style: TextStyle(color: Colors.amber),)),

          SizedBox(height: 50,),
          ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>CoursePage()));}, child: Text("Pdf Using url",style: TextStyle(color: Colors.amber),)),
        ],

      ),
    );
  }
}