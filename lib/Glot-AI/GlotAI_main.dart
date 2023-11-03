import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/chats_provider.dart';
import 'providers/models_provider.dart';
import 'screens/chat_screen.dart';

class GlotAI extends StatelessWidget {
  const GlotAI({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'GlotBot',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Color.fromARGB(45, 12, 52, 255),
            appBarTheme: AppBarTheme(
              color: Colors.black,
            )),
        home: ChatScreen(),
      ),
    );
  }
}
