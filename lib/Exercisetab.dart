// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; // لتحميل الـ JSON من assets
//
// class QuestionTab extends StatefulWidget {
//   @override
//   _QuestionTabState createState() => _QuestionTabState();
// }
//
// class _QuestionTabState extends State<QuestionTab> {
//   Map<String, dynamic>? questionData;
//
//   @override
//   void initState() {
//     super.initState();
//     loadJson();
//   }
//
//   Future<void> loadJson() async {
//     String jsonString = await rootBundle.loadString('images/data/QuestionSample.json');
//     setState(() {
//       questionData = json.decode(jsonString);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (questionData == null) {
//       return Center(child: CircularProgressIndicator());
//     }
//
//     String question = questionData!['ioParameters']['_Question_'];
//     List answers = questionData!['ioParameters']['Answers  2'];
//
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             question,
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 16),
//           ...answers.map((answer) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(vertical: 4.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   bool isCorrect = answer['_Correct_'] ?? false;
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text(isCorrect ? "صح ✅" : "خطأ ❌"),
//                     ),
//                   );
//                 },
//                 child: Text(answer['_OptionText_']),
//               ),
//             );
//           }).toList(),
//         ],
//       ),
//     );
//   }
// }

//////////////////////////////////
 import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExerciseTab extends StatefulWidget {
const ExerciseTab({super.key});

@override
State<ExerciseTab> createState() => _ExerciseTabState();
}

class _ExerciseTabState extends State<ExerciseTab> {
List<dynamic> questions = [];
bool isLoading = true;

@override
void initState() {
super.initState();
loadQuestions();
}

Future<void> loadQuestions() async {
try {
String jsonString =
await rootBundle.loadString('images/data/QuestionSample.json2.json');

final data = json.decode(jsonString);

setState(() {
questions = data;
isLoading = false;
});
} catch (e) {
print("Error loading JSON: $e");
setState(() {
isLoading = false;
});
}
}

void showAnswerFeedback(Map<String, dynamic> answer) {
final bool isCorrect = answer['_Correct_'] ?? false;
final String chosenFeedback = answer['_ChosenFeedback_'] ?? 'No feedback';
final String tip = answer['_Tip_'] ?? '';

showDialog(
context: context,
builder: (context) {
return AlertDialog(
title: Text(isCorrect ? "Correct ✅" : "Wrong ❌"),
content: Column(
mainAxisSize: MainAxisSize.min,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(chosenFeedback),
const SizedBox(height: 10),
if (tip.isNotEmpty)
Text(
"Tip: $tip",
style: const TextStyle(
fontWeight: FontWeight.bold,
),
),
],
),
actions: [
TextButton(
onPressed: () => Navigator.pop(context),
child: const Text("OK"),
)
],
);
},
);
}

@override
Widget build(BuildContext context) {
if (isLoading) {
return const Center(
child: CircularProgressIndicator(),
);
}

if (questions.isEmpty) {
return const Center(
child: Text(
"No questions found",
style: TextStyle(fontSize: 18),
),
);
}

return ListView.builder(
padding: const EdgeInsets.all(16),
itemCount: questions.length,
itemBuilder: (context, index) {
final question = questions[index];

final String questionText = question['_Question_'] ?? '';
final List<dynamic> answers = question['Answers  2'] ?? [];

return Card(
margin: const EdgeInsets.only(bottom: 20),
elevation: 4,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(16),
),
child: Padding(
padding: const EdgeInsets.all(16),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
"Question ${index + 1}",
style: const TextStyle(
fontSize: 16,
fontWeight: FontWeight.bold,
color: Colors.blue,
),
),
const SizedBox(height: 10),
Text(
questionText,
style: const TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 16),

...answers.map<Widget>((answer) {
final String optionText = answer['_OptionText_'] ?? '';

return Padding(
padding: const EdgeInsets.symmetric(vertical: 6),
child: SizedBox( width: double.infinity,
child: ElevatedButton(
onPressed: () {
showAnswerFeedback(answer);
},
child: Text(optionText),
),
),
);
}).toList(),
],
),
),
);
},
);
}
}