import 'package:flutter/material.dart';
import 'package:news/GlassaryModel.dart';
import 'package:news/coursemodel.dart';
import 'package:news/courseCard.dart';
import 'package:news/lessonModel.dart';

class CoursesScreen extends StatelessWidget {
  CoursesScreen({super.key});

  final List<Course> courses = [
    Course(
        title: "Biology",
        description: "Biology is the study of living things",
        image: "assets/dart.png",
        lessons: [Lesson(type:LessonType.pdf,contentUrl:"",id:'2',title:'introduction to Biology', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")]),Lesson(type:LessonType.pdf,contentUrl:"kkkkk",id:'2',title:'Lesson1 ', duration: '10min', vedioUrl: 'assets/vedio/Firestore Adding - Getting User To Manageg User Specific 01.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")]),Lesson(type:LessonType.pdf,contentUrl:"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",id:'2',title:'Lesson1', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")]),Lesson(type:LessonType.pdf,contentUrl:"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",id:'2',title:'Lesson2', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")]),Lesson(type:LessonType.pdf,contentUrl:"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",id:'2',title:'lesson3', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")]),Lesson(type:LessonType.pdf,contentUrl:"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",id:'2',title:'Lesson4', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")]),Lesson(type:LessonType.pdf,contentUrl:"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",id:'2',title:'Lesson4', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")]),Lesson(type:LessonType.pdf,contentUrl:"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",id:'2',title:'introduction to flutter', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")]),Lesson(type:LessonType.pdf,contentUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",id:"12",title:'introduction to flutter', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")])],
        glossary: [Glossary(term: 'VSEPR notation', definition: "Valence Shell Electron Pair Repulsion notation")
          ,Glossary(term: ' Repulsive forces', definition: 'Forces that push particles away from each other  In VSEPR theory, electron pairs repel each other and try to stay as far apart as possible'),
          Glossary(term: 'Planar bond', definition: 'Likely means planar bond.A bond arrangement where atoms lie in the same flat plane.Example: Trigonal planar shape (120° bond angle).'),
          Glossary(term: 'Tetrahedral shape', definition: 'A three-dimensional molecular geometry where a central atom forms four bonds directed toward the corners of a tetrahedron.Bond angle ≈ 109.5°.'),
          Glossary(term: 'Terminal atoms', definition: 'Atoms bonded to the central atom and located at the outer positions of the molecule (not in the center).Example: In CH₄, hydrogen atoms are terminal atoms.'),
          Glossary(term: 'Free electrons (Lone pair electrons)', definition: 'Valence electrons that are not involved in bonding and remain on the central atom.'),Glossary(term: 'Valence shell electrons', definition: 'Electrons in the outermost energy level of an atom.They are responsible for chemical bonding.'),
          Glossary(term: 'Input', definition: 'Data entered into a system, program, or device.'),Glossary(term: 'Status', definition: 'The current condition or state of something (e.g., active, inactive, completed)'),Glossary(term: ' Type', definition: 'The category or data classification of a variable or object.  Example: int, String, double.'),
          Glossary(term: 'speakGender', definition: 'A variable or function name (programming term).It may represent the gender used for speech output (male/female voice)'),
          Glossary(term: ' ID', definition: 'Identifier. A unique value used to identify a person, object, or record in a system.Example: Student ID, User ID.'),

          Glossary(term: 'flutter', definition: 'openSource'),Glossary(term: 'flutter', definition: 'openSource'),Glossary(term: 'flutter', definition: 'openSource')]



    ),


    Course(
        title: "Biology",
        description: "Biology is the study of living things",
        image: "assets/flutter.png",
        lessons: [Lesson(lessonGlossary: [Glossary(term: 'Tetrahedral molecules',
            definition: " Molecules in which the central atom is bonded to four atoms arranged in a three-dimensional tetrahedral geometry (bond angle ≈ 109.5°")],type:LessonType.pdf,id:"11",contentUrl: "Aliaa Mohammed",title:'introduction to Biology', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),Lesson(type:LessonType.pdf,contentUrl:"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",id:"12",title:'introduction to Biology', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource"),])],
        glossary: [Glossary(term: 'VSEPR notation', definition: "Valence Shell Electron Pair Repulsion notation")
          ,Glossary(term: ' Repulsive forces', definition: 'Forces that push particles away from each other  In VSEPR theory, electron pairs repel each other and try to stay as far apart as possible'),
          Glossary(term: 'Planar bond', definition: 'Likely means planar bond.A bond arrangement where atoms lie in the same flat plane.Example: Trigonal planar shape (120° bond angle).'),
          Glossary(term: 'Tetrahedral shape', definition: 'A three-dimensional molecular geometry where a central atom forms four bonds directed toward the corners of a tetrahedron.Bond angle ≈ 109.5°.'),
          Glossary(term: 'Terminal atoms', definition: 'Atoms bonded to the central atom and located at the outer positions of the molecule (not in the center).Example: In CH₄, hydrogen atoms are terminal atoms.'),
          Glossary(term: 'Free electrons (Lone pair electrons)', definition: 'Valence electrons that are not involved in bonding and remain on the central atom.'),Glossary(term: 'Valence shell electrons', definition: 'Electrons in the outermost energy level of an atom.They are responsible for chemical bonding.'),
          Glossary(term: 'Input', definition: 'Data entered into a system, program, or device.'),Glossary(term: 'Status', definition: 'The current condition or state of something (e.g., active, inactive, completed)'),Glossary(term: ' Type', definition: 'The category or data classification of a variable or object.  Example: int, String, double.'),
          Glossary(term: 'speakGender', definition: 'A variable or function name (programming term).It may represent the gender used for speech output (male/female voice)'),
          Glossary(term: ' ID', definition: 'Identifier. A unique value used to identify a person, object, or record in a system.Example: Student ID, User ID.'),

          Glossary(term: 'flutter', definition: 'openSource'),Glossary(term: 'flutter', definition: 'openSource'),Glossary(term: 'flutter', definition: 'openSource')]

    ),

    Course(
        title: "Biology",
        description: "Biology is the study of living things",
        image: "assets/flutter.png",
        lessons: [Lesson(lessonGlossary: [Glossary(term: 'Tetrahedral molecules',
            definition: " Molecules in which the central atom is bonded to four atoms arranged in a three-dimensional tetrahedral geometry (bond angle ≈ 109.5°")],type:LessonType.pdf,id:"11",contentUrl: "Aliaa Mohammed",title:'introduction to Biology', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),Lesson(type:LessonType.pdf,contentUrl:"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",id:"12",title:'introduction to Biology', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")])],
        glossary: [Glossary(term: 'VSEPR notation', definition: "Valence Shell Electron Pair Repulsion notation")
          ,Glossary(term: ' Repulsive forces', definition: 'Forces that push particles away from each other  In VSEPR theory, electron pairs repel each other and try to stay as far apart as possible'),
          Glossary(term: 'Planar bond', definition: 'Likely means planar bond.A bond arrangement where atoms lie in the same flat plane.Example: Trigonal planar shape (120° bond angle).'),
          Glossary(term: 'Tetrahedral shape', definition: 'A three-dimensional molecular geometry where a central atom forms four bonds directed toward the corners of a tetrahedron.Bond angle ≈ 109.5°.'),
          Glossary(term: 'Terminal atoms', definition: 'Atoms bonded to the central atom and located at the outer positions of the molecule (not in the center).Example: In CH₄, hydrogen atoms are terminal atoms.'),
          Glossary(term: 'Free electrons (Lone pair electrons)', definition: 'Valence electrons that are not involved in bonding and remain on the central atom.'),Glossary(term: 'Valence shell electrons', definition: 'Electrons in the outermost energy level of an atom.They are responsible for chemical bonding.'),
          Glossary(term: 'Input', definition: 'Data entered into a system, program, or device.'),Glossary(term: 'Status', definition: 'The current condition or state of something (e.g., active, inactive, completed)'),Glossary(term: ' Type', definition: 'The category or data classification of a variable or object.  Example: int, String, double.'),
          Glossary(term: 'speakGender', definition: 'A variable or function name (programming term).It may represent the gender used for speech output (male/female voice)'),
          Glossary(term: ' ID', definition: 'Identifier. A unique value used to identify a person, object, or record in a system.Example: Student ID, User ID.'),

          Glossary(term: 'flutter', definition: 'openSource'),Glossary(term: 'flutter', definition: 'openSource'),Glossary(term: 'flutter', definition: 'openSource')]

    ),
    Course(
      title: "Flutter Basics",
      description: "Learn Flutter from scratch",
      image: "assets/flutter.png",
        lessons: [Lesson(lessonGlossary: [Glossary(term: 'Tetrahedral molecules',
   definition: " Molecules in which the central atom is bonded to four atoms arranged in a three-dimensional tetrahedral geometry (bond angle ≈ 109.5°")],type:LessonType.pdf,id:"11",contentUrl: "Aliaa Mohammed",title:'introduction to flutter', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),Lesson(type:LessonType.pdf,contentUrl:"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",id:"12",title:'introduction to flutter', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")])],
      glossary: [Glossary(term: 'VSEPR notation', definition: "Valence Shell Electron Pair Repulsion notation")
  ,Glossary(term: ' Repulsive forces', definition: 'Forces that push particles away from each other  In VSEPR theory, electron pairs repel each other and try to stay as far apart as possible'),
  Glossary(term: 'Planar bond', definition: 'Likely means planar bond.A bond arrangement where atoms lie in the same flat plane.Example: Trigonal planar shape (120° bond angle).'),
  Glossary(term: 'Tetrahedral shape', definition: 'A three-dimensional molecular geometry where a central atom forms four bonds directed toward the corners of a tetrahedron.Bond angle ≈ 109.5°.'),
  Glossary(term: 'Terminal atoms', definition: 'Atoms bonded to the central atom and located at the outer positions of the molecule (not in the center).Example: In CH₄, hydrogen atoms are terminal atoms.'),
  Glossary(term: 'Free electrons (Lone pair electrons)', definition: 'Valence electrons that are not involved in bonding and remain on the central atom.'),Glossary(term: 'Valence shell electrons', definition: 'Electrons in the outermost energy level of an atom.They are responsible for chemical bonding.'),
  Glossary(term: 'Input', definition: 'Data entered into a system, program, or device.'),Glossary(term: 'Status', definition: 'The current condition or state of something (e.g., active, inactive, completed)'),Glossary(term: ' Type', definition: 'The category or data classification of a variable or object.  Example: int, String, double.'),
  Glossary(term: 'speakGender', definition: 'A variable or function name (programming term).It may represent the gender used for speech output (male/female voice)'),
  Glossary(term: ' ID', definition: 'Identifier. A unique value used to identify a person, object, or record in a system.Example: Student ID, User ID.'),

  Glossary(term: 'flutter', definition: 'openSource'),Glossary(term: 'flutter', definition: 'openSource'),Glossary(term: 'flutter', definition: 'openSource')]

    ),
    Course(
        title: "Flutter Basics",
        description: "Learn Flutter from scratch",
        image: "assets/flutter.png",
        lessons: [Lesson(lessonGlossary: [Glossary(term: 'Tetrahedral molecules',
            definition: " Molecules in which the central atom is bonded to four atoms arranged in a three-dimensional tetrahedral geometry (bond angle ≈ 109.5°")],type:LessonType.pdf,id:"11",contentUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",title:'introduction to flutter', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),Lesson(type:LessonType.pdf,contentUrl:"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",id:"12",title:'introduction to flutter', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")])],
        glossary: [Glossary(term: 'VSEPR notation', definition: "Valence Shell Electron Pair Repulsion notation")
          ,Glossary(term: ' Repulsive forces', definition: 'Forces that push particles away from each other  In VSEPR theory, electron pairs repel each other and try to stay as far apart as possible'),
          Glossary(term: 'Planar bond', definition: 'Likely means planar bond.A bond arrangement where atoms lie in the same flat plane.Example: Trigonal planar shape (120° bond angle).'),
          Glossary(term: 'Tetrahedral shape', definition: 'A three-dimensional molecular geometry where a central atom forms four bonds directed toward the corners of a tetrahedron.Bond angle ≈ 109.5°.'),
          Glossary(term: 'Terminal atoms', definition: 'Atoms bonded to the central atom and located at the outer positions of the molecule (not in the center).Example: In CH₄, hydrogen atoms are terminal atoms.'),
          Glossary(term: 'Free electrons (Lone pair electrons)', definition: 'Valence electrons that are not involved in bonding and remain on the central atom.'),Glossary(term: 'Valence shell electrons', definition: 'Electrons in the outermost energy level of an atom.They are responsible for chemical bonding.'),
          Glossary(term: 'Input', definition: 'Data entered into a system, program, or device.'),Glossary(term: 'Status', definition: 'The current condition or state of something (e.g., active, inactive, completed)'),Glossary(term: ' Type', definition: 'The category or data classification of a variable or object.  Example: int, String, double.'),
          Glossary(term: 'speakGender', definition: 'A variable or function name (programming term).It may represent the gender used for speech output (male/female voice)'),
          Glossary(term: ' ID', definition: 'Identifier. A unique value used to identify a person, object, or record in a system.Example: Student ID, User ID.'),

          Glossary(term: 'flutter', definition: 'openSource'),Glossary(term: 'flutter', definition: 'openSource'),Glossary(term: 'flutter', definition: 'openSource')]

    ),
    Course(
      title: "Advanced Dart",
      description: "Deep dive into Dart",
      image: "assets/dart.png",
        lessons: [Lesson(type:LessonType.pdf,contentUrl:"",id:'2',title:'introduction to flutter', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")]),Lesson(type:LessonType.pdf,contentUrl:"kkkkk",id:'2',title:'introduction to flutter', duration: '10min', vedioUrl: 'assets/vedio/Firestore Adding - Getting User To Manageg User Specific 01.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")]),Lesson(type:LessonType.pdf,contentUrl:"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",id:'2',title:'introduction to flutter', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")]),Lesson(type:LessonType.pdf,contentUrl:"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",id:'2',title:'introduction to flutter', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")]),Lesson(type:LessonType.pdf,contentUrl:"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",id:'2',title:'introduction to flutter', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")]),Lesson(type:LessonType.pdf,contentUrl:"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",id:'2',title:'introduction to flutter', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")]),Lesson(type:LessonType.pdf,contentUrl:"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",id:'2',title:'introduction to flutter', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")]),Lesson(type:LessonType.pdf,contentUrl:"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",id:'2',title:'introduction to flutter', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")]),Lesson(type:LessonType.pdf,contentUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",id:"12",title:'introduction to flutter', duration: '10min', vedioUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',lessonGlossary: [Glossary(term: 'Flutter', definition: "OpenSource")])],
        glossary: [Glossary(term: 'Dart', definition: 'programming lanaguage used in flutter'),Glossary(term: 'Dart', definition: 'programming lanaguage used in flutter'),Glossary(term: 'Dart', definition: 'programming lanaguage used in flutter'),Glossary(term: 'Dart', definition: 'programming lanaguage used in flutter'),Glossary(term: 'Dart', definition: 'programming lanaguage used in flutter')]


    ),
  ];
//https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Courses"),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return CourseCard(course: courses[index]);
        },
      ),
    );
  }
}