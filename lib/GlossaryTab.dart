import 'package:flutter/material.dart';
import 'package:news/GlassaryModel.dart';
import 'package:news/lessonModel.dart';

class GlossaryTab extends StatefulWidget {
  final List<Glossary> glossary;

  const GlossaryTab({super.key, required this.glossary});

  @override
  State<GlossaryTab> createState() => _GlossaryTabState();
}

class _GlossaryTabState extends State<GlossaryTab> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    final filteredGlossary = widget.glossary
        .where((g) =>
        g.term.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search term...",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredGlossary.length,
            itemBuilder: (context, index) {
              final item = filteredGlossary[index];




              return ExpansionTile(
                title: Text(item.term,style: TextStyle(color: Colors.black),),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(item.definition,style: TextStyle(color: Colors.black)),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}