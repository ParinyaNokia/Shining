// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
// import 'package:testgrandle/widget/component/first/exceltojson.dart';
import 'package:testgrandle/widget/component/first/readtype.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        const Text("EXCEL TO JSON"),
        ElevatedButton(
            onPressed: () async {
              String jsonResult = await loadExcelFromAssets();

              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('JSON Result'),
                    content: SingleChildScrollView(
                      child: Text(jsonResult),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text("Read")),
        // Center(
        //   child: ElevatedButton(
        //     onPressed: () async {
        //       String jsonResult = await excelToJson();
        //       showDialog(
        //         context: context,
        //         builder: (context) {
        //           return AlertDialog(
        //             title: Text('JSON Result'),
        //             content: SingleChildScrollView(
        //               child: Text(jsonResult),
        //             ),
        //             actions: [
        //               TextButton(
        //                 onPressed: () {
        //                   Navigator.of(context).pop();
        //                 },
        //                 child: Text('Close'),
        //               ),
        //             ],
        //           );
        //         },
        //       );
        //     },
        //     child: Text("Excel"),
        //   ),
        // ),
      ],
    );
  }
}
