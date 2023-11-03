import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TranslateOutputScreen extends StatelessWidget {
  const TranslateOutputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80.0,
        title: const Text(
          'POLYGLOT',
          style: TextStyle(color: Color(0xff545454), fontSize: 28.0),
        ),
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: CircleAvatar(
            minRadius: 20,
            maxRadius: 30,
          ),
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Here's your translation!",
                style: TextStyle(
                  color: Color(0xff4b9600),
                  fontSize: 28,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xff4b9700),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(CupertinoIcons.speaker_2, color: Colors.white,),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xff4b9700),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.copy_rounded, color: Colors.white,),
                            ),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: TextField(
                          expands: true,
                          maxLines: null,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: const Color(0xff4b9700),
                      child: Image.asset(
                        'assets/images/robot_icon.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade400),
                        onPressed: () {},
                        child: const Text(
                          'Want some assistance?',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
