import 'package:flutter/material.dart';
import 'package:flutter_notion/core/constants.dart';
import 'package:flutter_notion/model/note.dart';
import 'package:flutter_notion/screens/edit_screen.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Notes',
          style: TextStyle(
            fontSize: 30,
            color: white,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade800.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.sort,
                  color: white,
                )),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade900,
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: kDouble10,
            ),
            TextField(
              style: TextStyle(color: white),
              maxLines: 1,
              cursorColor: white,
              decoration: InputDecoration(
                hintText: "Search notes...",
                hintStyle: TextStyle(color: grey),
                prefixIcon: Icon(
                  Icons.search,
                ),
                prefixIconColor: grey,
                fillColor: Color(0xFF424242),
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.circular(30),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(
              height: kDouble20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: sampleNotes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: kDouble5),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(kDouble15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    sampleNotes[index].title,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: kDouble20,
                                    ),
                                  ),
                                  Text(
                                    // 'This is note\'s content!',
                                    sampleNotes[index].content,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: black,
                                      fontSize: kDouble15,
                                    ),
                                  ),
                                  Text(
                                    'Edited: ${DateFormat('EEE MMM d, yyyy h:mm a').format(sampleNotes[index].modifiedTime)}',
                                    style: TextStyle(
                                      color: black.withOpacity(0.5),
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete),
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const EditScreen();
              },
            ),
          );

          if (result != null) {
            setState(() {
              sampleNotes.add(Note(
                  id: sampleNotes.length,
                  title: result[0],
                  content: result[1],
                  modifiedTime: DateTime.now()));
            });
          }
        },
        backgroundColor: grey,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDouble30),
        ),
        child: const Icon(
          Icons.add,
          color: white,
          size: kDouble30,
        ),
      ),
    );
  }
}
