import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_hive/model/boxes.dart';
import 'package:note_hive/note.dart';
import 'package:provider/provider.dart';
import 'screens/note_screen.dart';


void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
   noteBoxes = await Hive.openBox('noteBox');
  runApp( MaterialApp(
      home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  NoteScreen(); 
  }
}
