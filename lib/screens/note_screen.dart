import 'package:flutter/material.dart';
import 'package:note_hive/model/boxes.dart';
import 'package:note_hive/note.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {



  @override
  Widget build(BuildContext context) {
    String? title;
    String? content;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onChanged: (newTitle){
                  title = newTitle;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Contents",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                onChanged: (newContent){
                  content = newContent;
                },
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
                    noteBoxes.put("key_${title!}",
                        Note(title: title!, content: content!));

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
                margin: EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: 7,
                    itemBuilder: (context, index){
                      return Card(
                        child: ListTile(
                          title: Text('mahmood'),
                        ),
                      );
                    }
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
