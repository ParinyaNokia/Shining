import 'package:flutter/material.dart';
import 'package:testgrandle/widget/component/third/recusive.dart';

class Thirdpage extends StatefulWidget {
  const Thirdpage({super.key});

  @override
  State<Thirdpage> createState() => _ThirdpageState();
}

class _ThirdpageState extends State<Thirdpage> {
  bool statusbutton = true;

  void buttonset() {
    setState(() {
      showabc();
      statusbutton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 250),
          const Text(
            "Recursive function",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    statusbutton ? buttonset() : null;
                  });
                },
                child: const Text("Answer")),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "this is Answer",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            outputAns,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
