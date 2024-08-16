import 'package:flutter/material.dart';
import 'package:testgrandle/widget/component/fouth/engtothai.dart';

class Fouthpage extends StatefulWidget {
  const Fouthpage({super.key});

  @override
  State<Fouthpage> createState() => _FouthpageState();
}

class _FouthpageState extends State<Fouthpage> {
  String ansoutput = '';
  bool statusbutton = true;
  void buttonset() {
    setState(() {
      statusbutton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController inputnumber = TextEditingController();
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          const Text("Input text Eng Number"),
          TextFormField(
            controller: inputnumber,
            keyboardType: TextInputType.name,
            maxLines: 1,
            minLines: 1,
            validator: (value) {
              if (value!.isEmpty) {
                return 'please Input number English';
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              hintText: 'Number English',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  testeng(inputnumber.text);
                });
              },
              child: const Text("logging")),
          Text(thainumber)
        ],
      ),
    );
  }
}
