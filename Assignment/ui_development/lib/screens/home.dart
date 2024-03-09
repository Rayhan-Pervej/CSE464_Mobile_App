import 'package:flutter/material.dart';

class Note {
  final String note;
  final DateTime date;
  final String description;

  Note({
    required this.note,
    required this.date,
    required this.description,
  });
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Note> listOfNotes = [];
  final _formKey = GlobalKey<FormState>();
  late String _note;
  late String _description = '';
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task Board',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        elevation: 5,
        shadowColor: const Color.fromARGB(255, 0, 0, 0),
        backgroundColor: const Color.fromRGBO(255, 252, 238, 1),
      ),
      body: ListView.builder(
        controller: ScrollController(),
        itemCount: listOfNotes.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.only(
              left: 30,
              right: 30,
              top: index == 0 ? 25 : 8,
              bottom: 8,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            color: const Color.fromRGBO(255, 252, 238, 1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        listOfNotes[index].note,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Icon(
                                Icons.edit,
                                color: Colors.black,
                              )),
                          TextButton(
                              onPressed: () {},
                              child: const Icon(
                                Icons.delete,
                                color: Colors.black,
                              )),
                          Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.black,
                              // fillColor: MaterialStateProperty.resolveWith(
                              //     (states) => Colors.blue),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    listOfNotes[index].description,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${listOfNotes[index].date.day}/${listOfNotes[index].date.month}/${listOfNotes[index].date.year}',
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddItemDialog(context);
        },
        backgroundColor: const Color.fromARGB(255, 24, 24, 24),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  void _showAddItemDialog(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    _note = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the Task';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'Task'),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: TextFormField(
                    textInputAction: TextInputAction.newline,
                    maxLines: 20,
                    onChanged: (value) {
                      _description = value;
                    },
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter description';
                    //   }
                    //   return null;
                    // },
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                //very very important to understand
                StatefulBuilder(builder: (context, setState) {
                  return TextButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null && picked != selectedDate) {
                        setState(() {
                          selectedDate = picked;
                        });
                      }
                    },
                    child: Text(
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                    ),
                  );
                }),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                //didn't understand whats going on here
                if (_formKey.currentState!.validate()) {
                  final newNote = Note(
                    note: _note,
                    date: selectedDate,
                    description: _description,
                  );
                  setState(() {
                    listOfNotes.add(newNote);
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
