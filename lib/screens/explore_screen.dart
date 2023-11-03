// Dada ki jay ho

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:http/http.dart' as http;
import 'package:polyglot/Glot-AI/constants/api_consts.dart';
import 'package:polyglot/screens/grid_view_screen.dart';

Future<String> wordMeaningApicall(String language, String output) async {
  http.Response response = await http.post(
    Uri.parse("https://api.openai.com/v1/chat/completions"),
    headers: {
      'Authorization': 'Bearer $API_KEY',
      "Content-Type": "application/json"
    },
    body: jsonEncode(
      {
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "user",
            "content":
                "Explain each words from the text as the same original language " +
                    language +
                    output
          },
        ],
        "max_tokens": 300,
      },
    ),
  );
  print(
      "OUTPUT ===> ${utf8.decode(jsonDecode(response.body)["choices"][0]["message"]["content"].toString().codeUnits).toString()}");
  print(response.body);
  return utf8.decode(jsonDecode(response.body)["choices"][0]["message"]
          ["content"]
      .toString()
      .codeUnits);
  // .jsonDecode(response.body)["choices"][0]["message"]["content"]
  // .toString()
  // .codeUnits
  // .toString();
}

class ExploreScreen extends StatefulWidget {
  final String output;
  final String language;
  const ExploreScreen({Key? key, required this.output, required this.language})
      : super(key: key);
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 30,
            ),
            const Text(
              "Here is the meaning of each word!",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 15,
            ),
            Container(
              width: size.width * .9,
              height: size.height * .8,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 230, 230),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [BoxShadow(blurRadius: 10, spreadRadius: .1)],
              ),
              child: FutureBuilder<String>(
                future: wordMeaningApicall(widget.language, widget.output),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            snapshot.data.toString(),
                            style: TextStyle(fontSize: 17),
                          ),
                          // Text(
                          //   snapshot.data.toString(),
                          //   style: TextStyle(fontSize: 17),
                          // ),
                          // Text(
                          //   snapshot.data.toString(),
                          //   style: TextStyle(fontSize: 17),
                          // ),
                          // Text(
                          //   snapshot.data.toString(),
                          //   style: TextStyle(fontSize: 17),
                          // ),
                          // Text(
                          //   snapshot.data.toString(),
                          //   style: TextStyle(fontSize: 17),
                          // ),
                        ],
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
