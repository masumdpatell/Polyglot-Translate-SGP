import 'package:flutter/material.dart';

class TranslateInputScreen extends StatelessWidget {
  const TranslateInputScreen({Key? key}) : super(key: key);

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
      bottomSheet: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: Color(0xff4b9700),
        ),
        child: const SizedBox(
          height: 40,
          width: double.infinity,
          child: Center(
            child: Text(
              'Translate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Type your text below!',
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
                  child: const TextField(
                    expands: true,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Type here...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
