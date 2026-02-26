import 'package:flutter/material.dart';
import 'package:news/GlassaryModel.dart';
import 'package:news/GlossaryTab.dart';
import 'package:news/courseCard.dart';
import 'package:news/coursemodel.dart';
import 'package:news/lessonModel.dart';
import 'package:news/lessontile.dart';

import 'courseProgress.dart';

class CourseDetailsScreen extends StatelessWidget {
  final Course course;

  const CourseDetailsScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(course.title),
          bottom: const TabBar(
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(text: "Contents",),
              Tab(text: "Glossary"),
            ],
          ),
        ),
        body:  TabBarView(
      //     children: [
      //       ListView.builder(itemCount:course.lessons.length,itemBuilder:(context,index){
      //         return LessonTile(lesson:course.lessons[index]);
      //
      // }
      //       ),
      //
      //       // Center(child: Text("Lessons will be here")),
      //       Center(child: GlossaryTab(glossary: course.glossary,),
      //

         children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: CourseProgress(lessons: course.lessons),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: course.lessons.length,
                      itemBuilder: (context, index) {
                        return LessonTile(
                          lesson: course.lessons[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
              GlossaryTab(glossary: course.glossary),

            ]

          ),


        )

      );

  }
}