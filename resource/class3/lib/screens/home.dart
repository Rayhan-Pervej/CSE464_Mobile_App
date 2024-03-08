import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final nameController = TextEditingController();
  final detailsController = TextEditingController();

  List<DropdownMenuItem> itemList = [
    DropdownMenuItem(
      child: Text("Hello"),
      value: "Hello",
    ),
    DropdownMenuItem(
      child: Text("Bye"),
      value: "Bye",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            /// Text view box
            Container(
              height: 120,
              color: Colors.amber,
              width: double.infinity,
              child: Center(child: Text(nameController.text)),
            ),
            const SizedBox(
              height: 10,
            ),

            /// Name input
            TextFormField(
              controller: nameController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.person),
                  fillColor: Colors.grey.shade100,
                  hintText: "Please enter your name"),
              onFieldSubmitted: (value) {
                setState(() {
                  nameController.text = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),

            /// Details input
            TextFormField(
              controller: detailsController,
              maxLines: 5,
              textInputAction: TextInputAction.newline,
              decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.details),
                  fillColor: Colors.grey.shade100,
                  hintText: "Please enter your name"),
              onFieldSubmitted: (value) {
                setState(() {
                  detailsController.text = value;
                });
              },
            ),

            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField(
                items: itemList,
                // items: ["hello", "bye"]
                //     .map(
                //       (element) =>
                //           DropdownMenuItem(
                //             value: element,
                //             child: Text(element.toString()
                //             )
                //             ),
                //     )
                //     .toList(),
                onChanged: (value) {})
          ],
        ),
      ),
    );
  }
}
