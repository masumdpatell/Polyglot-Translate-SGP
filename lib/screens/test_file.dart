import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polyglot/screens/grid_view_screen.dart';
import 'package:http/http.dart' as http;

import '../Utils/Colors.dart';
import 'output.dart';

class TestPage extends StatefulWidget {
  const TestPage({key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Select Language For Translation"),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 68, vertical: 8),
            // width: size.width * .5,
            child: DropdownButton<String>(
              value: language,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  language = value!;
                });
              },
              items: languageList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: SizedBox(
              width: 300,
              height: 60,
              child: ElevatedButton(
                onPressed: () async {
                  print("Calling api");
                  print(base64Image);

                  setState(() {
                    isLoading = true;
                  });
                  http.Response response = await http
                      .post(
                        Uri.parse(
                            "https://polyglot-translation.onrender.com/translate"),
                        headers: {
                          'accept': 'application/json',
                          'Content-Type': 'application/json'
                        },
                        body: jsonEncode(
                          <String, String>{
                            "base64_image": base64Image,
                            "language": language
                          },
                        ),
                      )
                      .catchError(print)
                      .whenComplete(() {
                    setState(() {
                      isLoading = false;
                    });
                  });

                  // print("response.body" + response.body.toString());
                  var responseJson = utf8.decode(response.bodyBytes);
                  print("reposnse json" + responseJson.toString());
                  final jsonData = jsonDecode(responseJson);
                  // print("\nobject" + jsonData.toString());
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Output(
                            output:
                                // responseJson.toString(),
                                jsonData['translation'],
                            language: language,
                          )));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: isLoading
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Translating ...    ",
                            style: TextStyle(fontSize: 20),
                          ),
                          CircularProgressIndicator(
                            color: Colors.white,
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get Translation",
                            style: TextStyle(
                                color: white,
                                fontFamily: GoogleFonts.ubuntu().fontFamily,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.arrow_right_alt_rounded,
                              size: 30,
                            ),
                          )
                        ],
                      ),
              ),
            ),
          ),
          // ElevatedButton(
          //   onPressed: () async {
          //     print("Calling api");
          //     print(base64Image);

          //     setState(() {
          //       isLoading = true;
          //     });
          //     http.Response response = await http
          //         .post(
          //           Uri.parse(
          //               "https://polyglot-translation.onrender.com/translate"),
          //           headers: {
          //             'accept': 'application/json',
          //             'Content-Type': 'application/json'
          //           },
          //           body: jsonEncode(
          //             <String, String>{
          //               "base64_image": base64Image,
          //               "language": language
          //             },
          //           ),
          //         )
          //         .catchError(print)
          //         .whenComplete(() {
          //       setState(() {
          //         isLoading = false;
          //       });
          //     });

          //     // print("response.body" + response.body.toString());
          //     var responseJson = utf8.decode(response.bodyBytes);
          //     print("reposnse json" + responseJson.toString());
          //     final jsonData = jsonDecode(responseJson);
          //     // print("\nobject" + jsonData.toString());
          //     Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => Output(
          //               output:
          //                   // responseJson.toString(),
          //                   jsonData['translation'],
          //             )));
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: isLoading
          //         ? Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: const [
          //               Text(
          //                 "Translating ...    ",
          //                 style: TextStyle(fontSize: 20),
          //               ),
          //               CircularProgressIndicator(
          //                 color: Colors.white,
          //               )
          //             ],
          //           )
          //         : const Text(
          //             "Get Translation",
          //             style: TextStyle(fontSize: 18),
          //           ),
          //   ),
          // ),
        ],
      ),
    ));
  }
}
