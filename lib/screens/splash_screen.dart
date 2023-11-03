import 'dart:async';

import 'package:flutter/material.dart';
import 'package:polyglot/screens/home_screen.dart';

import '../Utils/Colors.dart';
import 'grid_view_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(child: Image.asset('assets/images/logo_gif.gif')),
      // Center(
      //   child: Row(
      //     mainAxisSize: MainAxisSize.min,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Column(
      //         mainAxisSize: MainAxisSize.min,
      //         mainAxisAlignment: MainAxisAlignment.end,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           SizedBox(
      //             width: 281,
      //             height: 339,
      //             child: Image.asset('assets/images/logo_gif.gif'),
      //           ),
      //           const SizedBox(height: 2.50),
      //           const Text(
      //             "POLYGLOT",
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontWeight: FontWeight.w600,
      //               fontSize: 48,
      //             ),
      //           ),
      //           const SizedBox(height: 2.50),
      //           const Text(
      //             "Translation made easier",
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 19.5,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
