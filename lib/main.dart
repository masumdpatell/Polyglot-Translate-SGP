// Dada KI Jay HO
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:polyglot/Glot-AI/GlotAI_main.dart';
import 'package:polyglot/screens/home_screen.dart';
import 'package:polyglot/screens/sign_in_screen.dart';
import 'package:polyglot/screens/sign_up_screen.dart';
import 'package:polyglot/screens/splash_screen.dart';
import 'package:polyglot/screens/translation_input_screen.dart';
import 'package:polyglot/screens/translation_output_screen.dart';

String output = "";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'PolyGlot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      // home: const SignInScreen(),
      // home: const SignUpScreen(),
      // home: const HomeScreen(),
      // home: const TranslateInputScreen(),
      // home: const TranslateOutputScreen(),
      // home: const DemoScreen(),
    );
  }
}

class DemoScreen extends StatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  String get_image_base64(image) {
    var buffer = image.buffer;
    String base64Image = base64.encode(Uint8List.view(buffer));
    return base64Image;
  }

  @override
  Widget build(BuildContext context) {
    String? imageString;
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await rootBundle
                      .load('assets/images/camera_icon.png')
                      .then((value) {
                    setState(() {
                      imageString = get_image_base64(value);
                    });
                  });
                  print(imageString);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NextScreen(xys: imageString)));
                  print('Donee');
                  // print(base64String);
                },
                child: Text('Press'),
              ),
              imageString != null
                  ? Text(
                      imageString!,
                      style: TextStyle(color: Colors.black),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key, required this.xys}) : super(key: key);
  final String? xys;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: xys != null ? Text(xys!) : SizedBox(),
    );
  }
}
