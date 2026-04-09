// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:news/progressService.dart';
//
// import 'lessonModel.dart';
//
//
// class PdfLessonScreen extends StatelessWidget {
//   final Lesson lesson;
//
//   const PdfLessonScreen({super.key, required this.lesson});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(lesson.title),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: PDFView(
//               filePath: lesson.contentUrl,
//               enableSwipe: true,
//               swipeHorizontal: true,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: ElevatedButton(
//               onPressed: () async {
//                 await ProgressService.markCompleted(lesson.id);
//                 Navigator.pop(context);
//               },
//               child: const Text("Mark as Completed"),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
///////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/Widget/pdfProvider.dart';
import 'core/Widget/pdfView.dart';
import 'core/Widget/pdfmodule.dart';



class PdfListScreen extends StatefulWidget {
  const PdfListScreen({super.key});

  @override
  State<PdfListScreen> createState() => _PdfListScreenState();
}

class _PdfListScreenState extends State<PdfListScreen> {
  List<String> _titles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadTitles();
  }

  Future<void> _loadTitles() async {
    final titles = await PdfViewModel.getAllTitles();
    setState(() {
      _titles = titles;
      _loading = false;
    });
  }

  void _onTitleSelected(String? title) {
    if (title == null) return;

    final pdfProvider = PdfProvider();
    pdfProvider.setSelectedTitle(title);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider<PdfProvider>(
          create: (_) => pdfProvider,
          child: const PdfView(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("choose your pdf")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : DropdownButtonFormField<String>(
          hint: const Text('اختر عنوان'),
          isExpanded: true,
          items: _titles
              .map(
                (title) =>
                DropdownMenuItem(value: title, child: Text(title)),
          )
              .toList(),
          onChanged: _onTitleSelected,
        ),
      ),
    );
  }
}
