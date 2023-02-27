import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _HomescreenState();
}

TextEditingController txtname = TextEditingController();

var key = GlobalKey<FormState>();
int number = 1;
List<int> table = [];



class _HomescreenState extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text("Table ", ),
          elevation: 0,

        ),
        body: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: txtname,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      hintText: "Enter the number",

                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number = int.parse(txtname.text);
                      key.currentState!.validate();
                      for (int i = 1; i <= 10; i++) {
                        table.add(i);
                      }
                      print(number);
                      key.currentState!.deactivate();
                    });

                  },
                  child: Text("Submit"),),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25,left: 190),
                  child: Center(
                    child: ListView.builder(
                      itemBuilder: (context, index) => Text(
                          "${number} * ${index + 1} = ${number * (index + 1)}",style: TextStyle(fontSize: 25)),
                      itemCount: table.length,
                      shrinkWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}