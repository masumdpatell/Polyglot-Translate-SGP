// Dada KI Jay Ho

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:polyglot/screens/grid_view_screen.dart';
import 'package:polyglot/main.dart';
import 'output.dart';

List<String> languageList = <String>[
  'English',
  'Hindi',
  'Gujarati',
  'German',
  'French'
];

class InputText extends StatefulWidget {
  final String language;
  const InputText({key, required this.language});

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 36,
              ),
              const Text(
                "Type Your Text below",
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: textController,
                  minLines: 20,
                  maxLines: 20,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(height: 12),
              // Container(
              //   margin: const EdgeInsets.symmetric(horizontal: 68, vertical: 8),
              //   // width: size.width * .5,
              //   child: DropdownButton<String>(
              //     value: language,
              //     icon: const Icon(Icons.arrow_downward),
              //     elevation: 16,
              //     style: const TextStyle(color: Colors.deepPurple),
              //     underline: Container(
              //       height: 2,
              //       color: Colors.deepPurpleAccent,
              //     ),
              //     onChanged: (String? value) {
              //       // This is called when the user selects an item.
              //       setState(() {
              //         language = value!;
              //       });
              //     },
              //     items: languageList
              //         .map<DropdownMenuItem<String>>((String value) {
              //       return DropdownMenuItem<String>(
              //         value: value,
              //         child: Text(value),
              //       );
              //     }).toList(),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 24.0),
                child: ElevatedButton(
                  onPressed: () async {
                    print("Calling api2");
                    http.Response response = await http
                        .post(
                          Uri.parse(
                              "https://polyglot-translation-text.onrender.com/translate"),
                          headers: {
                            'accept': 'application/json',
                            'Content-Type': 'application/json'
                          },
                          body: jsonEncode(
                            <String, String>{
                              "text_TBT": textController.text.toString(),
                              "language": widget.language
                            },
                          ),
                        )
                        .catchError(print)
                        .whenComplete(() {
                      setState(() {
                        // isLoading = false;
                      });
                    });
                    var responseJson = utf8.decode(response.bodyBytes);
                    print("reposnse json" + responseJson.toString());
                    final jsonData = jsonDecode(responseJson);
                    output = jsonData['translation'];
                    print(output);
                    // print("\nobject" + jsonData.toString());
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Output(
                              output:
                                  // responseJson.toString(),
                                  jsonData['translation'],
                              language: language,
                            )));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Get Translation",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
