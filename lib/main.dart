import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_hive/note.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Note App'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){},
            child: Icon(Icons.add)
        ),
      )
    );
  }
}
