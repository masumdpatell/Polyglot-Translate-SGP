import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:polyglot/Sanket/main.dart';
import 'package:polyglot/main.dart';
import 'package:polyglot/screens/test_file.dart';

import '../Utils/Colors.dart';
import 'InputText.dart';
import 'output.dart';

late final String respose;

bool isLoading = false;
int stepCount = 0;
String language = "English";
String base64Image = "";
List<String> languageList = <String>[
  "Afrikaans",
  "Albanian",
  "Amharic",
  "Arabic",
  "Armenian",
  "Assamese",
  "Aymara",
  "Azerbaijani",
  "Bambara",
  "Basque",
  "Belarusian",
  "Bengali",
  "Bhojpuri",
  "Bosnian",
  "Bulgarian",
  "Catalan",
  "Cebuano",
  "Chichewa",
  "Chinese (Simplified)",
  "Chinese (Traditional)",
  "Corsican",
  "Croatian",
  "Czech",
  "Danish",
  "Dhivehi",
  "Dogri",
  "Dutch",
  "English",
  "Esperanto",
  "Estonian",
  "Ewe",
  "Filipino",
  "Finnish",
  "French",
  "Frisian",
  "Galician",
  "Georgian",
  "German",
  "Greek",
  "Guarani",
  "Gujarati",
  "Haitian Creole",
  "Hausa",
  "Hawaiian",
  "Hebrew",
  "Hindi",
  "Hmong",
  "Hungarian",
  "Icelandic",
  "Igbo",
  "Ilocano",
  "Indonesian",
  "Irish",
  "Italian",
  "Japanese",
  "Javanese",
  "Kannada",
  "Kazakh",
  "Khmer",
  "Kinyarwanda",
  "Konkani",
  "Korean",
  "Krio",
  "Kurdish (Kurmanji)",
  "Kurdish (Sorani)",
  "Kyrgyz",
  "Lao",
  "Latin",
  "Latvian",
  "Lingala",
  "Lithuanian",
  "Luganda",
  "Luxembourgish",
  "Macedonian",
  "Maithili",
  "Malagasy",
  "Malay",
  "Malayalam",
  "Maltese",
  "Maori",
  "Marathi",
  "Meiteilon (Manipuri)",
  "Mizo",
  "Mongolian",
  "Myanmar (Burmese)",
  "Nepali",
  "Norwegian",
  "Odia (Oriya)",
  "Oromo",
  "Pashto",
  "Persian",
  "Polish",
  "Portuguese",
  "Punjabi",
  "Quechua",
  "Romanian",
  "Russian",
  "Samoan",
  "Sanskrit",
  "Scots Gaelic",
  "Sepedi",
  "Serbian",
  "Sesotho",
  "Shona",
  "Sindhi",
  "Sinhala",
  "Slovak",
  "Slovenian",
  "Somali",
  "Spanish",
  "Sundanese",
  "Swahili",
  "Swedish",
  "Tajik",
  "Tamil",
  "Tatar",
  "Telugu",
  "Thai",
  "Tigrinya",
  "Tsonga",
  "Turkish",
  "Turkmen",
  "Twi",
  "Ukrainian",
  "Urdu",
  "Uyghur",
  "Uzbek",
  "Vietnamese",
  "Welsh",
  "Xhosa",
  "Yiddish",
  "Yoruba",
  "Zulu"
];
var jsonData = jsonDecode(responseJson);
var responseJson;
// File cameraFile = null as File;

// File cameraFile = null as File;

class HomeScreen extends StatefulWidget {
  const HomeScreen({key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    pickImage() async {
      final ImagePicker imagePicker = ImagePicker();
      final XFile? image =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        return image;
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                height: size.height * .77,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            'PolyGlot',
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 45.0,
                                letterSpacing: 3,
                                fontFamily: GoogleFonts.pacifico().fontFamily),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              'Translation Made Easier',
                              style: TextStyle(
                                  color: iconColor3,
                                  fontSize: 18.0,
                                  fontFamily: GoogleFonts.lobster().fontFamily),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final ImagePicker _picker = ImagePicker();
                              final XFile? photo = await _picker.pickImage(
                                source: ImageSource.camera,
                                maxHeight: 500,
                                maxWidth: 500,
                              );
                              String path = photo?.path ?? "";
                              if (path.isEmpty) return null;
                              File cameraFile = File(path);
                              var bytes = cameraFile.readAsBytesSync();
                              base64Image = base64Encode(bytes);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Image.file(cameraFile);
                                },
                              );
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height / 3 - 50,
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
                                      "assets/images/camera.png",
                                      height: 70,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text(
                                        'Scan Image',
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.pacifico()
                                                .fontFamily,
                                            color: white,
                                            fontSize: 25),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              var selectedImage = await pickImage();
                              if (selectedImage != null) {
                                File imageFile = File(selectedImage.path);
                                var bytes = imageFile.readAsBytesSync();
                                base64Image = base64Encode(bytes);
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Image.file(imageFile);
                                    });
                              }
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
                                      "assets/images/folder.png",
                                      height: 70,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text(
                                        'Upload Photo',
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.pacifico()
                                                .fontFamily,
                                            color: black,
                                            fontSize: 21),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => InputText(
                                        language: language,
                                      )));
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
                                      "assets/images/font.png",
                                      height: 70,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text(
                                        'Enter Text',
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.pacifico()
                                                .fontFamily,
                                            color: black,
                                            fontSize: 25),
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
                                  builder: (context) => SanketSign(
                                    isFromHome: true,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height / 3 - 50,
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
                                            color: white,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // InkWell(
                          //   onTap: () {
                          //     // Navigator.of(context).push(MaterialPageRoute(
                          //     //     builder: (context) => SanketSign()
                          //     //     ));
                          //   },
                          //   child: Container(
                          //     height:
                          //         MediaQuery.of(context).size.height / 3 - 50,
                          //     width: MediaQuery.of(context).size.width / 2 - 40,
                          //     decoration: BoxDecoration(
                          //       color: darkGrdColor.withOpacity(0.8),
                          //       borderRadius: BorderRadius.circular(20),
                          //     ),
                          //     child: Center(
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //           Image.asset(
                          //             "assets/images/info.png",
                          //             height: 70,
                          //           ),
                          //           Padding(
                          //             padding: const EdgeInsets.only(top: 20),
                          //             child: Text(
                          //               'About Us',
                          //               style: TextStyle(
                          //                   fontFamily: GoogleFonts.pacifico()
                          //                       .fontFamily,
                          //                   color: white,
                          //                   fontSize: 20),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ]),
              ),
              Container(
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
                  items: languageList
                      .map<DropdownMenuItem<String>>((String value) {
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
                      setState(() {
                        responseJson = utf8.decode(response.bodyBytes);
                        jsonData = jsonDecode(responseJson);
                      });
                      print("reposnse json" + responseJson.toString());
                      output = jsonData['translation'];
                      // print("\nobject" + jsonData.toString());
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Output(
                            output:
                                // responseJson.toString(),
                                jsonData['translation'],
                            language: language,
                          ),
                        ),
                      );
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
                                "Translating..",
                                style: TextStyle(
                                  color: white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
