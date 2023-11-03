import 'dart:convert';
import 'dart:io';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:polyglot/Glot-AI/GlotAI_main.dart';
import 'package:polyglot/screens/explore_screen.dart';
import 'package:polyglot/screens/grid_view_screen.dart';
import 'package:polyglot/screens/more_details.dart';
import 'package:path_provider/path_provider.dart';

import '../Glot-AI/screens/chat_screen.dart';
import '../Sanket/main.dart';
import '../Utils/Colors.dart';
import 'output.dart';

var trString;

class Output extends StatefulWidget {
  final String output;
  final String language;
  const Output({key, required this.output, required this.language});

  @override
  State<Output> createState() => OutputState();
}

class OutputState extends State<Output> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   textEditingController = widget.output as TextEditingController;
    // });
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 30,
                    ),
                    const Text(
                      "Here's Your Translation!",
                      style: TextStyle(fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              width: size.width * .9,
                              height: size.height * .3,
                              margin: const EdgeInsets.all(16),
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 230, 230, 230),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: const [
                                  BoxShadow(blurRadius: 10, spreadRadius: .1)
                                ],
                              ),
                              child: Text(
                                  // "Your Output Will Appear Here..!"
                                  widget.output),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(.65, -1.5),
                            child: CircleAvatar(
                              backgroundColor: mainColor,
                              child: IconButton(
                                onPressed: () async {
                                  http.Response response = await http
                                      .post(
                                        Uri.parse(
                                          "https://polyglot-translation-speech.onrender.com/synthesize?format=mp3",
                                        ),
                                        headers: {
                                          'accept': 'application/json',
                                          'Content-Type': 'application/json'
                                        },
                                        body: jsonEncode(
                                          <String, String>{
                                            "text": widget.output
                                          },
                                        ),
                                      )
                                      .catchError(print)
                                      .whenComplete(() async {
                                    print("Request for audio is sent!");
                                    http.Response response = await http.get(
                                      Uri.parse(
                                          "https://polyglot-translation-speech.onrender.com/audio/output.mp3"),
                                    );
                                    print("Audio received..");
                                    print(response.body);
                                    print(response.bodyBytes);

                                    final dir =
                                        await getExternalStorageDirectory();
                                    String path = dir?.path ?? "";
                                    String musicFilePath =
                                        path + "/tempFiles/output.mp3";
                                    print(musicFilePath);
                                    File musicFile = File(musicFilePath);
                                    musicFile.createSync(recursive: true);
                                    musicFile
                                        .writeAsBytesSync(response.bodyBytes);
                                    AudioPlayer audioPlugin = AudioPlayer();
                                    await audioPlugin
                                        .setFilePath(musicFilePath);
                                    audioPlugin.play();
                                  });
                                  // showDialog(
                                  //     context: context,
                                  //     builder: (context) {
                                  //       return Container(
                                  //         width: size.width * .4,
                                  //         height: size.height * .5,
                                  //         child: Center(
                                  //             child: Text(
                                  //           "Your .mp3 File will be ready in Few Seconds!!",
                                  //           style: TextStyle(
                                  //               color: Colors.black,
                                  //               fontSize: 15),
                                  //         )),
                                  //       );
                                  //     });
                                },
                                icon: const Icon(
                                  Icons.music_note,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const Alignment(1, -1.5),
                            child: CircleAvatar(
                              backgroundColor: mainColor,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.copy,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (language.toLowerCase() == "english")
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SanketSign()));
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height / 3 - 50,
                              width: MediaQuery.of(context).size.width / 2 - 40,
                              decoration: BoxDecoration(
                                color: lightGrdColor.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/sign.png",
                                      height: 70,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text(
                                        'Sign Translate',
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.pacifico()
                                                .fontFamily,
                                            color: black,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ExploreScreen(
                                  output: widget.output,
                                  language: language,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 3 - 50,
                            width: MediaQuery.of(context).size.width / 2 - 40,
                            decoration: BoxDecoration(
                              color: darkGrdColor.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/explore.png",
                                    height: 70,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Word Meanings',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.pacifico().fontFamily,
                                          color: white,
                                          fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const GlotAI()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: mainColor,
                      radius: 25,
                      child: Image.asset(
                        "assets/images/robot_icon.png",
                        width: 30,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: size.width * .7,
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 230, 230, 230),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(blurRadius: 10, spreadRadius: 1)
                        ],
                      ),
                      child: Text("Want Some assistance?"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
