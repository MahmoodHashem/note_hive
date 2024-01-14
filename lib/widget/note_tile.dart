

import 'package:flutter/material.dart';


class NoteTile extends StatelessWidget {
   NoteTile({Key? key, required this.title,
     required this.subtitle,
     required this.date,
     required this.delete,
     }) : super(key: key);

  final String title;
  final String subtitle;
  final String date;
  final Function()? delete;
 // final Function()? edit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF4E9E6),
        borderRadius: BorderRadius.circular(8),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            // onTap: edit,
            trailing: IconButton(onPressed: delete, icon: Icon(Icons.delete, size: 25,)),
            title: Text(title),
            subtitle: Text(subtitle),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15,0,0, 8),
            child: Text(date,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ), ),
          ),
        ],
      ),
    );
  }
}
