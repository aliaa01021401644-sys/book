import 'package:flutter/material.dart';

import 'chapter2.dart';
import 'chapterone.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override


      String? selectedChapter;

      @override
      Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
      title: Text("Select Chapter"),
      ),
      body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
      children: [
      DropdownButtonFormField<String>(
      decoration: InputDecoration(
      labelText: "اختار الشابتر",
      border: OutlineInputBorder(),
      ),
      value: selectedChapter,
      items: [
      DropdownMenuItem(
      value: "chapter1",
      child: Text("Chapter 1"),
      ),
      DropdownMenuItem(
      value: "chapter2",
      child: Text("Chapter 2"),
      ),
      ],
      onChanged: (value) {
      setState(() {
      selectedChapter = value;
      });

      if (value == "chapter1") {
      Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => chapter1(),
      ),
      );
      } else if (value == "chapter2") {
      Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => Chapter2(),
      ),
      );
      }
      },
      ),
      ],
      ),
      ),
      );
      }
      }

