import 'package:flutter/material.dart';
import 'package:flutter_notion/core/constants.dart';
import 'package:flutter_notion/model/note.dart';

class EditScreen extends StatefulWidget {
  final Note? note;
  const EditScreen({super.key, this.note,});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController _titleController = TextEditingController();
  late TextEditingController _contentController = TextEditingController();

  // Save note
  void saveNote() {
    Navigator.pop(context, [_titleController.text, _contentController.text]);
  }

  @override
  void initState() {
    if (widget.note != null) {
      _titleController = TextEditingController(text: widget.note!.title);
      _contentController = TextEditingController(text: widget.note!.content);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: white),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: kDouble20),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              style: TextStyle(
                  color: white,
                  fontSize: kDouble30,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
                hintStyle: TextStyle(
                    color: grey,
                    fontSize: kDouble30,
                    fontWeight: FontWeight.bold),
              ),
              cursorColor: white,
            ),
            TextField(
              controller: _contentController,
              style: TextStyle(
                color: white,
                fontSize: kDouble20,
              ),
              decoration: InputDecoration(
                hintText: 'Type something here',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: grey,
                  fontSize: kDouble20,
                ),
              ),
              cursorColor: white,
              maxLines: null,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveNote();
        },
        backgroundColor: grey,
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
        elevation: kDouble10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDouble30),
        ),
      ),
    );
  }
}
