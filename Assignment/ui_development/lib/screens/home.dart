import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List listOfItems = [];
  List listOfDates = [];

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
        itemCount: listOfItems.length,
        itemBuilder: (context, index) {
          return Card(
              elevation: 3,
              margin: EdgeInsets.only(
                  left: 30, right: 30, top: index == 0 ? 25 : 8, bottom: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              color: const Color.fromRGBO(255, 252, 238, 1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      listOfItems[index].toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'You just added a task in the bar so far.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      listOfDates[index].toString(),
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            listOfItems.add('Task ${listOfItems.length + 1}');
            listOfDates.add(
                ('${DateTime.now().hour}:${DateTime.now().minute} ${DateTime.now().hour < 12 ? 'AM' : 'PM'} ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'));
          });
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
}
