import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Welcome ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 48,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "to",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 48,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Polyglot",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 64,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 13.73),
              const Divider(
                color: Color(0xFF9F9F9F),
                thickness: 5,
                height: 20,
              ),
              const SizedBox(height: 13.73),
              const Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Color(0xff4b9600),
                    fontSize: 40,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 13.73),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Username',
                      hintStyle: TextStyle(fontWeight: FontWeight.w500),
                      isDense: true,
                      filled: true,
                      fillColor: Color(0xffebebeb),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              const SizedBox(height: 13.73),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(fontWeight: FontWeight.w500),
                      isDense: true,
                      filled: true,
                      fillColor: Color(0xffebebeb),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              const SizedBox(height: 13.73),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(fontWeight: FontWeight.w500),
                      isDense: true,
                      filled: true,
                      fillColor: Color(0xffebebeb),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              const SizedBox(height: 13.73),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: const Color(0xff4b9600),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 13.73),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Already have an account? Sign In",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      color: Color(0xff676767),
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 13.73),
              // SizedBox(
              //   width: 291,
              //   height: 24,
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: const [
              //       SizedBox(width: 7),
              //       Text(
              //         "OR",
              //         style: TextStyle(
              //           color: Color(0xff6f6f6f),
              //           fontSize: 20,
              //           fontFamily: "Inter",
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //       SizedBox(width: 7),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 13.73),
              // SizedBox(
              //   width: 271,
              //   height: 43,
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Container(
              //         width: 271,
              //         height: 43,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: const Color(0xffebebeb),
              //         ),
              //         padding: const EdgeInsets.only(
              //           left: 16,
              //           right: 53,
              //         ),
              //         child: Row(
              //           mainAxisSize: MainAxisSize.min,
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: const [
              //             SizedBox(
              //               width: 21,
              //               height: 21,
              //               child: FlutterLogo(size: 21),
              //             ),
              //             SizedBox(width: 15),
              //             Text(
              //               "Continue with Google",
              //               style: TextStyle(
              //                 color: Color(0xff6f6f6f),
              //                 fontSize: 16,
              //                 fontFamily: "Inter",
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 13.73),
              // SizedBox(
              //   width: 271,
              //   height: 43,
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Container(
              //         width: 271,
              //         height: 43,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: const Color(0xffebebeb),
              //         ),
              //         padding: const EdgeInsets.only(
              //           left: 16,
              //           right: 35,
              //         ),
              //         child: Row(
              //           mainAxisSize: MainAxisSize.min,
              //           mainAxisAlignment: MainAxisAlignment.end,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: const [
              //             SizedBox(
              //               width: 21,
              //               height: 21,
              //               child: FlutterLogo(size: 21),
              //             ),
              //             SizedBox(width: 15),
              //             Text(
              //               "Continue with Microsoft",
              //               style: TextStyle(
              //                 color: Color(0xff6f6f6f),
              //                 fontSize: 16,
              //                 fontFamily: "Inter",
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
