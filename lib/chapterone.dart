import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class chapter1 extends StatelessWidget {
  const chapter1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
class LessonModel {
  final String pdfUrl;
  final String title;
  final List audios;
  final List keywords;
  final List languages;

  LessonModel({
    required this.pdfUrl,
    required this.title,
    required this.audios,
    required this.keywords,
    required this.languages,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      pdfUrl: json['url'],
      title: json['title'],
      audios: json['audioList'],
      keywords: json['keywords'],
      languages: json['availableLanguages'],
    );
  }
}


class JsonService {
  static Future<LessonModel> loadLesson() async {
    final data = await rootBundle.loadString('assets/data/PDFSample.json');
    final jsonResult = json.decode(data);
    return LessonModel.fromJson(jsonResult);
  }
}

//
// class AudioPlayerWidget extends StatefulWidget {
//   final String url;
//   const AudioPlayerWidget({super.key, required this.url});
//
//   @override
//   State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
// }
//
// class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
//   final player = AudioPlayer();
//   bool playing = false;
//
//   @override
//   void initState() {
//     super.initState();
//     player.setUrl(widget.url);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: Icon(playing ? Icons.pause : Icons.play_arrow),
//       onPressed: () async {
//         if (playing) {
//           await player.pause();
//         } else {
//           await player.play();
//         }
//         setState(() => playing = !playing);
//       },
//     );
//   }
// }


class KeywordsWidget extends StatelessWidget {
  final List keywords;
  const KeywordsWidget({super.key, required this.keywords});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: keywords.map((k) {
        return ActionChip(
          label: Text(k['word']),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text(k['word']),
                content: Text(
                    k['definition'] == "" ? "No definition" : k['definition']),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

//
// class PdfScreen extends StatefulWidget {
//   const PdfScreen({super.key});
//
//   @override
//   State<PdfScreen> createState() => _PdfScreenState();
// }
//
// class _PdfScreenState extends State<PdfScreen> {
//
//   PdfModel? pdf;
//
//   @override
//   void initState() {
//     super.initState();
//     loadPdf();
//   }
//
//   loadPdf() async {
//     pdf = await JsonService.loadPdf();
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     if (pdf == null) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(pdf!.title),
//       ),
//       body: SfPdfViewer.network(
//         pdf!.url,
//       ),
//     );
//   }
// }
//
// class LessonScreen extends StatefulWidget {
//   const LessonScreen({super.key});
//
//   @override
//   State<LessonScreen> createState() => _LessonScreenState();
// }
//
// class _LessonScreenState extends State<LessonScreen> {
//   LessonModel? lesson;
//   int langIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     load();
//   }
//
//   load() async {
//     lesson = await JsonService.loadLesson();
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (lesson == null) {
//       return const Scaffold(body: Center(child: CircularProgressIndicator()));
//     }
//
//     final langData = lesson!.languages[langIndex]['data'];
//
//     return Scaffold(
//       appBar: AppBar(title: Text(lesson!.title)),
//       body: Column(
//         children: [
//
//           /// PDF
//           Expanded(
//             child: SfPdfViewer.network(lesson!.pdfUrl),
//           ),
//
//           /// Language selector
//           DropdownButton<int>(
//             value: langIndex,
//             items: List.generate(
//               lesson!.languages.length,
//                   (i) => DropdownMenuItem(
//                 value: i,
//                 child: Text(lesson!.languages[i]['languageCode']),
//               ),
//             ),
//             onChanged: (v) => setState(() => langIndex = v!),
//           ),
//
//           /// Audio
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: lesson!.audios
//                 .map<Widget>((a) => AudioPlayerWidget(url: a['url']))
//                 .toList(),
//           ),
//
//           /// Summary
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               langData['summary25'],
//               maxLines: 4,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//
//           /// Keywords
//           KeywordsWidget(keywords: lesson!.keywords),
//
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
//}