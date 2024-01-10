import 'package:flutter/material.dart';
import 'package:note_hive/model/boxes.dart';
import 'package:note_hive/note.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
           controller: title,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: content,
              decoration: InputDecoration(
                labelText: "Contents",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(10))
              ),
              onPressed: (){
                setState(() {
                  noteBoxes.put("key_$title",
                      Note(title: title.text, content: content.text));
                  title.clear();
                  content.clear();
                });
              },
            child: Text("Add To List",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
            ),
          ),
            Expanded(
              child: Container(
                color: Colors.blueGrey,
                margin: const EdgeInsets.all(10),
                child: ListView.builder(
              itemCount: noteBoxes.length,
                itemBuilder: (context, index){
                Note note = noteBoxes.getAt(index)!;
                  return Card(
                    child: ListTile(
                      leading:  IconButton(onPressed: (){
                        setState(() {
                          noteBoxes.deleteAt(index);
                        });
                      }, icon: const Icon(Icons.remove_circle_outline)),
                      title: Text(note.title),
                      subtitle: Text(note.content),
                    ),
                  );
                }
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
                onPressed:(){
              setState(() {
                noteBoxes.clear();
              });
            }, child: Text("Delete",
            style: TextStyle(
              fontSize: 20,
            ),
            ),

            )
          ],
        ),
      ),
    );
  }
}
